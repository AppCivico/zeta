package PI::Redis;
use Moose;
use Redis;
use PI::ConfigFindLocal;
use Config::General;

has queue_key => (
    is          => 'rw',
    isa         => 'Str',
    default     => 'email'
);

has redis => (
    is      => 'ro',
    isa     => 'Redis',
    lazy    => 1,
    builder => '_build_redis'
);

# my $config = PI::ConfigFindLocal->new(name => 'pi')->config;

my $conf    = Config::General->new("pi_local.conf");
my %config  = $conf->getall;

sub _build_redis {
    my $self = shift;

    my @a =
    (
        reconnect   => 60,
        every       => 5000,
        server      => $config{redis}{host},
        name        => $self->queue_key ? $self->queue_key : $config{redis}{queue_key}
    );

    return Redis->new(@a);
}

1;