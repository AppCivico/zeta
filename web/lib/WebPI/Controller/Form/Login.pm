package WebPI::Controller::Form::Login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->response->headers->header( 'charset' => 'utf-8' );
}

sub login : Chained('base') : PathPart('login') : Args(0) {
    my ( $self, $c ) = @_;

     if ( $c->authenticate( $c->req->params ) ) {
        $c->detach( '/form/redirect_ok', [ '/', 'Bem vindo, ' . $c->user->name ] );
    }else{
        $c->detach( '/form/redirect_error', [ ] );
    }
}


__PACKAGE__->meta->make_immutable;

1;
