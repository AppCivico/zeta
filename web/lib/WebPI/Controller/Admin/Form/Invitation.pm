package WebPI::Controller::Admin::Form::Invitation;
use Moose;
use namespace::autoclean;
use DateTime;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('invitation') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');

    $api->stash_result(
            $c, ['invitations'],
            stash => 'invitation',
            method => 'POST',
            body   => $c->req->params
    );

    if ( $c->stash->{'invitation'}{error} ) {

        $c->stash->{error}      = $c->stash->{'invitation'}{error};
        $c->stash->{form_error} = $c->stash->{'invitation'}{form_error};

        $c->detach( '/form/redirect_error', [] );

    } else {
        $c->detach( '/form/redirect_ok2', [ '/admin/campaign/edit', [$c->req->params->{campaign_id}], {}, 'Cadastrado com sucesso!' ] );
    }

}

sub process_edit : Chained('base') : PathPart('invitation') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api     = $c->model('API');
    my $params  =  { %{ $c->req->params } };
    my $form    = $c->model('Form');

    my @fields;

    push(@fields, 'valid_from','valid_to');

    $form->format_date( $params, @fields );

    $api->stash_result(
        $c, [ 'invitations', $id ],
        method => 'PUT',
        body   => $params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
        $c->detach( '/form/redirect_ok', [ '/admin/invitation/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_invitation') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'invitations', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/invitation/index', {}, 'Removido com sucesso!' ] );
    }
}

sub process_on_demand : Chained('base') : PathPart('send_invitation') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');
    my @vehicles;

    foreach my $id ($c->req->params->{vehicle_id}) {
        push (@vehicles, $id);
    }

    $api->stash_result(
        $c,  'invitations/send',
        stash => 'send_invitation',
        params => {
            associateds => encode_json(\@vehicles),
            campaign_id => $c->req->params->{campaign_id}
        }
    );

    my $response;
    if ( $c->stash->{send_invitation}{error} ) {
        $response = { 'error' => $c->stash->{send_invitation}{error} };
    }
    else {
        $response =  { 'response' => $c->stash->{send_invitation} };
    }

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );
    $c->res->body( encode_json($response) );
}

__PACKAGE__->meta->make_immutable;

1;