package Zeta::Controller::API::Promise;

use Moose;
use utf8;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Promise',
    object_key 	=> 'promise',
    result_attr => {
        prefetch =>  [
			{ 'candidate' => 'political_party' },
			{'election_campaign' => 'political_position'},
			'category',
			'state',
			'city'
		]
    },
    searck_ok => {
		candidate_id	=> 'Int',
		city_id			=> 'Int',
		state_id		=> 'Int',
		country_id		=> 'Int'
    },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user admin/],
    delete_roles => [qw/superadmin user admin/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('promises') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $promise 	= $c->stash->{promise};
#     my %attrs    	= $promise->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $promise->$_, }
                  qw/
					id
					name
					description
					created_by
					source
					city_id
					state_id
					country_id
                  /
            ),
            candidate => {
                (
                    map { $_ => $promise->candidate->$_, }
                    qw/
                    id
                    name
                    /
                ),
                political_party => {
					(
						map { $_ => $promise->candidate->political_party->$_, }
						qw/
						id
						name
						acronym
						party_number
						/
					)
                }
            },
            category => {
                (
                    map { $_ => $promise->category->$_, }
                    qw/
                    id
                    name
                    /
                ),
			},
			election_campaign => {
				(
					map { $_ => $promise->election_campaign->$_, }
					qw/
					id
					year
					/
				),
				political_position => {
					map { $_ => $promise->election_campaign->political_position->$_, }
					qw/
					id
					position
					/
				},
			},
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $promise		= $c->stash->{promise};

    $promise->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $promise = $c->stash->{promise};

    my $params = $c->req->params;

    $promise->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $promise->id ] )->as_string,
        entity 		=> { id => $promise->id }
      ),
      $c->detach
      if $promise;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};
    
    my %conditions;
    
    if( $c->req->params->{state_id} ) {
		$conditions{'me.state_id'} = $c->req->params->{state_id};
    }
    
    if( $c->req->params->{candidate_id} ) {
		$conditions{'me.candidate_id'} = $c->req->params->{candidate_id};
    }

    if( $c->req->params->{category_id} ) {
		$conditions{'me.category_id'} = $c->req->params->{category_id};
    }

    $self->status_ok(
        $c,
        entity => {
            promises => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								description
								created_by
								source
								city_id
								state_id
								country_id
                              /
                        ),
                        candidate => {
							(
								map { $_ => $r->{candidate}{$_}, }
								qw/
								id
								name
								/
							),
							political_party => {
								(
									map { $_ => $r->{candidate}{political_party}{$_}, }
									qw/
									id
									name
									acronym
									party_number
									/
								)
							}
						},
						category => {
							(
								map { $_ => $r->{category}{$_}, }
								qw/
								id
								name
								/
							),
						},
						election_campaign => {
							(
								map { $_ => $r->{election_campaign}{$_}, }
								qw/
								id
								year
								city_id
								state_id
								country_id
								/
							),
							political_position => {
								map { $_ => $r->{election_campaign}{political_position}{$_}, }
								qw/
								id
								position
								/
							},
						},
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                     }
                } $rs->search(%conditions ? %{ \%conditions }: undef)->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $promise = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $promise->id ] )->as_string,
        entity => {
            id => $promise->id
        }
    );
}

1;