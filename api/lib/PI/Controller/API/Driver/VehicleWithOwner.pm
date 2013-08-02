package PI::Controller::API::Driver::VehicleWithOwner;

use Moose;
use JSON;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result => 'DB::Vehicle',

    create_roles => [qw/user/],

);
with 'PI::TraitFor::Controller::CheckRoleForPOST';

sub base : Chained('/api/driver/object') : PathPart('vehicle_with_owner') : CaptureArgs(0) { }

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle_owner_rs = $c->model('DB::VehicleOwner');
    my $vehicle_rs       = $c->model('DB::Vehicle');

    my $driver = $c->stash->{driver};

    my $params = {
        %{ $c->req->params },
        created_by => $c->user->id,
        driver_id  => $driver->id,
    };

    if ( $params->{driver_is_the_owner} ) {
        $params->{$_} = $driver->$_ for qw/
          name
          last_name
          cpf
          telephone_number
          mobile_provider
          mobile_number
          address
          city_id
          neighborhood
          complement
          number
          postal_code
          /;
        $params->{email}      = $driver->user->email;
        $params->{birth_date} = $driver->birth_date->datetime;

    }

    eval {
        $c->model('DB')->schema->txn_do(
            sub {

                my $owner_dm = $vehicle_owner_rs->check( for => 'upsert', with => $params );
                my $owner = $owner_dm->apply;

                die( $owner_dm->errors ) unless $owner_dm->success;

                $params->{vehicle_owner_id} = $owner->id;

                my $vehicle_dm = $vehicle_rs->check( for => 'create', with => $params );
                my $vehicle = $vehicle_dm->apply;

                die( $vehicle_dm->errors ) unless $vehicle_dm->success;

                $self->status_created(
                    $c,
                    location =>
                      $c->uri_for( $c->controller('API::Vehicle')->action_for('result'), [ $vehicle->id ] )->as_string,
                    entity => {
                        id               => $vehicle->id,
                        vehicle_owner_id => $owner->id
                    }
                );

            }
        );
    };

    if ( $@ && ref $@ eq 'HASH' ) {
        $self->status_bad_request( $c, message => encode_json($@) ), $c->detach;
    }
    elsif ($@) {
        $self->status_bad_request( $c, message => "$@" ), $c->detach;
    }

}

1;
