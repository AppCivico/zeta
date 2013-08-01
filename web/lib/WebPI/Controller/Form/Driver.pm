package WebPI::Controller::Form::Driver;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub base : Chained('/form/root') : PathPart('') : CaptureArgs(0) {
}

sub process : Chained('base') : PathPart('driver') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result($c, 'drivers',
        method => 'POST',
        body   => $c->req->params
    );

    if ($c->stash->{error}){

        $c->detach( '/form/redirect_error', [ ] );

    }else{


        $c->detach( '/form/login/login');
    }
}


__PACKAGE__->meta->make_immutable;

1;
