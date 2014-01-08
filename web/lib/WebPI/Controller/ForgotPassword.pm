package WebPI::Controller::ForgotPassword;
use Moose;
use namespace::autoclean;
use URI;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('forgot_password') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub change : Chained('base') : PathPart('change') : CaptureArgs(0) {

}

__PACKAGE__->meta->make_immutable;

1;
