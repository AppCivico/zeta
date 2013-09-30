package PI::EmailQueue;
use Moose;
use JSON::XS;
use Redis;

has host => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1
);

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

sub _build_redis {
    my $self = shift;

    my @a =
    (
        reconnect   => 60,
        every       => 5000,
        server      => $self->host,
        name        => $self->queue_key
    );

    return Redis->new(@a);
}

sub add {
    my ( $self, %params) = @_;
    my $cliente_redis = $self->redis;

    my %email_p;

    die 'email required' if !exists $params{email};
    $email_p{email} = $params{email};
    die 'name required' if !exists $params{name};
    $email_p{name} = $params{name};
    die 'content required' if !exists $params{content};
    $email_p{content} = $params{content};
    die 'template required' if !exists $params{template};
    $email_p{template} = $params{template};
    die 'subject required' if !exists $params{subject};
    $email_p{subject} = $params{subject};

    my $email = encode_json(\%email_p);

    eval { $cliente_redis->rpush( $self->queue_key =>  $email) };

    die $@ if $@;

    return 1;
}

sub add_error {
    my ( $self, $error) = @_;

    my $cliente_redis = $self->redis;

    eval { $cliente_redis->rpush( $self->queue_key =>  $error) };

    die $@ if $@;

    print "Erro adicionado a fila\n";

    return 1;
}

1;