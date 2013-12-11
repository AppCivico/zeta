package PI::Controller::API::Contact;

use Moose;
use PI::EmailQueue;
use DateTime;
use utf8;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',
);

sub base : Chained('/api/base') : PathPart('contact') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub email_send  : Chained('base') : PathPart('send') : Args(0) {
    my ( $self, $c ) = @_;

    my $config = PI->config;

    my $email_model = $c->model('EmailQueue');

    $email_model->add(
        email     => 'no-reply@publicidadeinteligente.com.br',
        name      => $c->req->params->{name},
        content   => {
            name                => $c->req->params->{name},
            motive              => $c->req->params->{motive},
            telephone_number    => $c->req->params->{telephone_number},
            comment             => $c->req->params->{comment},
            email               => $c->req->params->{email},
        },
        subject   => 'Publicidade Inteligente - Contato de usuário',
        template  => 'contact.tt',
        queue_key => 'email'
    );

    $self->status_ok(
        $c,
        entity => {
            status => 'ok'
        }
    );

}

1;