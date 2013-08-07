package WebPI::Controller::User::Document;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('document') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result(
        $c,
        ['document', $id],
        stash => 'document_obj'
    );

    $c->detach( '/form/not_found', [] ) if $c->stash->{document_obj}{error};
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

sub edit: Chained('object') : PathPart('') : Args(0) {
}

sub add: Chained('base') : PathPart('new') : Args(0) {
    my ( $self, $c ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;
