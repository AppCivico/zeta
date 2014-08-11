package Zeta::Controller::API::Organization;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Organization',
    object_key 	=> 'organization',
    result_attr => {
		prefetch => [ { 'city' => 'state' } ]
    },
    search_ok => {
		id => 	'Int'
    },

    update_roles => [qw/superadmin user admin webapi organization/],
    create_roles => [qw/superadmin admin webapi/],
    delete_roles => [qw/superadmin admin webapi/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('organizations') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $organization 	= $c->stash->{organization};
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $organization->$_, }
                  qw/
                  id
                  name
                  address
                  postal_code
                  description
                  phone
                  email
                  website
                  complement
				  number
                  /
            ),
            city => {
				(
					map { $_ => $organization->city->$_, }
					qw/
						id
						name
					/
				),
				state => {
					(
						map { $_ => $organization->city->state->$_, }
						qw/
						id
						name
						/
					)
				}
            }
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $organization 		= $c->stash->{organization};

    $organization->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $organization = $c->stash->{organization};

    my $params = $c->req->params;

    $organization->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $organization->id ] )->as_string,
        entity => { id => $organization->id }
      ),
      $c->detach
      if $organization;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    $self->status_ok(
        $c,
        entity => {
            organizations => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								address
								postal_code
								description
								phone
								email
								website
								complement
								number
                              /
                        ),
                        city => {
							(
								map { $_ => $r->{city}{$_}, }
								qw/
									id
									name
								/
							),
							state => {
								(
									map { $_ => $r->{city}{state}{$_}, }
									qw/
									id
									name
									/
								)
							}
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

    my $organization = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $organization->id ] )->as_string,
        entity => {
            id => $organization->id
        }
    );
}

sub complete : Chained('base') : PathPart('complete') : Args(0) {
    my ( $self, $c ) = @_;

    my $organization;

    $c->model('DB')->txn_do(
        sub {
            $organization = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

            $c->req->params->{is_active} 		= 1;
            $c->req->params->{role} 			= 'organization';
            $c->req->params->{organization_id} 	= $organization->id;

            my $user = $c->model('DB::User')->execute( $c, for => 'create', with => $c->req->params );
        }
    );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $organization->id ] )->as_string,
        entity => {
            id => $organization->id
        }
    );

}

1;