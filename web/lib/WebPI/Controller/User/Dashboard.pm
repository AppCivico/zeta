package WebPI::Controller::User::Dashboard;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub base : Chained('/user/base') : PathPart('') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('dashboard') : CaptureArgs(0) {
    my ($self, $c) = @_;
    if (@{$c->stash->{vehicles}} == 0){

        $c->stash->{cadastro_incompleto} = 1;

        $c->stash->{main_view} = 'parts/new_vehicle.tt'
    }

}

sub index: Chained('object') : PathPart('') : Args(0) {
    my ($self, $c) = @_;


}


__PACKAGE__->meta->make_immutable;

1;
