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


1;