package WebPI::Controller::User;
use Moose;
use namespace::autoclean;
use URI;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    if ( !$c->user || !grep { /^user$/ } $c->user->roles ) {
        $c->detach( '/form/redirect_error', [] );
    }

    my $api = $c->model('API');
    $api->stash_result( $c, [ 'drivers', $c->user->driver->{id} ], stash => 'driver' );

    $api->stash_result(
        $c,
        ['vehicles'],
        params => {
            driver_id => $c->user->driver->{id}
        }
    );

    if ( $c->req->method eq 'POST' ) {
        return;
    }

    $c->stash->{template_wrapper} = 'user';

    if ( @{ $c->stash->{vehicles} } == 0 ) {
        $c->stash->{cadastro_incompleto} = 1;
    }

    # ...

    my $dashboard_uri = $c->uri_for_action('/user/dashboard/index');

    if ( $c->stash->{cadastro_incompleto} && $c->req->uri->path ne URI->new($dashboard_uri)->path ) {
        $c->res->redirect($dashboard_uri);
        $c->detach;
    }

}

__PACKAGE__->meta->make_immutable;

1;
