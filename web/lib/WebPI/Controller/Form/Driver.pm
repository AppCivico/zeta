package WebPI::Controller::Form::Driver;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->response->headers->header( 'charset' => 'utf-8' );
}

sub process : Chained('base') : PathPart('driver') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result($c, 'drivers',
        method => 'POST',
        body   => $c->req->params
    );

    if ($c->stash->{error}){

        $c->detach( '/form/redirect_error', [ ] );

    }else{

        # TODO fazer login sozinho



        $c->detach( '/form/redirect_ok', [ '/', 'Bem vindo, ' . $c->user->name ] );
    }
}


__PACKAGE__->meta->make_immutable;

1;
