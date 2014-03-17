package PI::S3Client;
use Moose;
use Config::General;
use Net::Amazon::S3;

has s3 => (
    is      => 'ro',
    lazy    => 1,
    builder => '_connect_s3'
);

my $conf   = Config::General->new("pi_local.conf");
my %config = $conf->getall;

if( !$config{aws} ) {
    $conf   = Config::General->new("pi.conf");
    %config = $conf->getall;
}

sub _connect_s3 {
    my $self = shift;

    my @credentials = (
        aws_access_key_id       => $config{aws}{access_key_id},
        aws_secret_access_key   => $config{aws}{secret_access_key},
        retry                   => 1,
        secure                  => 0,
    );

    return Net::Amazon::S3->new(@credentials);
}

1;