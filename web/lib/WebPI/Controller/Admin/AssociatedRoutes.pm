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
    my @final_pos;

    $api->stash_result(
        $c, 'vehicle_routes'
    );

    my @fp;
    foreach my $position ( @{ $c->stash->{vehicle_routes} } ) {
        my $arrayref = decode_json($position->{vehicle_route_polyline});

        @final_pos = map {my ($x, $y) = split /\,/, $_; +{lat => $x, lng=>$y} } @$arrayref;

        push(@fp, @final_pos);
    }

    $c->res->content_type('application/json');
    $c->res->headers->header( 'charset' => 'utf-8') ;

    $c->res->body(encode_json(\@fp));
}

__PACKAGE__->meta->make_immutable;

1;