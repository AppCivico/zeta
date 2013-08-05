package WebPI::Controller::User::Form::VehicleRoute;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    for my $field (qw /start_time_gone start_time_back/){
        $c->req->params->{$field} .= ':00';
    }


}

sub process : Chained('base') : PathPart('vehicle_routes') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    my $params = {
        %{$c->req->params},
        vehicle_id => $c->stash->{vehicles}[0]{id}
    };
    $api->stash_result(
        $c, [ 'vehicle_routes'],
        method => 'POST',
        body   => $params
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {
        $c->detach( '/form/redirect_ok', [
            $c->req->params->{redirect_to_dashboard}
                ? '/user/dashboard/index'
                : '/user/route/index'

        , {}, 'Cadastrado com sucesso!' ] );
    }
}


sub process_edit : Chained('base') : PathPart('vehicle_routes') : Args(1) {
    my ( $self, $c, $id) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'vehicle_routes', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/user/route/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_vehicle_routes') : Args(1) {
    my ( $self, $c, $id) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'vehicle_routes', $id ],
        method => 'DELETE'
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/user/route/index', {}, 'Removido com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
