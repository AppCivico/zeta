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

    my ($street) = $c->req->params->{parking_address} =~ /[^\d]*/g;
    my ($number) = $c->req->params->{parking_address} =~ /[\d]+/g;

    my $address = {
        'address' => $street,
        'number' => $number,
        'lat_lng' => $c->req->params->{lat_lng},
        user_id => $c->user->id
    };

    $api->stash_result(
        $c, [ 'addresses'],
        stash => 'parking_address',
        method => 'POST',
        body   => $address
    );

     my $parking = {
         'arrival_time'          => $c->req->params->{start_time_gone},
         'name'                  => $c->req->params->{parking_name},
         vehicle_id              => $c->stash->{vehicles}[0]{id},
         vehicle_parking_type_id => $c->req->params->{vehicle_parking_type_id},
         address_id              => $c->stash->{parking_address}{id}
     };

#       $api->stash_result(
#           $c, [ 'vehicle_parking'],
#           stash => 'vehicle_parking',
#           method => 'POST',
#           body   => $parking
#       );

     $api->stash_result (
        $c, ['vehicle_routes'],
        method => 'GET',
        stash => 'route_count',
        params => {
            'vehicle_id' => $c->stash->{vehicles}[0]{id}
        }
     );

    my @st = $c->stash->{route_count};
    my $count = 0;

    foreach my $iten ( $c->stash->{route_count} ) {
        $count
    }

    $count++;
    my $name = "Rota $count";

     $api->stash_result(
         $c, [ 'vehicle_routes'],
         method => 'POST',
         body   => {
            vehicle_id => $c->stash->{vehicles}[0]{id},
            vehicle_parking_id => 1,
            origin_id => $c->req->params->{origin_id},
            destination_id => $c->req->params->{destination_id},
            'start_time_gone' => $c->req->params->{start_time_gone},
            'start_time_back' => $c->req->params->{start_time_back},
            'name' => $name,
            'days_of_week' => $c->req->params->{days_of_week}
        }
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
