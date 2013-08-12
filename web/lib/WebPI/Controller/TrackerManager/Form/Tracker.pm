package WebPI::Controller::TrackerManager::Form::Tracker;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('tracker') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $params  = $c->req->params;

    $api->stash_result(
        body   => [
            $c, [ 'trackers'],
            method => 'POST',
            body   => $params
        ]
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {
        $c->detach( '/form/redirect_ok', [ '/trackermanager/tracker/index', {}, 'Cadastrado com sucesso!' ] );
    }
}

sub process_edit : Chained('base') : PathPart('tracker') : Args(1) {
    my ( $self, $c, $id) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'vehicles', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/user/vehicle/index', {}, 'Alterado com sucesso!' ] );
    }
}



__PACKAGE__->meta->make_immutable;

1;
