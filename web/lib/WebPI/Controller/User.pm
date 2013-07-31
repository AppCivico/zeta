package WebPI::Controller::User;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub base : Chained('/root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    if (!$c->user || !grep {/^user$/} $c->user->roles){
        $c->detach( '/form/redirect_error', [ ] );
    }

    my $api = $c->model('API');
    $api->stash_result($c, ['drivers', $c->user->driver->{id}],
        stash => 'driver'
    );

    $api->stash_result($c, ['vehicles'],
        params => {
            driver_id => $c->user->driver->{id}
        }
    );

    $c->stash->{template_wrapper} = 'user';
}

__PACKAGE__->meta->make_immutable;

1;
