package WebPI::Controller::TrackerManager;
use Moose;
use namespace::autoclean;
use URI;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('tracker-manager') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    if ( !$c->user || !grep { /^admin-tracker$/ } $c->user->roles ) {
        $c->detach( '/form/redirect_error', [] );
    }

    my $api = $c->model('API');

    if ( $c->req->method eq 'POST' ) {
        return;
    }

    $c->stash->{template_wrapper} = 'tracker_manager';

}

__PACKAGE__->meta->make_immutable;

1;
