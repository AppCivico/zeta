package Zeta::Controller::API::Coalition;

use Moose;
use JSON::XS;
use utf8;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Coalition',
    object_key 	=> 'coalition',
    search_ok => {
		order 					=> 'Str',
		is_active 				=> 'Int',
		election_campaign_id 	=> 'Int',
    },
    result_attr => {
		prefetch => { 
			'election_campaign' => [ 'political_position', 'state', 'city' ]
		}
    },

    update_roles => [qw/superadmin user admin organization/],
    create_roles => [qw/superadmin user admin organization/],
    delete_roles => [qw/superadmin user admin organization/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('coalitions') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $coalition 	= $c->stash->{coalition};
    my %attrs    	= $coalition->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $coalition->$_, }
                  qw/
					id
					name
					election_campaign_id
					is_active
                  /
            ),
            ( map { $_ => ( $coalition->$_ ? $coalition->$_->datetime : undef ) } qw/created_at/ ),
            election_campaign => {
				(
					map { $_ => $coalition->election_campaign->$_, }
					qw/
					id
					year
					city_id
					state_id
					/
				),
				political_position => {
					map { $_ => $coalition->election_campaign->political_position->$_, }
					qw/
					id
					position
					/
				},
				state => $coalition->election_campaign->state ? {
					map { $_ => $coalition->election_campaign->state->$_, }
					qw/
					id
					uf
					/
				} : undef,
				city => $coalition->election_campaign->city ? {
					map { $_ => $coalition->election_campaign->city->$_, }
					qw/
					id
					name
					/
				} : undef,
            }
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $coalition		= $c->stash->{coalition};

    $coalition->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $coalition = $c->stash->{coalition};

    my $params = $c->req->params;

    $coalition->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $coalition->id ] )->as_string,
        entity 		=> { id => $coalition->id }
      ),
      $c->detach
      if $coalition;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    my $rs = $c->stash->{collection};
    
    my %conditions;
    if( $c->req->params->{organization_state_id} ) {
		$conditions{'-or'} = {
			'election_campaign.state_id' 				=> $c->req->params->{organization_state_id},
			'election_campaign.political_position_id' 	=> 1
		};
    }

    my $count;
    
    if( $c->req->params->{pagination} ) {
		$count = $rs->search( %conditions ? { %conditions } :  undef )->count;

		$rs = $rs->search(
			%conditions ? { %conditions } : undef,
			{
				page 	=> $c->req->params->{page},
				rows 	=> 10,
			},
		);
	} else {
		$rs = $rs->search(
			%conditions ? { %conditions } : undef,
		);
	}

    $self->status_ok(
        $c,
        entity => {
            coalitions => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								election_campaign_id
								created_at
								is_active
                              /
                        ),
                        election_campaign => {
							(
								map { $_ => $r->{election_campaign}{$_}, }
								qw/
								id
								year
								city_id
								state_id
								/
							),
							political_position => {
								map { $_ => $r->{election_campaign}{political_position}{$_}, }
								qw/
								id
								position
								/
							},
							state => {
								map { $_ => $r->{election_campaign}{state}{$_}, }
								qw/
								id
								uf
								/
							},
							city => {
								map { $_ => $r->{election_campaign}{city}{$_}, }
								qw/
								id
								name
								/
							},
						},	
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                     }
                } $rs->as_hashref->all
            ],
            count => $count
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $coalition = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $coalition->id ] )->as_string,
        entity => {
            id => $coalition->id
        }
    );
}

sub get_parties : Chained('base') : PathPart('get_parties') : Args(1) {
	my ( $self, $c, $coalition_id ) = @_;
	
	my $parties_rs = 
		$c->model('DB::CoalitionsPoliticalParty')->search_rs( { coalition_id => $coalition_id } );
	
	
	$self->status_ok(
        $c,
        entity => {
            parties => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								acronym
                              /
                        ),
                     }
                } $parties_rs->search_related('political_party')->as_hashref->all
            ]
        }
    );
}

sub add_parties : Chained('base') : PathPart('add_parties') : Args(0) {
	my ( $self, $c ) = @_;
	
	my $data	= decode_json( $c->req->params->{data} );
    my $msg     = 'OK';

    eval { my $coalition_candidates = $c->model('DB::CoalitionsPoliticalParty')->populate(\@$data); };

    $msg = $@ unless $@;

    $self->status_ok(
        $c,
        entity => {
            'created' => $msg
        }
    );
    
}

sub remove_party_relation : Chained('base') : PathPart('remove_party_relation') : Args(1) {
	my ( $self, $c, $coalition_id ) = @_;
	
	$c->model('DB::CoalitionsPoliticalParty')->search( 
		{ 
			coalition_id 		=> $coalition_id,
			political_party_id	=> $c->req->params->{party_id}
		} 
	)->delete;
	
	$self->status_no_content($c);
}

1;