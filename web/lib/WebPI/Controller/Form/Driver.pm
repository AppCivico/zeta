package WebPI::Controller::Form::Driver;
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('driver') : Args(0) {
    my ( $self, $c ) = @_;

    my $param = { %{ $c->req->params } };

    my $api = $c->model('API');
    my $form = $c->model('Form');

    $form->format_date(
        $param,
        'first_driver_license',
        'cnh_validity',
        'birth_date'
    );

    $form->only_number(
        $param,
        'telephone_number',
        'mobile_number',
        'postal_code',
        'cpf'
    );

    $api->stash_result(
        $c, 'drivers',
        method => 'POST',
        body   => $param
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {

        $c->detach('/form/login/login');
    }
}

__PACKAGE__->meta->make_immutable;

1;
