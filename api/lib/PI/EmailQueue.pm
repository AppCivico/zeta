package PI::EmailQueue;
use PI::Redis;
use JSON::XS;
use Moose;

has schema => (
    is  => 'rw',
    isa => 'PI::Schema',
);

sub add {
    my ( $self, %params ) = @_;

    my $cliente_redis = PI::Redis->new();

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

    my $email = encode_json( \%email_p );
    use DDP;
    p %params;
    eval { $cliente_redis->redis->rpush( $params{queue_key} => $email ) };

    die $@ if $@;

    return 1;
}

sub add_error {
    my ( $self, $error ) = @_;

    my $cliente_redis = PI::Redis->new();

    $cliente_redis->queue_key('error');

    eval { $cliente_redis->redis->rpush( 'error' => $error ) };

    $cliente_redis->queue_key('email');
    die $@ if $@;

    print "Erro adicionado a fila\n";

    return 1;
}

1;
