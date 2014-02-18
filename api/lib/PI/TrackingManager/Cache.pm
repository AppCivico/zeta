package PI::TrackingManager::Cache;

use Moose;
use JSON::XS;
use PI::Redis;

my $redis = PI::Redis->new();

sub update_cache {
    my ($self, $imei, $tracker_id, $vehicle_id, $verb) = @_;

    $redis->queue_key($imei);

    $redis->redis->del( $imei ) unless ! $redis->redis->exists( $imei );

    eval {
        if( $verb && ( $verb eq 'post' || $verb eq 'put' ) ) {

            my $data = {
                vehicle_id => $vehicle_id,
                tracker_id => $tracker_id,
                imei       => $imei
            };

            $redis->redis->rpush($imei => encode_json($data) );
        }
    };

    die $@ unless ! $@;

    return 1;
}

sub check_status {
    my ( $self, $imei ) = @_;

    my $tracker;

    eval { $tracker = $redis->redis->lrange($imei, 0, -1); };

    print $@ unless ! $@;

    return 0  unless @ { $tracker || ! [] } ;

    return decode_json($tracker->[0]) ;
}

1;