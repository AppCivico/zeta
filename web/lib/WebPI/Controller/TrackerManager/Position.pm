package WebPI::Controller::TrackerManager::Position;
use Moose;
use JSON::XS;
use namespace::autoclean;

use Geo::Coordinates::DecimalDegrees;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/base') : PathPart('positions') : CaptureArgs(0) { }

sub index : Chained('base') : PathPart('') : Args(0) { }

sub get_positions : Chained('/trackermanager/base') : PathPart('get_positions') : Args(0) {
    my ( $self, $c ) = @_;

    my $api  = $c->model('API');

    $api->stash_result(
        $c,
        ['vehicle_trackers'],
        params => {
            positions => 1
        }
    );

    my $data;

    my $id  = $c->stash->{vehicle_trackers}[0]{tracker_id};
    my $i   = 0;
    my $j   = 0;
    use DDP;

    foreach my $item ( @{ $c->stash->{vehicle_trackers} } ) {

        if ( $id != $item->{tracker_id} ) {
            $id = $item->{tracker_id};
            $i  = 0;
            $j++;
        }

        my @pos = $self->parse_lat_lng($item->{lat}, $item->{lng});
        $data->{$j}[$i] = {
            'lat'           => $pos[0],
            'lng'           => $pos[1],
            'track_event'   => $item->{track_event},
            'tracker_id'    => $id,
            'speed'         => $item->{speed},
        };

        $i++;
    }

    $c->res->header( 'content-type', 'application/json;charset=UTF-8' );

    if ( $c->stash->{vehicle_trackers} ) {

        $c->res->body( encode_json( $data ) );
    } else {

        $c->res->body(0);
    }
}

sub parse_lat_lng {
    my ($self, @val) = @_;

    my @data;

    for my $item ( @val ) {
        p $item;
        $item =~ /^(-?\d*)(\d{2})\.(\d{2})(\d+)$/;

        my $part = "$3";
        if ($part eq "00") {
            $part = "0";
        }

        my $p = dms2decimal("$1", "$2", "$3.$4");

        push(@data, $p);
    }

    return @data;
}

__PACKAGE__->meta->make_immutable;

1;
