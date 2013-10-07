package WebPI::Controller::User::VehicleTracker;
use Moose;
use namespace::autoclean;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('vehicle_tracker') : CaptureArgs(0) {
}

sub index : Chained('base') : PathPart('index') : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{without_wrapper} = 1 if exists $c->req->params->{no_wrapper};
}

sub get_positions : Chained('base') : PathPart('get_positions') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    my $params = { %{ $c->req->params } };
    $form->format_date( $params, 'date' );

    $api->stash_result(
        $c,
        ['vehicle_trackers'],
        stash => 'vehicle_trackers',
        params => {
            vehicle_id  => $params->{vehicle_id},
            date        => $params->{date},
            order       => 'track_event'
        }
    );

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );

    if( $c->stash->{vehicle_trackers} ) {
        $c->res->body(encode_json($c->stash->{vehicle_trackers}));
    } else {
        $c->res->body(0);
    }
}

__PACKAGE__->meta->make_immutable;

1;