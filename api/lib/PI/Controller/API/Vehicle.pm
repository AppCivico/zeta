package PI::Controller::API::Vehicle;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::Vehicle',
    object_key => 'vehicle',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        driver_id => 'Int',
      }

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicles') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{vehicle};
    my %attrs   = $vehicle->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw(
                  id
                  renavam
                  car_plate
                  doors_number
                  manufacture_year
                  vehicle_model_id
                  model_year
                  vehicle_brand_id
                  vehicle_body_style_id
                  km
                  vehicle_color_id
                  fuel_type
                  observations
                  vehicle_owner_id
                  driver_id
                  state_id
                  city_id
                  )
            ),
            ( map { $_ => ( $attrs{$_} ? $attrs{$_}->datetime : undef ) } qw/created_at/ ),

        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{vehicle};

    $vehicle->execute( $c, for => 'update', with => { %{ $c->req->params }, created_by => $c->user->id } );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle->id ] )->as_string,
        entity => { model => $vehicle->vehicle_model_id, id => $vehicle->id }
      ),
      $c->detach
      if $vehicle;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{vehicle};

    $vehicle->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicles => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                renavam
                                car_plate
                                doors_number
                                manufacture_year
                                vehicle_model_id
                                model_year
                                vehicle_brand_id
                                vehicle_body_style_id
                                km
                                vehicle_color_id
                                fuel_type
                                observations
                                vehicle_owner_id
                                driver_id
                                state_id
                                city_id
                                created_at
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle->id ] )->as_string,
        entity => {
            model     => $vehicle->vehicle_model_id,
            id        => $vehicle->id,
            car_plate => $vehicle->car_plate
        }
    );

}

1;
