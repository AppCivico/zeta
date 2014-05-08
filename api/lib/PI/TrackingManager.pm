package PI::TrackingManager;

use Moose;
use PI::Redis;
use PI::TrackingManager::Cache;
use JSON::XS;
use Log::Log4perl qw(get_logger :levels);

has schema => (
    is  => 'rw',
    isa => 'PI::Schema',
);

my $tracker_cache 	= PI::TrackingManager::Cache->new();

Log::Log4perl::init('log.conf');

sub add {
    my ( $self, %message ) = @_;
    
    my $logger 			= Log::Log4perl->get_logger("tracker_message");

    my $tracker_data    = $tracker_cache->check_status($message{imei});

    if ( !$tracker_data ) {
		$logger->warn('Tracker is not registered on system. IMEI: '.$message{imei});
		
        return 0;
    }
    
#   Verifica se o contador das mensagens bate com as mensagens recebidas e monta fila de mensagens perdidas
    my $counter = $tracker_cache->check_counter("counter-$message{imei}");

    if(
        !$counter || $counter+1 == $message{position_counter}
        || ($message{position_counter} == 0 && ( $counter == 0 || $counter == 38332 ))
    ) {
        $tracker_cache->update_counter($message{imei}, $message{position_counter});
    }
    else {
        my $interval = $message{position_counter} - $counter;

        my @missing_messages;

        for(1 ... $interval-1) {
            push(@missing_messages, $counter+=1);
        }

        $tracker_cache->push_missing_messages($message{imei}, @missing_messages);
    }

    my $vehicle_tracker = $self->schema->resultset('VehicleTracker');

    eval {
		$vehicle_tracker->create(
			{
				tracker_id          => $tracker_data->{tracker_id},
				vehicle_id          => $tracker_data->{vehicle_id} ? $tracker_data->{vehicle_id} : undef ,
				lat                 => $message{latitude},
				lng                 => $message{longitude},
				speed               => $message{speed},
				transaction         => $message{position_counter},
				track_event         => $message{package_date},
				sat_number          => $message{sat_number},
				hdop                => $message{hdop},
				reason_generator    => $message{reason_generator},
			}
		);
	};
	
	$logger->error('Error saving position on database. Tracker_id: '.$tracker_data->{tracker_id}.' Message: '.$@) if $@;
	
    return 1;
}

sub add_error {
    my ( $self, $error ) = @_;

    my $cliente_redis = PI::Redis->new();

    eval { $cliente_redis->redis->rpush( 'tracker_error' => $error ) };

    die $@ if $@;

    print "Erro adicionado a fila\n";

    return 1;
}

sub add_event {
    my ( $self, @message ) = @_;
    my $message;

    if ( @message == 1 ) {
        $message = $message[0];
    }
    else {
        $message = PI::TrackingManager::Message->new(@message);
    }

    die 'invalid object type' if ref $message ne 'PI::TrackingManager::Message';

    my $tracker_data =
      $self->schema->resultset('Tracker')->search( { code => $message->tracker_code, status => 1 } )->next;

    if ( !$tracker_data ) {
        die "Tracker code not found.\n code: $message->tracker_code\n";
    }

    my $vehicle_tracker_event = $self->schema->resultset('VehicleTrackerEvent');

    $vehicle_tracker_event->create(
        {
            tracker_id        => $tracker_data->id,
            vehicle_id        => $tracker_data->vehicle_id,
            track_event       => $message->track_event,
            event_information => encode_json( $message->event_information ),
            transaction       => $message->transaction
        }
    );
}

sub build_statistic_queue {
    my ( $self, $params ) = @_;

    die 'empty data' if !$params;

    my $redis = PI::Redis->new();
    my $data  = encode_json($params);

    $redis->redis->rpush( 'vehicle_statistics' => $data );
}

sub new_tracker {
    my ( $self, $params ) = @_;
    
    my $logger 		= Log::Log4perl->get_logger("new_tracker");
    my $tracker 	= decode_json($params);
    my $rs_tracker 	= $self->schema->resultset('Tracker');
    
	my $tracker_reg;
	
    eval {
		return 2 if $rs_tracker->search( { code => $tracker->{imei} } )->next;
    
		$tracker_reg = $rs_tracker->create({
			code    => $tracker->{imei},
			iccid   => $tracker->{iccid},
			status  => 1
		});
    };
    
    $logger->error('Error creating new tracker. IMEI: '.$tracker->{imei}.' Message: '.$@) if $@;
    
    if ($tracker_reg) {
        $tracker_cache->update_cache(
            $tracker->{imei},
            $tracker_reg->id,
            undef,
            'post'
        );
    }

    return 0 unless $tracker_reg;

    return 1;
}

1;