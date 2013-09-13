package WebPI::Controller::User::Form::VehicleRoute;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    for my $field (qw /start_time_gone start_time_back/){
        $c->req->params->{$field} .= ':00';
    }
    my $cp = $c->req->params;

    my @dow = ();
    for my $i (1..7){
        push @dow, $i if (exists $c->req->params->{"dow_$i"} && $c->req->params->{"dow_$i"});
        delete $c->req->params->{"dow_$i"};
    }
    $c->req->params->{"days_of_week"} = join ',', @dow;

}

sub process : Chained('base') : PathPart('vehicle_routes') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    my $params = {
        %{$c->req->params},
        vehicle_id => $c->stash->{vehicles}[0]{id}
    };

    my $street = $params->{address} =~ /[^\d]/g;
    my $number = $params->{address} =~ /[\d]/g;
    my $address = {
        'address' => $street,
        'number' => $number,
        'lat_lng' => $params->{lat_lng},
        user_id => $c->user->id
    };

    $api->stash_result(
        $c, [ 'addresses'],
        stash => 'parking_address',
        method => 'POST',
        body   => $address
    );

    my $parking = {
        'arrival_time'          => $params->{start_time_gone},
        'name'                  => $params->{parking_name},
        vehicle_id              => $params->{vehicle_id},
        vehicle_parking_type_id => $params->{vehicle_parking_type_id},
        address_id              => $c->stash->{parking_address}{id}
    };

    $api->stash_result(
        $c, [ 'vehicle_parking'],
        stash => 'vehicle_parking',
        method => 'POST',
        body   => $parking
    );

    $params += {
        vehicle_parking_id => $c->stash->{vehicle_parking}{id}
    };

    $api->stash_result(
        $c, [ 'vehicle_routes'],
        method => 'POST',
        body   => $params
    );

    use DDP; p $params;

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
