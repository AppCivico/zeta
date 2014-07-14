package Zeta::Controller::API::ElectionCampaign;

use Moose;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::ElectionCampaign',
    object_key 	=> 'election_campaign',
    result_attr => {
		prefetch => 'political_position'
    },
#     search_ok => {
#         state_id 	=> 'Int',
#         city_id		=> 'Int',
#         country_id	=> 'Int'
#     },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user admin/],
    delete_roles => [qw/superadmin user admin/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('election_campaigns') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $election_campaign = $c->stash->{election_campaign};
#     my %attrs    	= $election_campaign->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $election_campaign->$_, }
                  qw/
					id
					year
					state_id
					city_id
					country_id
					political_position_id
					elected_candidate_id
					is_active
                  /
            ),
            political_position => {
				map { $_ => $election_campaign->political_position->$_, }
				qw/
				 id
				 position
				/
            }
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 		= @_;
    my $election_campaign	= $c->stash->{election_campaign};

    $election_campaign->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $election_campaign = $c->stash->{election_campaign};

    my $params = $c->req->params;

    $election_campaign->execute( $c, for => 'update', with => $params );
    
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $election_campaign->id ] )->as_string,
        entity 		=> { id => $election_campaign->id }
      ),
      $c->detach
      if $election_campaign;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    my $rs = $c->stash->{collection};
    
    my %conditions;
    if( $c->req->params->{filter} ) {
		if( $c->req->params->{state_id} ) {
			$conditions{state_id} = $c->req->params->{state_id};
		}
		if( $c->req->params->{city_id} ) {
			$conditions{city_id} = $c->req->params->{city_id};
		}
		
		$conditions{is_active} 				= 1,
		$conditions{year} 					= $c->req->params->{year},
		$conditions{political_position_id} 	= $c->req->params->{political_position_id},
    }

    $self->status_ok(
        $c,
        entity => {
            election_campaigns => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								year
								state_id
								city_id
								country_id
								political_position_id
								elected_candidate_id
								is_active
                              /
                        ),
                        political_position => {
							map { $_ => $r->{political_position}{$_}, }
							qw/
							id
							position
							/
						},
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                     }
                } $rs->search( \%conditions ? %{ \%conditions }: undef )->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $election_campaign = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $election_campaign->id ] )->as_string,
        entity => {
            id => $election_campaign->id
        }
    );
}

sub add_candidates : Chained('base') : PathPart('add_candidates') : Args(0) {
	my ( $self, $c ) = @_;
	
	my $data	= decode_json( $c->req->params->{data} );
    my $msg     = 'OK';

    eval { my $election_campaign_candidate = $c->model('DB::ElectionCampaignCandidate')->populate(\@$data); };

    $msg = $@ unless $@;

    $self->status_ok(
        $c,
        entity => {
            'created' => $msg
        }
    );
    
}

sub get_candidates : Chained('base') : PathPart('get_candidates') : Args(1) {
	my ( $self, $c, $election_campaign_id ) = @_;
	
	my $candidates_rs = 
		$c->model('DB::ElectionCampaignCandidate')->search_rs( { election_campaign_id => $election_campaign_id } );
	
	
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
                              /
                        ),
                     }
                } $candidates_rs->search_related('candidate')->as_hashref->all
            ]
        }
    );
}

sub remove_candidates_relation : Chained('base') : PathPart('remove_candidate_relation') : Args(1) {
	my ( $self, $c, $election_campaign_id ) = @_;
	
	$c->model('DB::ElectionCampaignCandidate')->search( 
		{ 
			election_campaign_id 	=> $election_campaign_id,
			candidate_id 			=> $c->req->params->{candidate_id}
		} 
	)->delete;
	
	$self->status_no_content($c);
}
1;