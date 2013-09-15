package WebPI::Controller::User::Form::VehicleRoute;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('vehicle_routes') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    for my $field (qw /start_time_gone start_time_back/) {
        $c->req->params->{$field} .= ':00';
    }
    my $cp = $c->req->params;

    my @dow = ();
    for my $i ( 1 .. 7 ) {
        push @dow, $i if ( exists $c->req->params->{"dow_$i"} && $c->req->params->{"dow_$i"} );
    }
    $c->req->params->{"days_of_week"} = join ',', @dow;

}

sub process : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    my ($street) = $c->req->params->{parking_address} =~ /[^\d]*/g;
    my ($number) = $c->req->params->{parking_address} =~ /[\d]+/g;

    my $address = {
        'address' => $street,
        'number'  => $number,
        'lat_lng' => $c->req->params->{lat_lng},
        user_id   => $c->user->id
    };

    $api->stash_result(
        $c, ['addresses'],
        stash  => 'parking_address',
        method => 'POST',
        body   => $address
    );

    my $parking = {
        'arrival_time'          => $c->req->params->{start_time_gone},
        'name'                  => $c->req->params->{parking_name},
        user_id                 => $c->user->id,
        vehicle_parking_type_id => $c->req->params->{vehicle_parking_type_id},
        address_id              => $c->stash->{parking_address}{id}
    };

    $api->stash_result(
        $c, ['vehicle_parking'],
        stash  => 'vehicle_parking_route',
        method => 'POST',
        body   => $parking
    );

    my $count = @{ $c->stash->{vehicle_routes} } + 1;
    my $name  = "Rota $count";

    $api->stash_result(
        $c,
        ['vehicle_routes'],
        method => 'POST',
        body   => {
            vehicle_id         => $c->stash->{vehicles}[0]{id},
            vehicle_parking_id => $c->stash->{vehicle_parking_route}{id},
            origin_id          => $c->req->params->{origin_id},
            destination_id     => $c->req->params->{destination_id},
            'start_time_gone'  => $c->req->params->{start_time_gone},
            'start_time_back'  => $c->req->params->{start_time_back},
            'name'             => $name,
            'days_of_week'     => $c->req->params->{days_of_week}
        }
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {
        my $origin_saved        = $c->req->params->{origin_id};
        my $query_origin        = $c->req->params->{origem} ? $c->req->params->{origem} : $origin_saved;

        my $destination         = $c->req->params->{destination_id};
        my $dest_time           = substr ($c->req->params->{start_time_back},0,5);
        $dest_time =~ s/://;

        $c->req->params->{rotas} ||= '';
        my @rotas = split /-/, $c->req->params->{rotas};

        push @rotas, $c->stash->{id};


        if($query_origin == $destination) {
            $c->detach(
                '/form/redirect_ok',
                [
                    $c->req->params->{redirect_to_dashboard}
                    ? '/user/dashboard/index'
                    : '/user/route/index'

                    , {}, 'Cadastrado com sucesso!'
                ]
            );
        } else {

            my $uri = $c->uri_for_action('/user/route/add', {
                'origem'    => $query_origin,
                'destino'   => $destination,
                'dest_time' => $dest_time,
                'rotas'     => join '-', @rotas
            }) ;

            $c->res->redirect( $uri->as_string );
        }

    }
}

sub process_edit_obj : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'vehicle_routes', $id ],
        method  => 'GET',
        stash   => 'vehicle_route_get'
    );

    my ($street) = $c->req->params->{parking_address} =~ /[^\d]*/g;
    my ($number) = $c->req->params->{parking_address} =~ /[\d]+/g;

    my $address = {
        'address' => $street,
        'number'  => $number,
        'lat_lng' => $c->req->params->{lat_lng},
    };

    $api->stash_result(
        $c, ['addresses', $c->stash->{vehicle_route_get}{vehicle_parking}{address}{id}],
        stash  => 'parking_address',
        method => 'PUT',
        body   => $address
    );

    my $parking = {
        'arrival_time'          => $c->req->params->{start_time_gone},
        'name'                  => $c->req->params->{parking_name},
        vehicle_parking_type_id => $c->req->params->{vehicle_parking_type_id},
    };


    $api->stash_result(
        $c, ['vehicle_parking', $c->stash->{vehicle_route_get}{vehicle_parking}{id}],
        stash  => 'vehicle_parking_route',
        method => 'PUT',
        body   => $parking
    );

    my $time = $c->req->params->{start_time_back};

    $api->stash_result(
        $c, [ 'vehicle_routes', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

}

sub process_edit : Chained('process_edit_obj') : PathPart('') : Args(0) {
    my ($self, $c) = @_;

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
        $c->detach( '/form/redirect_ok', [ '/user/route/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_vehicle_routes') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'vehicle_routes', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/user/route/index', {}, 'Removido com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
