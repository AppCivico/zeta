package PI::Controller::API::VehicleTokenCheck;

use Moose;
use DateTime;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result => 'DB::Vehicle',

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
                    map { $_ => $vehicle->$_, }
                      qw/
                      id
                      model
                      brand_name
                      manufacture_year
                      /
                ),
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
