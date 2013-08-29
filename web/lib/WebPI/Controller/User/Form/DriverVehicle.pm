package WebPI::Controller::User::Form::DriverVehicle;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('driver_vehicle') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');
    my $form = $c->model('Form');

    my $params = { %{ $c->req->params } };

    $form->format_date(
        $params,
        'birth_date'
    );

    $form->only_number(
        $params,
        'telephone_number',
        'mobile_number',
        'postal_code',
        'cpf'
    );

    $api->stash_result(
        $c, [ 'drivers', $c->stash->{driver}{id}, 'vehicle_with_owner' ],
        method => 'POST',
        body   => $params
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
