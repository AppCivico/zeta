package WebZeta::Controller::Admin::Form::FederalElectoralProcess;
use Moose;
use namespace::autoclean;
use DateTime;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('federal_electoral_process') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $params 	= { %{ $c->req->params } };
    
    $api->stash_result(
		$c, ['federal_electoral_processes'],
		method => 'POST',
		body   => $params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
		$c->detach( '/form/redirect_ok', [ '/admin/federalelectoralprocess/index', {}, 'Cadastrado com sucesso!' ] );
	}
    
}

sub process_edit : Chained('base') : PathPart('promise') : Args(1) {
      my ( $self, $c, $id ) = @_;

    my $api 	= $c->model('API');
    my $params 	= { %{ $c->req->params } };
   
    $api->stash_result(
        $c, [ 'federal_electoral_processes', $id ],
        method => 'PUT',
        body   => $params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
        $c->detach( '/form/redirect_ok', [ '/admin/federalelectoralprocess/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_federal_electoral_process') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'federal_electoral_processes', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/federalelectoralprocess/index', {}, 'Removido com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
