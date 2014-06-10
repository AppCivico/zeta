package WebPI::Controller::User::VehicleTracker;
use Moose;
use namespace::autoclean;
use Geo::Coordinates::DecimalDegrees;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('vehicle_tracker') : CaptureArgs(0) {
}

sub index : Chained('base') : PathPart('index') : Args(0) {
    my ( $self, $c ) = @_;
    
    my $api  = $c->model('API');

    $api->stash_result(
        $c,
        'trackers',
        params => {
            vehicle_id => $c->stash->{vehicles}[0]{id},
        }
    );

    $c->stash->{without_wrapper} = 1 if exists $c->req->params->{no_wrapper};
}

sub get_positions : Chained('base') : PathPart('get_positions') : Args(0) {
    my ( $self, $c ) = @_;

    my $api  = $c->model('API');
    my $form = $c->model('Form');

    my $params = { %{ $c->req->params } };
    $form->format_date( $params, 'date' );

    $api->stash_result(
        $c,
        ['vehicle_trackers'],
        stash  => 'vehicle_trackers',
        params => {
            vehicle_id => $params->{vehicle_id},
            tracker_id => $params->{tracker_id},
            date       => $params->{date},

        }
    );

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );

    if ( $c->stash->{vehicle_trackers} ) {
        $c->res->body( encode_json( $c->stash->{vehicle_trackers} ) );
    }
    else {
        $c->res->body(0);
    }
}

sub real_time_position : Chained('base') : PathPart('real_time_position') : Args(0) { }

sub get_real_time_position : Chained('base') : PathPart('get_real_time_position') : Args(0) {
	my ( $self, $c ) = @_;
	
    my $api  = $c->model('API');
    
    my $vehicle_id = 
		$c->req->params->{vehicle_id} ? $c->req->params->{vehicle_id} : $c->stash->{vehicles}[0]{id};
    
    if(!$vehicle_id) {
		$c->res->body( {'error' => 'Wrong parameters'} );
    }
    
    $api->stash_result(
        $c,
        'vehicle_trackers/get_last_position',
        params => {
            vehicle_id => $vehicle_id
        }
    );
    
    if( $c->stash->{real_time_position} ) {
		my $position 	= $c->stash->{real_time_position};
		my @time 		= split ' ', $position->[0]{track_event};
		my $date 		= $self->format_date_to_human($time[0]);
		
		my $point = {
			lat 	=> $position->[0]{lat},
			lng 	=> $position->[0]{lng},
			speed	=> $position->[0]{speed},
			date	=> $date,
			hour	=> $time[1]
		};
		
		$c->res->header( 'content-type', 'application/json;charset=UTF-8' );
		$c->res->body( encode_json( $point ) );
    }
    else {
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

sub format_date_to_human {
    my ( $self, $date ) = @_;

	my ( $y, $m, $d ) = $date =~ m/^(\d{4})-(\d{1,2})-(\d{1,2})$/;
	
	return $d.'/'.$m.'/'.$y;
}

__PACKAGE__->meta->make_immutable;

1;
