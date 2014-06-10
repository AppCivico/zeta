package WebPI::Controller::TrackerManager::Position;
use Moose;
use JSON::XS;
use namespace::autoclean;
use Geo::Coordinates::DecimalDegrees;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/base') : PathPart('positions') : CaptureArgs(0) {
	my ( $self, $c ) = @_;
	
	my $api = $c->model('API');
	
    $api->stash_result(
        $c, ['trackers'],
		params => {
			order => 'code'
		}
    );
    
    $c->stash->{trackers_obj} = [ map { [ $_->{id}, $_->{code} ] } @{ $c->stash->{trackers} } ];
}

sub index : Chained('base') : PathPart('') : Args(0) { }

sub get_positions : Chained('/trackermanager/base') : PathPart('get_positions') : Args(0) {
    my ( $self, $c ) = @_;

    my $api  = $c->model('API');
    
    my $params 	= { %{ $c->req->params } };
    my $form 	= $c->model('Form');
    
    $form->format_date($params, 'date');
    
    $api->stash_result(
        $c,
        ['vehicle_trackers'],
        params => $params
    );
    
    my @data;
    foreach my $item ( @{ $c->stash->{vehicle_trackers} } ) {
        push(@data, {
			'lat'           => $item->{lat},
			'lng'           => $item->{lng},
			'track_event'   => $item->{track_event},
			'speed'         => $item->{speed},
        });

    }

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );

    if ( @data ) {

        $c->res->body( encode_json( \@data ) );
    } else {

        $c->res->body(0);
    }
}

__PACKAGE__->meta->make_immutable;

1;