package WebPI::Controller::TrackerManager::Form;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/base') : PathPart('form') : CaptureArgs(0) {

    #my ($self, $c) = @_;
    # talvez um dia precise executar o /form/root, mas nao vejo necessidade.
    # $c->forward('/form/root', []);
}

__PACKAGE__->meta->make_immutable;

1;
