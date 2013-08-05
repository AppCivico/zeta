package WebPI::Controller::User::Parking;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('parking') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result(
        $c,
        ['vehicle_parking', $id],
        stash => 'vehicle_parking_obj'
    );

    $c->detach( '/form/not_found', [] ) if $c->stash->{vehicle_parking_obj}{error};

    for my $field (qw /departure_time entry_time/){
        $c->stash->{vehicle_parking_obj}{$field} = substr($c->stash->{vehicle_parking_obj}{$field}, 0, -3); # tira os segundos
    }
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

sub edit: Chained('object') : PathPart('') : Args(0) {
}

sub add: Chained('base') : PathPart('new') : Args(0) {
    my ( $self, $c ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;