package WebPI::Controller::Cadastro;
use Moose;
use namespace::autoclean;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->response->headers->header( 'charset' => 'utf-8' );
}

sub cadastro : Chained('base') : PathPart('cadastro') : Args(0) {
    my ( $self, $c ) = @_;
    if ($c->user){
        $c->detach( 'Form::Login' => 'after_login' );
    }

    my $api = $c->model('API');

    $api->stash_result( $c, 'cities' );
    $api->stash_result( $c, 'states' );

    $c->stash->{select_cities} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ];
    $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];


    $c->stash->{template} = 'auto/cadastro.tt';

}

sub get_address : Chained('base') : PathPart('get_address') {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    my $params = { %{$c->req->params} };

    $form->only_number(
        $params,
        'postal_code'
    );

    my $result = $api->stash_result(
        $c, ['cep'],
        params  => $params
    );

    $c->res->header('content-type', 'application/json;charset=UTF-8');
    $c->res->body(encode_json($result));
}

__PACKAGE__->meta->make_immutable;

1;