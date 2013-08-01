package WebPI::Controller::Cadastro;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->response->headers->header( 'charset' => 'utf-8' );
}

sub cadastro : Chained('base') : PathPart('cadastro') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, 'cities' );
    $c->stash->{select_cities} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ];

    $c->stash->{template} = 'auto/cadastro.tt';

}

__PACKAGE__->meta->make_immutable;

1;
