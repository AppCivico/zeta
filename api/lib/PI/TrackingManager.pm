package PI::TrackingManager;
use Moose;
use PI::Redis;
use PI::TrackingManager::Message;

has schema => (
    is  => 'rw',
    isa => 'PI::Schema',
);

sub add {
    my ( $self, @message ) = shift;
    my $message;

    if ( @message == 1 ) {
        $message = $message[0];
    } else {
        $message = PI::TrackingManager::Message->new(@message);
    }

    die 'invalid object type' if ref $message ne 'PI::TrackingManager::Message';

    my $tracker_data    = $self->schema->resultset('Tracker')->search({code => $self->tracker_code, status => 1})->next;
    my $vehicle_tracker = $self->schema->resultset('VehicleTracker');

    if (!$tracker_data) {
        die "Tracker code not found.\n code: $self->tracker_code\n";
    }

    $vehicle_tracker->create({
        tracker_id  => $tracker_data->id,
        vehicle_id  => $tracker_data->vehicle_id,
        track_event => $message->track_event,
        lat         => $message->latitude,
        lng         => $message->longitude,
        speed       => $message->speed
    });

}

sub add_error {
    my ( $self, $error) = @_;

    my $cliente_redis = PI::Redis->new();

    eval { $cliente_redis->redis->rpush( 'tracker_error' =>  $error) };

    die $@ if $@;

    print "Erro adicionado a fila\n";

    return 1;
}

1;