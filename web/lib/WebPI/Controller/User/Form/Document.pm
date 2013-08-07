package WebPI::Controller::User::Form::Document;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('document') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'document', $c->stash->{document}{id}, 'vehicle_with_owner' ],
        method => 'POST',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {

        $c->detach( '/form/redirect_ok', [ '/user/dashboard/index', {}, 'Cadastrado com sucesso!' ] );
    }
}



__PACKAGE__->meta->make_immutable;

1;
