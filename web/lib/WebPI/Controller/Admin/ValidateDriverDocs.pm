package WebPI::Controller::Admin::ValidateDriverDocs;
use Moose;
use namespace::autoclean;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('validate-driver-documents') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('user-id') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, 'documents',
        params => {
            user_id => $id
        },
    );

    my $d = $c->stash->{documents};
    use DDP; p $d;
}

sub index : Chained('object') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

sub validate : Chained('base') : PathPart('validate') : Args(1) {
    my ( $self, $c, $document_id ) = @_;
    my $api = $c->model('API');

    $api->stash_result( $c,
        [ 'documents', $document_id ],
        method => 'PUT',
        body => {
            document_valid => 1
        },

    );

    my $res;
    if(!$c->stash->{error}) {
        $res = {
            'status' => 'Ativo'
        };
    } else {
        $res = {
            'status' => 'Erro ao aprovar'
        };
    }

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );
    $c->res->body( encode_json($res) );
}

sub reject : Chained('base') : PathPart('reject') : Args(1) {
    my ( $self, $c, $document_id ) = @_;
    my $api = $c->model('API');

    $api->stash_result( $c,
        [ 'documents', $document_id ],
        method => 'PUT',
        body => {
            status => 5
        },
    );

    my $res;
    if(!$c->stash->{error}) {
        $res = {
            'status' => 'Rejeitado'
        };
    } else {
        $res = {
            'status' => 'Erro ao rejeitar'
        };
    }

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );
    $c->res->body( encode_json($res) );
}

sub download : Chained('base') : PathPart('download') : Args(1) {
    my ( $self, $c, $document_id ) = @_;
    my $api = $c->model('API');

    my $content = $api->get_result(
        $c,
        [ 'download-document', $document_id ],
        get_as_content => 1
    );
    $c->res->header( 'content-type', 'application/octet-stream' );

    $c->res->body($content);
    $c->detach();


}

__PACKAGE__->meta->make_immutable;

1;