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
			'city',
			'state',
			'category',
			'created_by',
			'source_type',
			{ 'candidate' 			=> 'political_party' },
			{ 'election_campaign' 	=> 'political_position' },
		]
    },
    searck_ok => {
		candidate_id	=> 'Int',
		city_id			=> 'Int',
		state_id		=> 'Int',
		country_id		=> 'Int'
    },

    update_roles => [qw/superadmin admin organization/],
    create_roles => [qw/superadmin admin organization/],
    delete_roles => [qw/superadmin admin organization/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('promises') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $promise = $c->stash->{promise};
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $promise->$_, }
                  qw/
					id
					name
					description
					source
					city_id
					state_id
					country_id
					external_link
                  /
            ),
            ( map { $_ => ( $promise->$_ ? $promise->$_->datetime : undef ) } qw/created_at publication_date/ ),
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
			created_by => {
                (
                    map { $_ => $promise->created_by->$_, }
                    qw/
                    id
                    name
                    /
                ),
			},
			source_type => $promise->source_type ? {
                (
                    map { $_ => $promise->source_type->$_, }
                    qw/
                    id
                    name
                    /
                ),
			} : undef,
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

    $c->model('DB')->txn_do(sub { 
		$promise->search_related('promise_contents')->delete;
		
		$promise->delete;
    });

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
		if( $c->req->params->{state_id} eq 'br' ) {
			$conditions{'me.country_id'} = 1;
		} else {
			$conditions{'me.state_id'} = $c->req->params->{state_id};
		}
    }
    
    if( $c->req->params->{org_state_id} ) {
		$conditions{'-or'} 	= {
			'me.state_id'	=> $c->req->params->{state_id},
			'me.country_id'	=> 1
  		};
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
								created_at
								source
								city_id
								state_id
								country_id
								publication_date
								external_link
                              /
                        ),
                        candidate => {
							(
								map { $_ => $r->{candidate}{$_}, }
								qw/
								id
								name
								img_profile
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
						created_by => {
							(
								map { $_ => $r->{created_by}{$_}, }
								qw/
								id
								name
								/
							),
						},
						source_type => $r->{source_type} ? {
							(
								map { $_ => $r->{source_type}{$_}, }
								qw/
								id
								name
								/
							),
						} : undef,
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
                } $rs->search( %conditions ? %{ \%conditions }: undef )->as_hashref->all
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