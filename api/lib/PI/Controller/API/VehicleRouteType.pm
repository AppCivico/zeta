package PI::Controller::API::VehicleRouteType;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleRouteType',
    object_key => 'vehicle_route_type',
    result_attr => {
        prefetch => ['address']
    },

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user webapi/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        "address.user_id" => 'Int',
        order   => 'Str'
    }

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_route_types') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_route_type = $c->stash->{vehicle_route_type};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $vehicle_route_type->$_ }
                  qw/
                  id
                  name
                  address_id
                  user_id
                  /
            ),
            address => {
                (
                    map { $_ => $vehicle_route_type->address->$_ }
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
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $vehicle_route_type = $c->stash->{vehicle_route_type};

    $vehicle_route_type->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_route_type = $c->stash->{vehicle_route_type};

    $vehicle_route_type->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_route_type->id ] )->as_string,
        entity => { id => $vehicle_route_type->id }
      ),
      $c->detach
      if $vehicle_route_type;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_route_types => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              name
                              address_id
                              user_id
                              /
                        ),
                        address => {
                            (
                                map { $_ => $r->{address}{$_} }
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
                    }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle_route_type = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_route_type->id ] )->as_string,
        entity => {
            id => $vehicle_route_type->id,
            name => $vehicle_route_type->name,
        }
    );

}

1;