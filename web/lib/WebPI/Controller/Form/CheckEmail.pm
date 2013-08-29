package WebPI::Controller::Form::CheckEmail;
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('check_email') : Args(0) {
    my ( $self, $c ) = @_;

    my $param = { %{ $c->req->params } };

    my $api = $c->model('API');

    $api->stash_result(
        $c, 'check_email',
        method => 'POST',
        stash  => 'check_email',
        body   => $param
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {

        if ($c->stash->{check_email}{user}){

            $c->detach( '/form/redirect_ok', [ \'/login', {}, 'Você já tem uma conta, faça o login!' ] );

        }else{

            $c->detach( '/form/redirect_ok', [ '/cadastro/cadastro', {}, '',
                email => $c->req->params->{email}
            ] );

        }

    }
}

__PACKAGE__->meta->make_immutable;

1;
