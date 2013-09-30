package WebPI::Controller::Driver;
use Moose;
use namespace::autoclean;
use URI;
use MIME::Base64;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('driver') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'drivers', $id ], stash => 'driver_obj' );

    my $dr = $c->stash->{driver_obj};

    $c->detach( '/form/not_found', [] ) if $c->stash->{driver_obj}{error};
}

sub validate_email : Chained('base') : PathPart('validate_email') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $params  = $c->req->params;

    $api->stash_result(
        $c,
        ['drivers'],
        stash => 'validate_email',
        params => {
            validation_key => decode_base64($params->{key})
        }
    );

    my $driver = $c->stash->{validate_email}{drivers}[0];

    if ( $c->stash->{error} || $driver->{email} ne $params->{email} ) {
        $c->stash->{error} = 'O email não pode ser validado.';
        $c->detach( '/form/redirect_error', [] );
    }

    $c->detach( '/form/redirect_ok2', [ '/driver/add_password', [$driver->{id}], {}, 'Bem vindo, ' . $driver->{name} ] );
}

sub add_password : Chained('object') : PathPart('add_password') : Args(0) {

}

__PACKAGE__->meta->make_immutable;

1;