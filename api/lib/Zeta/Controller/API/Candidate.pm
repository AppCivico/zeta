package Zeta::Controller::API::Candidate;

use Moose;
use Cwd qw();
use Image::Resize;

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
	my $field;
	my $path 	= Cwd::cwd();
	
	if( $c->req->params->{type} eq 'profile' ) {
	
		$path 	= $path.'/../web/root/static/images/candidates/'.$c->req->params->{candidate_id};
		$file	= 'profile_'.$c->req->params->{candidate_id};
		$field	= 'img_profile';
		
	} elsif( $c->req->params->{type} eq 'program' ) {
	
		$path 	= $path.'/../etc/uploads/'.$c->req->params->{candidate_id};
		$file	= 'programa_de_governo';
		$field	= 'government_program';
	}
	
	my $upload = $c->req->upload('file');
	
	my $candidate = $c->model('DB::Candidate')->search( { id => $c->req->params->{candidate_id} } );
	if( $upload ) {
		
		my @type = split '/', $upload->type();
		
		if( ! -d $path ) {
			mkdir($path);
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
			
			$candidate->update( { $field => $file } );
		} else {
			eval { $upload->copy_to($path.'/'.$file.'.'.$type[1]); };
			
			$candidate->update( { $field => 1 } );
		}
	}
	
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $c->req->params->{candidate_id} ] )->as_string,
        entity => { id => $c->req->params->{candidate_id} }
      ),
      $c->detach
      if $candidate;
}

1;