package WebPI::Controller::Cadastro;
use Moose;
use DateTime;
use DateTime::Format::Pg;
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

    $api->stash_result( $c, 'states' );
    $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];

    if(exists($c->stash->{form_error}{birth_date})) {
        my $now = DateTime->now;

        my $body = { %{$c->stash->{body} } };

        my $form = $c->model('Form');

        $form->format_date(
            $body,
            'birth_date'
        );

        #TODO  limpar a string com uma regex retirando os caracteres que vem com a mascara de data
        if($body->{birth_date} != '--') {
            my $dt = DateTime::Format::Pg->parse_datetime($body->{birth_date});

            my $interval = $now->subtract_datetime($dt);

            if($interval->years < 18) {
                $c->stash->{too_young} = 1;
            }
        }
    }

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

sub get_cities: Chained('base') : PathPart('get_cities') {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, 'cities',
        params => {
            state_id => $c->req->params->{state_id},
            order    => 'name'
        }
     );

    $c->stash(
        select_cities => [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ],
        without_wrapper => 1,
        template => 'auto/cities.tt'
    );
}

__PACKAGE__->meta->make_immutable;

1;