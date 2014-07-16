package Zeta::Redis;
use Moose;
use Redis;
use Config::General;

has queue_key => (
    is      => 'rw',
    isa     => 'Str',
    default => 'email'
);

has redis => (
    is      => 'ro',
    isa     => 'Redis',
    lazy    => 1,
    builder => '_build_redis'
);

# my $config = Zeta::ConfigFindLocal->new(name => 'pi')->config;

my $conf   = Config::General->new("zeta.conf");
my %config = $conf->getall;

if( !$config{redis}{host} ) {
    $conf   = Config::General->new("zeta_local.conf");
    %config = $conf->getall;
}

sub _build_redis {
    my $self = shift;
    use DDP;
    my $q = $self->queue_key;

    my @a = (
        reconnect => 60,
        every     => 5000,
        server    => $config{redis}{host},
        name      => $self->queue_key ? $self->queue_key : $config{redis}{queue_key}
    );

    return Redis->new(@a);
}

1;
