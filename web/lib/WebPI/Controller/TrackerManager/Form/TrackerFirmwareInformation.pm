package WebPI::Controller::TrackerManager::Form::TrackerFirmwareInformation;
use Moose;
use DateTime;
use namespace::autoclean;
use Digest::SHA1 qw(sha1 sha1_hex sha1_base64);

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('new_firmware') : Args(0) {
    my ( $self, $c ) = @_;

    my $api    = $c->model('API');
    my $now    = DateTime->now();
    my $upload = $c->req->upload('file');

    my $version_hash = sha1_hex($c->req->params->{version}.$now->format_cldr('yyyy-MM-dd H:m:s'));

    $api->stash_result(
        $c,
        ['tracker_firmware_informations'],
        method => 'UPLOAD',
        body   => [
            file            => $c->req->params->{file},
            version         => $c->req->params->{version},
            version_hash    => $version_hash,
            status          => $c->req->params->{status},
            file            => [ $upload->tempname ]
        ]
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/trackermanager/trackerfirmwareinformation/index', {}, 'Cadastrado com sucesso!' ] );
    }
}

sub process_edit : Chained('base') : PathPart('tracker') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    my $p = $c->req->params;

    if ($c->req->params->{status} == 1) {
        $c->req->params->{vehicle_id} = undef if exists $c->req->params->{vehicle_id};
    }

    $api->stash_result(
        $c, [ 'trackers', $id ],
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
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'trackers', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/trackermanager/tracker/index', {}, 'Removido com sucesso!' ] );
    }
}

sub check_token : Chained('base') : PathPart('check_token') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    my $params = { %{ $c->req->params } } ;

    $form->format_car_plate($params, 'car_plate');

    $api->stash_result(
        $c, ['vehicle_token_check'],
        stash   => 'vehicle_token_check',
        params  => $params
    );

    my $result = $c->stash->{vehicle_token_check};

    if ( $result->{error} ) {
        $c->stash( error => $result->{error} );
    }

    $api->stash_result(
        $c, ['trackers'],
        params => { available => 1 }
    );

    $c->stash(
        without_wrapper => 1,
        template        => 'trackermanager/tracker/check_token.tt',
        result          => $result,
        trackers        => [ map { [ $_->{id}, $_->{code} ] } @{ $c->stash->{trackers} } ]
    );
}

sub process_activation : Chained('base') : PathPart('activation') Args(0) {
    my ( $self, $c ) = @_;
    my $api = $c->model('API');

    my $params = $c->req->params;

    $params->{status} = 2;

    $api->stash_result(
        $c, [ 'trackers', $params->{tracker} ],
        method => 'PUT',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {

#         $api->stash_result(
#             $c,
#             [ 'vehicle_tokens', $params->{token_id} ],
#             method => 'PUT',
#             body   => [
#                 user_id => $c->user->id
#               ]
#
#         );

        $c->detach( '/form/redirect_ok', [ '/trackermanager/tracker/index', {}, 'Adicionado com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
