package PI::Controller::API::VehicleParking;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleParking',
    object_key => 'vehicle_parking',
    result_attr => {
        prefetch => ['vehicle_parking_type', 'address']
    },

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        vehicle_id => 'Int',
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_parking') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_parking = $c->stash->{vehicle_parking};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $vehicle_parking->$_ }
                  qw/
                  id
                  arrival_time
                  departure_time
                  vehicle_id
                  name
                  /
            ),
            ( map { $_ => $vehicle_parking->$_->datetime } qw/created_at/ ),
            type => {
                ( map { $_ => $vehicle_parking->vehicle_parking_type->$_ } qw /id name/ )
            },
            address => {
                    (
                    map { $_ => $vehicle_parking->address->$_ }
                        qw/
                        id
                        address
                        number
                        neighborhood
                        postal_code
                        lat_lng
                        user_id
                        /
                    )
            }
        }
    );
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $vehicle_parking = $c->stash->{vehicle_parking};

    $vehicle_parking->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_parking = $c->stash->{vehicle_parking};

    $vehicle_parking->execute( $c, for => 'update', with => { %{ $c->req->params }, created_by => $c->user->id } );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_parking->id ] )->as_string,
        entity => { vehicle_id => $vehicle_parking->vehicle_id, id => $vehicle_parking->id }
      ),
      $c->detach
      if $vehicle_parking;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_parking => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              arrival_time
                              departure_time
                              vehicle_id
                              created_at
                              vehicle_id
                              name
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string,
                        type => {
                            ( map { $_ => $r->{vehicle_parking_type}{$_} } qw /id name/ )
                        },
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
                                )
                        }
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle_parking = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_parking->id ] )->as_string,
        entity => {
            id => $vehicle_parking->id
        }
    );

}

1;
