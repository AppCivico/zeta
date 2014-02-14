package PI::TrackingManager::Cache;

use Moose;
use JSON::XS;
use PI::Redis;

my $redis = PI::Redis->new();

$redis->queue_key('active_trackers');

sub update_cache {
    my ($self, $imei, $vehicle_id, $verb) = @_;

    $redis->redis->del( $imei ) unless ! $redis->redis->exists( $imei );

    if( $verb && ( $verb eq 'post' || $verb eq 'put' ) ) {
        my $data = {
            $imei => $vehicle_id,
        };

        $redis->redis->rpush('active_trackers' => $data);
    }

    return 1;
}

sub check_status {
    my ( $self, $imei ) = @_;

    my @tracker = $redis->redis->get($imei);

    use DDP; p @tracker;

    exit;
}

1;