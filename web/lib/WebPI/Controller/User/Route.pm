package WebPI::Controller::User::Route;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('route') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result( $c, [ 'vehicle_routes', $id ], stash => 'vehicle_route_obj' );

    $c->detach( '/form/not_found', [] ) if $c->stash->{vehicle_route_obj}{error};

    for my $field (qw /start_time_gone start_time_back/) {
        $c->stash->{vehicle_route_obj}{$field} =
          substr( $c->stash->{vehicle_route_obj}{$field}, 0, -3 );    # tira os segundos
    }

    my @dow = @{ $c->stash->{vehicle_route_obj}{days_of_week} || [] };
    $c->stash->{dow}{$_} = 'checked="checked"' for @dow;

}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

sub edit : Chained('object') : PathPart('') : Args(0) {
}

sub add : Chained('base') : PathPart('new') : Args(0) {
    my ( $self, $c ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;
