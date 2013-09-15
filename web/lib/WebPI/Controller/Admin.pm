package WebPI::Controller::Admin;
use Moose;
use namespace::autoclean;
use URI;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('admin') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    if ( !$c->user || !grep { /^admin$/ } $c->user->roles ) {
        $c->detach( '/form/redirect_error', [] );
    }

    my $api = $c->model('API');

    if ( $c->req->method eq 'POST' ) {
        return;
    }

    $c->stash->{template_wrapper} = 'admin';

}

__PACKAGE__->meta->make_immutable;

1;
