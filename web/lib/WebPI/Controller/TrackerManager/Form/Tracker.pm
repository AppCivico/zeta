package WebPI::Controller::TrackerManager::Form::Tracker;
use Moose;
use namespace::autoclean;
use DateTime;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('tracker') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $params  = $c->req->params;

     $api->stash_result(
        $c, [ 'trackers'],
        method => 'POST',
        body   => $params
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
        $c, [ 'trackers', $id],
        method => 'PUT',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/trackermanager/tracker/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_tracker') : Args(1) {
    my ( $self, $c, $id) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'trackers', $id ],
        method => 'DELETE'
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/trackermanager/tracker/index', {}, 'Removido com sucesso!' ] );
    }
}

sub check_token: Chained('base') : PathPart('check_token'): Args(0) {
    my ( $self, $c )    = @_;
    my $api             = $c->model('API');

    my $result = $api->stash_result(
        $c, ['vehicle_token_check'],
        params  => $c->req->params
    );

    if($result->{error}) {
        $c->stash(error => $result->{error});
    }

    $api->stash_result(
        $c, ['trackers'],
        params  => {available => 1}
    );

    $c->stash(
        without_wrapper => 1,
        template => 'trackermanager/tracker/check_token.tt',
        result   => $result,
        trackers => [ map { [ $_->{id}, $_->{code} ] } @{ $c->stash->{trackers} } ]
    );
}

sub process_activation: Chained('base') : PathPart('activation') Args(0) {
    my ( $self, $c )    = @_;
    my $api             = $c->model('API');

    my $params = $c->req->params;

    $params->{status} = 'vinculado';

    $api->stash_result(
        $c, ['trackers', $params->{tracker}],
        method => 'PUT',
        body   => $c->req->params
    );


    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {

        $api->stash_result(
            $c, ['vehicle_tokens', $params->{token_id}],
            method => 'PUT',
            body => [
                user_id => $c->user->id
            ]

        );

        $c->detach( '/form/redirect_ok', [ '/trackermanager/tracker/index', {}, 'Removido com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;