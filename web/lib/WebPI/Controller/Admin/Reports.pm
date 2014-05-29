package WebPI::Controller::Admin::Reports;
use Moose;
use utf8;
use JSON::XS;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('reports') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;
}

sub driver_by_region : Chained('base') : PathPart('driver-by-region') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, 'vehicle_brands');
    $c->stash->{select_brands} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_brands} } ];

    if(exists $c->req->params->{campaign_id}) {
        $c->stash->{campaign_id} = $c->req->params->{campaign_id};
    }

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

sub search : Chained('base') : PathPart('search') : Args(0) {
    my ( $self, $c ) = @_;
    
    my $api 			= $c->model('API');
	my $gis_polyline    = $c->req->params->{points};

    $api->stash_result(
        $c, 'reports/drivers-by-region',
        params => {
            gis_polyline    => $gis_polyline,
            brand           => $c->req->params->{brand} ? $c->req->params->{brand} : undef,
            end_age         => $c->req->params->{end_age} ? $c->req->params->{end_age} : undef,
            start_age       => $c->req->params->{start_age} ? $c->req->params->{start_age} : undef,
            gender          => $c->req->params->{gender} ? $c->req->params->{gender} : undef,
            distance        => $c->req->params->{distance} ? $c->req->params->{distance}*1000 : undef,
            active_campaign => $c->req->params->{active_campaign} ? $c->req->params->{active_campaign} : undef,
        }
    );
    
    my $size = @{ $c->stash->{associateds} };
    
    $c->stash->{count} = $size;
    
	$c->stash->{template} = 'admin/reports/drivers.tt';
}

__PACKAGE__->meta->make_immutable;

1;