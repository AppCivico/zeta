package WebPI::Controller::User::Form::VehicleRouteType;
use Moose;
use namespace::autoclean;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('vehicle_route_types') : Args(0) {
    my ( $self, $c ) = @_;

    my $api    = $c->model('API');
    my $form   = $c->model('Form');
    my $params = { %{ $c->req->params } };

    $form->only_number( $params, 'postal_code' );

    my $address = {
        'address'      => $params->{address},
        'number'       => $params->{number},
        'postal_code'  => $params->{postal_code} ? $params->{postal_code} : undef,
        'neighborhood' => $params->{neighborhood},
        'complement'   => $params->{complement} ? $params->{complement} : undef,
        user_id        => $c->user->id,
        city_id        => $params->{city_id},
    };

    $api->stash_result(
        $c, ['addresses'],
        stash  => 'added_address',
        method => 'POST',
        body   => $address
    );
    $api->stash_result(
        $c,
        ['vehicle_route_types'],
        method => 'POST',
        stash  => 'route_types',
        body   => {
            'name'     => $c->req->params->{route_type_name},
            address_id => $c->stash->{added_address}{id}
        }
    );

    if ( $c->stash->{added_address}{error} ) {

        my $mid = $c->set_error_msg(
            {
                #%args,
                form_error => $c->stash->{added_address}{form_error},
                body       => $c->req->params,
                error_msg  => $c->stash->{added_address}{error},
            }
        );

        $c->res->redirect(
            $c->uri_for_action(
                '/user/routetype/add',
                {
                    mid        => $mid,
                    no_wrapper => 1
                }
            )
        );

        $c->detach;

    }
    else {
        $c->response->content_type('application/json');
        $c->res->headers->header( 'charset' => 'utf-8' );

        $c->res->body(
            encode_json(
                {
                    address    => $c->stash->{added_address},
                    route_type => $c->stash->{route_types},
                }
            )
        );

        $c->detach;
    }
}

sub process_edit : Chained('base') : PathPart('vehicle_routes') : Args(1) {
    my ( $self, $c, $id ) = @_;

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