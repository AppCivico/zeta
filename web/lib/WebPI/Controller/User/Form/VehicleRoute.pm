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

    my $lastr = $c->stash->{vehicle_routes}[-1];
    my $count = $lastr ? do { $lastr->{name} =~ /(\d+)/; $1 + 1 } : 1;
    my $name  = "Rota $count";

    $api->stash_result(
        $c,
        ['vehicle_routes'],
        method => 'POST',
        body   => {
            vehicle_id              => $c->stash->{vehicles}[0]{id},
            origin_id               => $c->req->params->{origin_id},
            destination_id          => $c->req->params->{destination_id},
            'start_time_gone'       => $c->req->params->{start_time_gone},
            'start_time_back'       => $c->req->params->{start_time_back},
            'name'                  => $name,
            'days_of_week'          => $c->req->params->{days_of_week},
            'vehicle_parking_type_id'  => $c->req->params->{vehicle_parking_type_id}
        }
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {
        my $origin_saved = $c->req->params->{origin_id};
        my $query_origin = $c->req->params->{origem} ? $c->req->params->{origem} : $origin_saved;

        my $destination = $c->req->params->{destination_id};
        my $dest_time = substr( $c->req->params->{start_time_back}, 0, 5 );
        $dest_time =~ s/://;

        $c->req->params->{rotas} ||= '';
        my @rotas = split /-/, $c->req->params->{rotas};

        push @rotas, $c->stash->{id};

        my $uri;

        if ( $query_origin == $destination ) {

            $uri = $c->uri_for_action(
                '/user/route/add',
                {
                    'rotas'      => join( '-', @rotas ),
                    'finalizado' => 1
                }
            );

        }
        else {

            $uri = $c->uri_for_action(
                '/user/route/add',
                {
                    'origem'    => $query_origin,
                    'destino'   => $destination,
                    'dest_time' => $dest_time,
                    'rotas'     => join '-',
                    @rotas
                }
            );
        }

        $c->res->redirect( $uri->as_string );
    }
}

sub process_edit_obj : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'vehicle_routes', $id ],
        method => 'GET',
        stash  => 'vehicle_route_get'
    );

    my $time = $c->req->params->{start_time_back};

    $api->stash_result(
        $c, [ 'vehicle_routes', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

}

sub process_edit : Chained('process_edit_obj') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
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
