package PI::SqsManager;

use utf8;
use strict;
use warnings;

use Moose;
use Config::General;
use Amazon::SQS::Simple;

has queue_name => (
    is      => 'rw',
    isa     => 'Str',
    default => 'pi_tracker_message'
);

has sqs => (
    is      => 'ro',
#     isa     => 'QueueManager',
    lazy    => 1,
    builder => '_build_sqs'
);

my $conf   = Config::General->new("pi_local.conf");
my %config = $conf->getall;

if( !$config{aws} ) {
    $conf   = Config::General->new("pi.conf");
    %config = $conf->getall;
}

sub _build_sqs {
    my $self = shift;

    my $access_key = $config{aws}{access_key_id};
    my $secret_key = $config{aws}{secret_access_key};

    my $sqs     = Amazon::SQS::Simple->new($access_key, $secret_key);
    my $queue   = $sqs->CreateQueue($self->queue_name);

    return $queue;
}

1;