package WebPI::Controller::User::Form::Document;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('document') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');
    my $p   = $c->req->params;

    foreach my $class (qw/registro_cnh comprovante_residencia foto_carro/){
        my $upload = $c->req->upload($class);
        next unless $upload;

        $api->stash_result(
            $c, [ 'documents' ],
            method => 'UPLOAD',
            body   => [
                class_name  => $class,
                file        => [ $upload->tempname ]
            ]
        );
    }

    if ( $c->stash->{error} ) {

        $c->detach( '/form/redirect_error', [] );

    }
    else {

        $c->detach( '/form/redirect_ok', [ '/user/dashboard/index', {}, 'Cadastrado com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;