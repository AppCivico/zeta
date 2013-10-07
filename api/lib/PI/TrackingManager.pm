package PI::TrackingManager;
use Moose;
use PI::Redis;
use PI::TrackingManager::Message;

has schema => (
    is  => 'rw',
    isa => 'PI::Schema',
);

sub add {
    my ( $self, @message ) = @_;
    my $message;

    if ( @message == 1 ) {
        $message = $message[0];
    } else {
        $message = PI::TrackingManager::Message->new(@message);
    }

    die 'invalid object type' if ref $message ne 'PI::TrackingManager::Message';

    my $tracker_data = $self->schema->resultset('Tracker')->search({code => $message->tracker_code, status => 1})->next;

    use DDP;
    p $tracker_data;
    my $code = $message->tracker_code;
    p $code;


    if (!$tracker_data) {
        die "Tracker code not found.\n code: $message->tracker_code\n";
    }

    my $vehicle_tracker = $self->schema->resultset('VehicleTracker');

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