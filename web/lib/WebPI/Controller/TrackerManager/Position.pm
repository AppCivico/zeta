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
    
    my $t = $c->stash->{vehicle_trackers};
    my @data;
    
    foreach my $item ( @{ $c->stash->{vehicle_trackers} } ) {
		my @pos = $self->parse_lat_lng($item->{lat}, $item->{lng});

        push(@data, {
             'lat'           => $pos[0],
             'lng'           => $pos[1],
#             'lat'           => $item->{lat},
#             'lng'           => $item->{lng},
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

sub parse_lat_lng {
    my ( $self, @val ) = @_;

    my @data;

    for my $item ( @val ) {
        $item =~ /^(-?\d*)(\d{2})\.(\d{2})(\d+)$/;

        my $part = "$3";
        if ($part eq "00") {
            $part = "0";
        }

        my $p = dms2decimal("$1", "$2", "$part.$4");

        push(@data, $p);
    }

    return @data;
}

__PACKAGE__->meta->make_immutable;

1;