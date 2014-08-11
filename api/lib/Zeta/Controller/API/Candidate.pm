package Zeta::Controller::API::Candidate;

use Moose;
use Cwd qw();
use Image::Resize;
use File::Path qw(make_path remove_tree);

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Candidate',
    object_key 	=> 'candidate',
    result_attr => {
        prefetch => 'political_party'
    },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],

    search_ok => {
        political_party_id => 'Int'
    }
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('candidates') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $candidate	= $c->stash->{candidate};
    my @campaigns 	= $candidate->election_campaign_candidates;
    
    my @election_campaigns;
    foreach my $campaign ( @campaigns ) {
		my $aux = $campaign->search_related('election_campaign')->next;
		
		if($aux->is_active) {
			push(@election_campaigns, $aux->id);
		}
		
    }
    
    $self->status_ok(
        $c,
        entity => {
			election_campaigns => \@election_campaigns,
            (
                map { $_ => $candidate->$_, }
                  qw/
                  id
                  name
                  email
                  phone
                  img_profile
                  vice
                  website
                  government_program
                  gender
                  /
            ),
            political_party => {
                (
                    map { $_ => $candidate->political_party->$_, }
                    qw/
                    id
                    name
					acronym
					party_number
                    /
                )
            },
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $candidate 		= $c->stash->{candidate};

    $candidate->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $candidate = $c->stash->{candidate};

    my $params = $c->req->params;

    $candidate->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $candidate->id ] )->as_string,
        entity => { id => $candidate->id }
      ),
      $c->detach
      if $candidate;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    $self->status_ok(
        $c,
        entity => {
            candidates => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								email
								phone
								img_profile
								vice
								website
								government_program
								gender
                              /
                        ),
                        political_party => {
                            (
                                map { $_ => $r->{political_party}{$_}, }
                                qw/
                                id
								name
								acronym
								party_number
                                /
                            )
                        },
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                     }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $candidate = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $candidate->id ] )->as_string,
        entity => {
            id => $candidate->id
        }
    );
}

sub upload_file : Chained('base') : PathPart('upload_file') : Args(0) {
	my ( $self, $c ) = @_;
	
	my $file;
	
	my $path = Cwd::cwd();
	
	if( $c->req->params->{type} eq 'profile' ) {
	
		$path 	= $path.'/../web/root/static/images/candidates/'.$c->req->params->{candidate_id};
		$file	= 'profile_'.$c->req->params->{candidate_id};
	
	} elsif( $c->req->params->{type} eq 'program' ) {
	
		$path 	= $path.'/../etc/uploads/'.$c->req->params->{candidate_id};
		$file	= 'programa_de_governo';

	} elsif( $c->req->params->{type} eq 'promise' ) {
	
		$path 	= $path.'/../etc/uploads/'.$c->req->params->{candidate_id}.'/promises/'.$c->req->params->{promise_id};
		$file	= $c->req->params->{file_name};
		
	}
	
	my $upload 		= $c->req->upload('file');
	my $candidate 	= $c->model('DB::Candidate')->search( { id => $c->req->params->{candidate_id} } );
	
	if( $upload ) {
		
		my @type = split '/', $upload->type();
		
		$type[1] = 'jpg' unless $c->req->params->{type} ne 'profile';
		
 		eval {
			if( ! -d $path ) {
				make_path($path);
			}
			
			if( -e $path.'/'.$file.'.'.$type[1] ) {
				 unlink $path.'/'.$file.'.'.$type[1];
			}
			
			if( $c->req->params->{type} eq 'profile' ) {
				my $image 	= Image::Resize->new($upload->tempname);
				my $gd 		= $image->resize(116, 116);
				
				open(FH, '>'.$path.'/'.$file.'.'.$type[1]);
				print FH $gd->jpeg();
				close(FH);
				
				$candidate->update( { img_profile => $file.'.'.$type[1] } );
			} else {
				if( $c->req->params->{type} eq 'promise' ) {
					remove_tree( $path, {keep_root => 1} );
					
					$c->model('DB::PromiseContent')->search({
						promise_id => $c->req->params->{promise_id}
					})->delete;
				
					$upload->copy_to($path.'/'.$file);
					
				} else {
					$upload->copy_to($path.'/'.$file.'.'.$type[1]);
				}
			}
 		};

		$self->status_gone(
			$c,
			message => "Problem to upload document --- $@",
		),
		$c->detach
		if $@;
		
		if ( $c->req->params->{type} eq 'program' ) {
		
			$candidate->update( { government_program => $file.'.'.$type[1] } );
			
		} elsif ( $c->req->params->{type} eq 'promise' ) {
			
			my $promise_content_params = {
				name 			=> $file,
				source			=> $c->req->params->{source},
				promise_id 		=> $c->req->params->{promise_id},
				created_by		=> $c->req->params->{created_by},
				source_type_id	=> $c->req->params->{source_type_id},
				link			=> 
					'etc/uploads/'.$c->req->params->{candidate_id}.'/promises/'.$c->req->params->{promise_id}.'/'.$file,
			};
			
			$c->model('DB::PromiseContent')->execute( $c, for => 'create', with => $promise_content_params );
		}
		
	}
	
	$self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $c->req->params->{candidate_id} ] )->as_string,
        entity 		=> { id => $c->req->params->{candidate_id} }
	),
	$c->detach
	if $candidate;
}

1;