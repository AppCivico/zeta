package PI::Controller::API::VehicleParkingType;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleParkingType',
    object_key => 'vehicle_parking_type',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_parking_types') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_parking_type = $c->stash->{vehicle_parking_type};
    my %attrs   = $vehicle_parking_type->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                    qw/
                    id
                    name
                    /
            ),
        }
    );
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $vehicle_parking_type = $c->stash->{vehicle_parking_type};

    $vehicle_parking_type->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_parking_type = $c->stash->{vehicle_parking_type};

    $vehicle_parking_type->execute( $c, for => 'update', with => { %{ $c->req->params }, created_by => $c->user->id } );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_parking_type->id ] )->as_string,
        entity => { id => $vehicle_parking_type->id }
      ),
      $c->detach
      if $vehicle_parking_type;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_parking_types => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              name
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string,
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle_parking_type = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_parking_type->id ] )->as_string,
        entity => {
            id => $vehicle_parking_type->id
        }
    );

}

1;