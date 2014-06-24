package Zeta::ConfigFindLocal;
use Moose;
use Carp;
use JSON::XS;
use File::Slurp;
use XML::LibXML::Simple;

has name => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
    writer      => 'set_config_name',
    initializer => 'set_config_name',
);

has ext => (
    is      => 'ro',
    isa     => 'Str',
    default => sub { '.conf' }
);

has config => (
    is       => 'rw',
    isa      => 'Any',
    init_arg => undef
);

around 'set_config_name' => sub {
    my $orig    = shift;
    my $self    = shift;
    my ($value) = @_;
    return $self->$orig if not @_;

    use FindBin qw($Bin);
    my $ext  = $self->ext;
    my $name = $value . '_local' . $ext;

    my $file = join( '/', $Bin, $name );

    unless ( -e $file ) {
        my @back;
        for ( 1 .. 10 ) {
            push @back, '..';
            $file = join( '/', $Bin, @back, $name ) unless -e $file;
            last if -e $file;
        }
    }

    unless ( -e $file ) {
        $name = $value . $ext;
        $file = join( '/', $Bin, $name );
        unless ( -e $file ) {
            my @back;
            for ( 1 .. 10 ) {
                push @back, '..';
                $file = join( '/', $Bin, @back, $name ) unless -e $file;
                last if -e $file;
            }
        }

        $file = '/etc/' . $name           unless -e $file;
        $file = '/usr/local/etc/' . $name unless -e $file;
    }

    croak "$file not found! Bin=$Bin" unless -e $file;

    my $xml_parser = XML::LibXML::Simple->new();

    my $a = read_file($file);
    my $obj = $xml_parser->XMLin( $a, ForceArray => 1 );

    $self->config($obj);

    # otherwise, call the real writer with the new value
    $self->$orig($value);
};

1;
