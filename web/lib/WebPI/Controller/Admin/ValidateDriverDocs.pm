package WebPI::Controller::Admin::ValidateDriverDocs;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('validate-driver-documents') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('driver-id') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result( $c,
        [ 'documents' ],
        params => { driver_id => $id },
    );
}

sub index : Chained('object') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

sub validate : Chained('base') : PathPart('validate') : Args(1) {
    my ( $self, $c, $document_id ) = @_;

    $api->stash_result( $c,
        [ 'documents', $document_id ],
        body => {
            document_valid => 1
        },
    );
}

sub reject : Chained('base') : PathPart('reject') : Args(1) {
    my ( $self, $c, $document_id ) = @_;

    $api->stash_result( $c,
        [ 'documents', $document_id ],
        body => {
            status => 5
        },
    );
}

__PACKAGE__->meta->make_immutable;

1;