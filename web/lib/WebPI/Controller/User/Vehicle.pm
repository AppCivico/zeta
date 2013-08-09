package WebPI::Controller::User::Vehicle;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('vehicle') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result(
        $c,
        ['vehicles', $id],
        stash => 'vehicle_obj'
    );

    $c->detach( '/form/not_found', [] ) if $c->stash->{vehicle_obj}{error};
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;
}

sub edit: Chained('object') : PathPart('') : Args(0) {
}

__PACKAGE__->meta->make_immutable;

1;