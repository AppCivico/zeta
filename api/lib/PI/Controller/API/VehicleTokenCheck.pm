package PI::Controller::API::VehicleTokenCheck;

use Moose;
use DateTime;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result => 'DB::Vehicle',
    result_attr => {
        prefetch =>
            [ 'vehicle_model', 'vehicle_brand', 'vehicle_color', 'vehicle_body_style' ]
    },

);
with 'PI::TraitFor::Controller::AutoBase';

sub base : Chained('/api/base') : PathPart('vehicle_token_check') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(0) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    eval {
        my $vehicle = $c->stash->{collection}->search( { car_plate => $c->req->params->{car_plate} } )->next;

        die { 'car_plate.invalid' => 1 } unless $vehicle;

        my $token = $vehicle->vehicle_tokens->search(
            {
                token   => $c->req->params->{token},
                used_at => undef
            }
        )->next;

        die { 'token.invalid' => 1 } unless $token;

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
                model      => { ( map { $_ => $vehicle->vehicle_model->$_ } qw/name/ ), },
                color      => { ( map { $_ => $vehicle->vehicle_color->$_ } qw/name/ ), },
                brand      => { ( map { $_ => $vehicle->vehicle_brand->$_ } qw/name/ ), },
                body_style => { ( map { $_ => $vehicle->vehicle_body_style->$_ } qw/name/ ), },
                ( map { $_ => ( $vehicle->$_ ? $vehicle->$_->datetime : undef ) } qw/created_at/ ),
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
