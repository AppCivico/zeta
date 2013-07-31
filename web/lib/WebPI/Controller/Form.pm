package WebPI::Controller::Form;
use Moose;
use URI;
use URI::QueryParam;

use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub root: Chained('/root') : PathPart('form') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

}

sub redirect_ok :Private {
    my ( $self, $c, $path, $msg, %args) = @_;


    $c->res->redirect(
            $c->uri_for(
                $path,
                {
                    mid => $c->set_status_msg({
                        %args,
                        status_msg => $msg
                    })
                }
            )
    );

}

sub redirect_error :Private {
    my ( $self, $c, %args) = @_;

    my $host  = $c->req->uri->host;
    my $refer = $c->req->headers->referer;
    if ( !$refer || $refer !~ /^http:\/\/$host/ ) {
        $refer = $c->uri_for('/');
    }
    my $mid = $c->set_error_msg(
        {
            #%args,
            form_error => $c->stash->{form_error},
            body       => $c->req->params,
            error_msg    => $c->stash->{error},
        }
    );

    my $uri = URI->new($refer);
    $uri->query_param('mid', $mid);


    $c->res->redirect($uri->as_string);

}

__PACKAGE__->meta->make_immutable;

1;
