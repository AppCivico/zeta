package WebPI::Controller::Admin::Form::Customer;
use Moose;
use namespace::autoclean;
use DateTime;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('customer') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    my $params = { %{ $c->req->params } };

    my @fields;

    push (@fields, 'cnpj', 'postal_code');

    $form->only_number( $params, @fields );

    $api->stash_result(
            $c, ['customers'],
            stash => 'customer',
            method => 'POST',
            body   => $params
    );

    my $st = $c->stash;
    use DDP; p $st;

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }

    $api->stash_result(
        $c, ['addresses'],
        stash => 'customer_address',
        method => 'POST',
        body   => {
            'address'       => $params->{address},
            city_id         => $params->{city_id},
            'complement'    => $params->{complement} ? $params->{complement} : undef,
            'neighborhood'  => $params->{neighborhood},
            'number'        => $params->{number},
            'postal_code'   => $params->{postal_code},
            state_id        => $params->{state_id},
            user_id         => $c->stash->{customer}{id}
        }
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }

    $api->stash_result(
        $c, ['customers', $c->stash->{customer}{id}],
        method => 'PUT',
        body   => {
            address_id => $c->stash->{customer_address}{id}
        }
    );

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/customer/index', {}, 'Cadastrado com sucesso!' ] );
    }
}

sub process_edit : Chained('base') : PathPart('customer') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'customers', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

    my $st = $c->stash;

    $api->stash_result(
        $c, [ 'addresses', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

    $api->stash_result(
        $c, [ 'customers', $id ],
        method => 'PUT',
        body   => $c->req->params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/customer/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_customer') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'customers', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/customer/index', {}, 'Removido com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
