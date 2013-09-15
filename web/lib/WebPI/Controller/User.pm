package WebPI::Controller::User;
use Moose;
use namespace::autoclean;
use URI;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('user') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    if ( !$c->user || !grep { /^user$/ } $c->user->roles ) {
        $c->detach( '/form/redirect_error', [] );
    }

    my $api = $c->model('API');
    my $form = $c->model('Form');

    $api->stash_result( $c, [ 'drivers', $c->user->driver->{id} ], stash => 'driver' );

    my $fields = ['birth_date', 'cnh_validity', 'first_driver_license'];

    $form->format_date_to_human(
        $c->stash->{driver},
        @$fields
    );

    $form->format_cpf_to_human(
        $c->stash->{driver},
        'cpf'
    );

    $api->stash_result(
        $c,
        ['vehicles'],
        params => {
            driver_id => $c->user->driver->{id}
        }
    );

    # por enquanto, a pessoa só pode ter um veiculo, logo
    # o primeiro é o atual/ativo/o que importa.
    my $vehicle_id = exists $c->stash->{vehicles}[0] ? $c->stash->{vehicles}[0]{id} : undef;

    if ($vehicle_id) {
        $api->stash_result(
            $c,
            ['vehicle_parking'],
            params => {
                vehicle_id => $vehicle_id
            }
        );
        $api->stash_result(
            $c,
            ['vehicle_routes'],
            params => {
                vehicle_id => $vehicle_id
            }
        );

        $api->stash_result(
            $c,
            'vehicle_route_types',
            params => {
                user_id => $c->user->id,
                order   => 'name'
            }
        );
        $c->stash->{select_routes} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_route_types} } ];

        $api->stash_result(
            $c,
            'vehicle_parking_types',
            params => {
                order => 'name'
            }
        );
        $c->stash->{select_parking_types} =
          [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_parking_types} } ];

        $api->stash_result( $c, 'states' );
        $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];

        $api->stash_result(
            $c,
            'vehicle_colors',
            params => {
                order => 'name'
            }
        );
        $c->stash->{select_colors} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_colors} } ];

        $api->stash_result( $c, 'vehicle_body_styles' );
        $c->stash->{select_body_styles} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_body_styles} } ];

        $api->stash_result( $c, 'vehicle_brands' );
        $c->stash->{select_brands} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_brands} } ];

    }
    $c->stash->{vehicle_id} = $vehicle_id;

    if ( $c->req->method eq 'POST' ) {
        return;
    }

    $c->stash->{template_wrapper} = 'user';

    if (   @{ $c->stash->{vehicles} || [] } == 0
        || @{ $c->stash->{vehicle_parking} || [] } == 0 ) {
        $c->stash->{cadastro_incompleto} = 1;
    }

    # ...

    my $dashboard_uri = $c->uri_for_action('/user/dashboard/index');

    if (   $c->stash->{cadastro_incompleto}
        && $c->req->uri->path ne URI->new($dashboard_uri)->path
        && $c->req->uri->path !~ qr|^(/user/route_type/new)$| ) {
        $c->res->redirect($dashboard_uri);
        $c->detach;
    }

}

__PACKAGE__->meta->make_immutable;

1;
