package WebPI::Controller::Form;
use Moose;
use URI;
use URI::QueryParam;

use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub root : Chained('/root') : PathPart('form') : CaptureArgs(0) {
}

sub redirect_ok : Private {
    my ( $self, $c, $path, $params, $msg, %args ) = @_;

    my $method = ref $path eq 'SCALAR' ? 'uri_for' : 'uri_for_action';
    $path = ref $path eq 'SCALAR' ? $$path : $path;

    my $a = $c->$method(
        $path,
        #( $method eq 'uri_for_action' ? ( $c->req->captures ) : () ),
        {
            ( ref $params eq 'HASH' ? %$params : () ),
            mid => $c->set_status_msg(
                {
                    %args, status_msg => $msg
                }
            )
        }
    );
    die "uri not found" unless $a;

    $c->res->redirect($a);

}

sub redirect_ok2 : Private {
    my ( $self, $c, $path, $cap, $params, $msg, %args ) = @_;

    my $a = $c->uri_for_action(
        $path,
        $cap,
        {
            ( ref $params eq 'HASH' ? %$params : () ),
            mid => $c->set_status_msg(
                {
                    %args, status_msg => $msg
                }
            )
        }
    );
    die "uri not found" unless $a;

    $c->res->redirect($a);

}

sub not_found : Private {
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'not_found.tt';
}

sub redirect_error : Private {
    my ( $self, $c, %args ) = @_;

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
            error_msg  => $c->stash->{error},
        }
    );

    my $uri = URI->new($refer);
    $uri->query_param( 'mid', $mid );

    $c->res->redirect( $uri->as_string );

}

__PACKAGE__->meta->make_immutable;

1;
