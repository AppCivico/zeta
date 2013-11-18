package WebPI::Controller::Admin::AssociatedRoutes;
use Moose;
use utf8;
use JSON::XS;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('associated_routes') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');
}

sub get_positions : Chained('base') : PathPart('get_positions') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');
    my @positions;

    $api->stash_result(
        $c, 'vehicle_routes'
    );

    foreach my $item (@{ $c->stash->{vehicle_routes} } ) {
        push( @positions, {
                origin      => $item->{origin}{address}{lat_lng},
                destination => $item->{destination}{address}{lat_lng},
            }
        );
    }

    use DDP; p @positions;
    $c->res->content_type('application/json');
    $c->res->headers->header( 'charset' => 'utf-8') ;

    $c->res->body(encode_json(\@positions));
}

__PACKAGE__->meta->make_immutable;

1;