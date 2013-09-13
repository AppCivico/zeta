package WebPI::Controller::User::RouteType;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('route_type') : CaptureArgs(0) {
}

sub add: Chained('base') : PathPart('new') : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{without_wrapper} = 1 if exists $c->req->params->{no_wrapper};

    my $api = $c->model('API');
    $api->stash_result( $c, 'states' );
    $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];
}

__PACKAGE__->meta->make_immutable;

1;
