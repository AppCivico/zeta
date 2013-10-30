package PI::Controller::API::Vehicle;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::Vehicle',
    object_key  => 'vehicle',
    result_attr => {
        prefetch => [
            'vehicle_model',
            'vehicle_brand',
            'vehicle_color',
            'vehicle_body_style',
            'driver'
        ]
    },

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

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $vehicle->$_ }
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
            ( map { $_ => ( $vehicle->$_ ? $vehicle->$_->datetime : undef ) } qw/created_at/ ),
            driver     => {
                (
                    map { $_ => $vehicle->driver->$_ }
                    qw/
                    id
                    name
                    gender
                    documents_validated
                    /
                ),
                ( map { $_ => ( $vehicle->driver->$_ ? $vehicle->driver->$_->datetime : undef ) } qw/birth_date/ ),
            },
            model      => { ( map { $_ => $vehicle->vehicle_model->$_ } qw/id name/ ), },
            color      => { ( map { $_ => $vehicle->vehicle_color->$_ } qw/id name/ ), },
            brand      => { ( map { $_ => $vehicle->vehicle_brand->$_ } qw/id name/ ), },
            body_style => { ( map { $_ => $vehicle->vehicle_body_style->$_ } qw/id name/ ), },
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

    my $rs = $c->stash->{collection};

    if($c->req->params->{available_user}) {
        $rs = $rs->search({
            'me.id' => {'not in' => \"(select vehicle_id from campaign_vehicle)"}
        });
    }

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
                        driver     => {
                            (
                                map { $_ => $r->{driver}{$_} }
                                    qw/
                                    id
                                    name
                                    gender
                                    birth_date
                                    documents_validated
                                    /
                            ),
                        },
                        model      => { ( map { $_ => $r->{vehicle_model}{$_} } qw/id name/ ), },
                        color      => { ( map { $_ => $r->{vehicle_color}{$_} } qw/id name/ ), },
                        brand      => { ( map { $_ => $r->{vehicle_brand}{$_} } qw/id name/ ), },
                        body_style => { ( map { $_ => $r->{vehicle_body_style}{$_} } qw/id name/ ), },
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string,
                      }
                } $rs->as_hashref->all
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
