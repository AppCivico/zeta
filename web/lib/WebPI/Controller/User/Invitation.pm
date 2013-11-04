package WebPI::Controller::User::Invitation;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('invitation') : CaptureArgs(0) {
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, 'vehicle_invitations',
        params => {
            vehicle_id => $c->stash->{vehicles}[0]{id}
        }
    );

}

__PACKAGE__->meta->make_immutable;

1;