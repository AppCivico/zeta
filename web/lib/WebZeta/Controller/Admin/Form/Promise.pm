package WebZeta::Controller::Admin::Form::Promise;
use Moose;
use namespace::autoclean;
use DateTime;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('promise') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');
    
    my $params 	= { %{ $c->req->params } };
    
    $form->format_date($params, 'publication_date');
    
    if($c->req->params->{presidential}) {
		$params->{country_id} = 1;
    }
    
    $api->stash_result(
		$c, ['promises'],
		method => 'POST',
		body   => $params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
    
		my $upload = $c->req->upload('promise_file');
		
		if( $upload ) {
			$api->stash_result(
				$c, 'promises/upload_file',
				method => 'UPLOAD',
				body   => [
					promise_id 	=> $c->stash->{id},
					file 		=> [ $upload->tempname ],
					created_by	=> $c->user->id
				]
			);
	
			if ( $c->stash->{error} ) {
				$c->detach( '/form/redirect_error', [ '/admin/promise/index', {}, 'Problemas ao cadastrar arquivo para a promessa.' ] );
			}
		}
    
		$c->detach( '/form/redirect_ok', [ '/admin/promise/index', {}, 'Cadastrado com sucesso!' ] );
	}
    
}

sub process_edit : Chained('base') : PathPart('promise') : Args(1) {
      my ( $self, $c, $id ) = @_;

    my $api 	= $c->model('API');
    my $form    = $c->model('Form');
    
    my $params 	= { %{ $c->req->params } };
    
    $form->format_date($params, 'publication_date');
   
    $api->stash_result(
        $c, [ 'promises', $id ],
        method => 'PUT',
        body   => $params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
        $c->detach( '/form/redirect_ok', [ '/admin/promise/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_promise') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'promises', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/promise/index', {}, 'Removido com sucesso!' ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
