package WebPI::Controller::Form::Contact;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('contact') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    #todo fazer uma action para realmente enviar o email
    $c->detach( '/form/redirect_ok', [ \'/contato', {}, 'Mensagem enviada com sucesso!' ] );
}

__PACKAGE__->meta->make_immutable;

1;
