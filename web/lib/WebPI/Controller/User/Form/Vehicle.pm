package WebPI::Controller::User::Form::Vehicle;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('vehicle') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');
    my $form = $c->model('Form');

    my $params = {
        %{ $c->req->params },
        driver_id => $c->stash->{driver}{id}
    };

    $form->format_car_plate(
        $params,
        'car_plate'
    );

    $api->stash_result(
        $c, [ 'vehicles' ],
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

sub process_edit : Chained('base') : PathPart('') : Args(1) {
    my ( $self, $c, $id) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'vehicles', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/user/vehicle/index', {}, 'Alterado com sucesso!' ] );
    }
}



__PACKAGE__->meta->make_immutable;

1;
