package WebPI::Controller::User::RouteType;
use Moose;
use namespace::autoclean;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('route_type') : CaptureArgs(0) {
}

sub add : Chained('base') : PathPart('new') : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{without_wrapper} = 1 if exists $c->req->params->{no_wrapper};

    my $api = $c->model('API');
    $api->stash_result( $c, 'states' );
    $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];
}

sub load_parking : Chained('base') : PathPart('load_parking') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    my $id = $c->req->params->{id};

    $api->stash_result( $c, [ 'vehicle_route_types', $id ], stash => 'load_parking', );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    elsif ( $c->stash->{load_parking}{vehicle_parking}{id} ) {

        $c->res->body(
            encode_json(
                {
                    vehicle_parking      => $c->stash->{load_parking}{vehicle_parking}{id},
                    name                 => $c->stash->{load_parking}{vehicle_parking}{name},
                    address              => $c->stash->{load_parking}{vehicle_parking}{address}{address},
                    number               => $c->stash->{load_parking}{vehicle_parking}{address}{number},
                    lat_lng              => $c->stash->{load_parking}{vehicle_parking}{address}{lat_lng},
                    vehicle_parking_type => $c->stash->{load_parking}{vehicle_parking}{vehicle_parking_type_id},
                }
            )
        );

    }
    else {
        $c->res->body( encode_json( { vehicle_parking => 0 } ) );
    }

    $c->response->content_type('application/json');
    $c->res->headers->header( 'charset' => 'utf-8');
    $c->detach;
}

__PACKAGE__->meta->make_immutable;

1;
