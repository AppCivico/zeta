package WebPI::Controller::Form::Driver;
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('driver') : Args(0) {
    my ( $self, $c ) = @_;

    my $param = { %{ $c->req->params } };

    my $api = $c->model('API');
    my $form = $c->model('Form');

    $form->format_date(
        $param,
        'first_driver_license',
        'cnh_validity',
        'birth_date'
    );

    $form->only_number(
        $param,
        'telephone_number',
        'mobile_number',
        'postal_code',
        'cpf'
    );

    $api->stash_result(
        $c, 'drivers',
        method => 'POST',
        stash => 'driver',
        body   => $param
    );

    my $x = $c->stash;
    use DDP; p $x;

    if ( !$c->stash->{driver}{error} ) {

        my $address = {
            'address'      => $param->{address},
            'number'       => $param->{number},
            'neighborhood' => $param->{neighborhood},
            'postal_code'  => $param->{postal_code},
            'complement'   => $param->{complement},
            user_id        => $c->stash->{driver}{user_id}
        };

        $api->stash_result(
            $c, 'addresses',
            method => 'POST',
            stash => 'address',
            body   => $address
        );

        if ( !$c->stash->{error} ) {

            my $route_type = {
                'name' => 'Casa',
                'address_id' => $c->stash->{address}{id}
            };

            $api->stash_result(
                $c, 'vehicle_route_types',
                method => 'POST',
                stash => 'vehicle_route_type',
                body   => $route_type
            );

            $c->detach('/form/login/login');
        }

    } else {
        $c->stash->{error}      = $c->stash->{driver}{error};
        $c->stash->{form_error} = $c->stash->{driver}{form_error};

        $c->detach( '/form/redirect_error', [] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
