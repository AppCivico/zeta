package PI::TrackingManager::Cache;

use Moose;
use JSON::XS;
use PI::Redis;
use DDP;
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

sub check_counter {
    my ( $self, $key ) = @_;

    my $counter;

    eval { $counter = $redis->redis->lrange($key, 0, -1); };

    print $@ unless ! $@;

    return 0  unless @ { $counter || ! [] };

    return $counter->[0];
}

sub update_counter {
    my ($self, $imei, $counter) = @_;

    $redis->queue_key("counter-$imei");

    eval {
        $redis->redis->del("counter-$imei");
        $redis->redis->rpush("counter-$imei" => $counter );
    };

    die $@ unless ! $@;

    return 1;
}

sub push_missing_messages {
    my ($self, $imei, @data) = @_;

    $redis->queue_key("missing-$imei");

    eval { $redis->redis->rpush("missing-$imei" => encode_json(\@data) ); };

    die $@ unless ! $@;

    return 1;
}

sub update_firmware_version {
    my ( $self, $version ) = @_;

    $redis->queue_key("firmware-version");

    eval {
        $redis->redis->del("firmware-version");
        $redis->redis->rpush("firmware-version" => $version);
    };

    die $@ unless ! $@;

    return 1;
}

1;