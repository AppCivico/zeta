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

sub download_firmware : Chained('/root') : PathPart('download-firmware') : Args(1) {
    my ( $self, $c, $file ) = @_;

    my $api = $c->model('API');

    my $content = $api->get_result(
        $c,
        'download-firmware',
        params => {
            file => $file
        },
         get_as_content => 1
    );

    $c->res->header('content-type', ' text/html');

    $c->res->body($content);

    $c->detach();
}

__PACKAGE__->meta->make_immutable;

1;
