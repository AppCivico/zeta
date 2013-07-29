package WebPI::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

WebPI::Controller::Root - Root Controller for WebPI

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $self->root_base($c);

}

sub root_base {
    my ( $self, $c ) = @_;
    $c->stash->{c_req_path} = $c->req->path;

    my $api = $c->model('API');

    $api->stash_result( $c, ['users'] );
    my $z = $c->stash;
    use DDP; p $z;
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;

    $self->root_base($c);
    my $maybe_view = join '/', @{$c->req->arguments};
    my $output;
    eval {
        $output = $c->view('TT')->render($c, "auto/$maybe_view.tt");
    };
    if ($@ && $@ =~ /not found$/){
        $c->response->body( 'Page not found' );
        $c->response->status(404);
    }elsif(!$@){
        $c->response->body( $output );
    }else{
        die $@;
    }
}


sub rest_error :Private{
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'rest_error.tt';
    $c->stash->{without_wrapper} = 1;

    # TODO enviar um email se não estiver com $c->debug ?
    $c->res->status(500);

}
=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
}

=head1 AUTHOR

renato,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
