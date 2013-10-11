package PI::Controller::API::VehicleRoute;
use utf8;
use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::VehicleRoute',
    object_key  => 'vehicle_route',
    result_attr => {
        prefetch => [ { 'origin' => 'address' }, { 'destination' => 'address' }, { 'vehicle_parking' => 'address' } ]
    },

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        vehicle_id => 'Int',
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_routes') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_route = $c->stash->{vehicle_route};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $vehicle_route->$_ }
                  qw/
                  id
                  name
                  days_of_week
                  start_time_gone
                  start_time_back
                  /
            ),
            origin => {
                ( map { $_ => $vehicle_route->origin->$_ } qw/id name/ ),

                address => {
                    (
                        map { $_ => $vehicle_route->origin->address->$_ }
                          qw/
                          id
                          address
                          number
                          neighborhood
                          postal_code
                          lat_lng
                          user_id
                          /
                    ),
                },
            },
            destination => {
                ( map { $_ => $vehicle_route->destination->$_ } qw/id name/ ),

                address => {
                    map { $_ => $vehicle_route->origin->address->$_ }
                      qw/
                      id
                      address
                      number
                      neighborhood
                      postal_code
                      lat_lng
                      user_id
                      /
                }
            },
            vehicle_parking => {
                (
                    map { $_ => $vehicle_route->vehicle_parking->$_ }
                      qw/
                      id
                      name
                      vehicle_parking_type_id
                      /
                ),

                address => {
                    map { $_ => $vehicle_route->vehicle_parking->address->$_ }
                      qw/
                      id
                      address
                      number
                      neighborhood
                      postal_code
                      lat_lng
                      user_id
                      /
                }
            },
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $vehicle_route = $c->stash->{vehicle_route};

    $vehicle_route->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_route = $c->stash->{vehicle_route};

    $vehicle_route->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_route->id ] )->as_string,
        entity => { vehicle_id => $vehicle_route->vehicle_id, id => $vehicle_route->id }
      ),
      $c->detach
      if $vehicle_route;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    if ( $c->req->params->{check_dow} ) {
        my $rs = $c->model('DB::ViewDaysOfWeek');

        my $data = $rs->search_rs(
            undef,
            {
                bind  => [ $c->req->params->{vehicle_id}, $c->req->params->{vehicle_id} ],
            }
        )->next;

        $self->status_ok(
            $c,
            entity => {
                dow => $data->get_column('dow')
            }
        );

    } else {

        $self->status_ok(
            $c,
            entity => {
                vehicle_routes => [
                    map {
                        my $r = $_;
                        +{
                            (
                                map { $_ => $r->{$_} }
                                qw/
                                id
                                name
                                start_time_gone
                                start_time_back
                                vehicle_id
                                days_of_week
                                /
                            ),
                            origin => {
                                ( map { $_ => $r->{origin}{$_} } qw/id name/ ),

                                address => {
                                    map { $_ => $r->{origin}{address}{$_} }
                                    qw/
                                    id
                                    address
                                    number
                                    neighborhood
                                    postal_code
                                    lat_lng
                                    user_id
                                    /
                                }
                            },
                            destination => {
                                ( map { $_ => $r->{destination}{$_} } qw/id name/ ),

                                address => {
                                    map { $_ => $r->{destination}{address}{$_} }
                                    qw/
                                    id
                                    address
                                    number
                                    neighborhood
                                    postal_code
                                    lat_lng
                                    user_id
                                    /
                                }
                            },
                            vehicle_parking => {
                                (
                                    map { $_ => $r->{vehicle_parking}{$_} }
                                    qw/
                                    id
                                    name
                                    vehicle_parking_type_id
                                    /
                                ),

                                address => {
                                    map { $_ => $r->{vehicle_parking}{address}{$_} }
                                    qw/
                                    id
                                    address
                                    number
                                    neighborhood
                                    postal_code
                                    lat_lng
                                    user_id
                                    /
                                }
                            },
                        }
                    } $c->stash->{collection}->as_hashref->all
                ]
            }
        );
    }
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle_route = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_route->id ] )->as_string,
        entity => {
            id => $vehicle_route->id
        }
    );

}

1;
