package PI::TrackingManager::Message;
use Moose;
use PI::Types qw /DataStr TimeStr/;

has tracker_code => (
    is  => 'rw',
    isa => 'Int',
);

has latitude => (
    is  => 'rw',
    isa => 'Num',
);

has longitude => (
    is  => 'rw',
    isa => 'Num',
);

has speed => (
    is  => 'rw',
    isa => 'Num',
);

has track_event => (
    is  => 'rw',
    isa => DataStr
);

has event_information => (
    is  => 'rw',
    isa => 'HashRef'
);

has transaction =>(
    is  => 'rw',
    isa => 'Str'
);

1;