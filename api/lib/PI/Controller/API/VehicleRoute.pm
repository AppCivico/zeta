package PI::Controller::API::VehicleRoute;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleRoute',
    object_key => 'vehicle_route',

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
    my %attrs         = $vehicle_route->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  name
                  start_time_gone
                  start_time_back
                  origin
                  origin_lat_lng
                  destination
                  destination_lat_lng
                  /
            ),
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
                              origin
                              origin_lat_lng
                              destination
                              destination_lat_lng
                              vehicle_id
                              /
                        )
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
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
