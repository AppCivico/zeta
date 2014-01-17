package WebPI::Controller::Form::PreRegistration;
use Moose;
use namespace::autoclean;
use Digest::SHA1 qw(sha1 sha1_hex sha1_base64);
use utf8;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('pre-registration') : Args(0) {
    my ( $self, $c ) = @_;

    my $params = { %{ $c->req->params } };

    my $api  = $c->model('API');
    my $form = $c->model('Form');
    my $ceps = ['postal_code_job', 'postal_code_home', 'postal_code_college'];

    $form->only_number( $params, 'mobile_number');
    $form->format_date( $params, 'birth_date');
    $form->only_number($params, @$ceps);

    $api->stash_result(
        $c, 'pre_registrations',
        method => 'POST',
        body   => $params
    );

    if ( !$c->stash->{error} ) {
        $c->detach( '/form/redirect_ok2', [ '/preregistration/registration_successfully', [], {}, 'Cadastrado com sucesso!' ] );
    } else {
        $c->detach( '/form/redirect_error', [] );
    }

}

__PACKAGE__->meta->make_immutable;

1;
