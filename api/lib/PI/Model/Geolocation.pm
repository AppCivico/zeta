package PI::Model::Geolocation;

use base 'Catalyst::Model';
use Moose;
use Furl;
use JSON::XS;
use URI;

has uri => (
    is      => 'ro',
    isa     => 'Str',
    default => 'http://maps.googleapis.com/maps/api/geocode/json'
);

has uri_direction => (
    is      => 'ro',
    isa     => 'Str',
    default => 'http://maps.googleapis.com/maps/api/directions/json'
);

sub geo_by_address {
    my ( $self, $address ) = @_;
    my $res;

    eval {
        my $uri = URI->new($self->uri . "?address=$address&sensor=false&region=br");
        my $req = &access_uri($uri);
        $res    = decode_json( $req->content );
    };

    if ($@) {
        return $@;
    }

    return $res->{results}[0]{geometry}{location};
}

sub geo_by_point {
    my ( $self, $points) = @_;
    my $res;
    use DDP;

    return 0 unless exists $points->{origin} && exists $points->{destination};

#     eval {
        my $uri = $self->uri_direction."?origin=$points->{origin}&destination=$points->{destination}&sensor=false&region=br";
        p $uri;
        my $req = &access_uri($uri);
        my $con = $req->content;
        $res    = decode_json( $req->content );

        if(exists $res->{'routes'}[0]{'legs'}[0]{'steps'}) {
            my @polyline;
            foreach my $point (@{$res->{'routes'}[0]{'legs'}[0]{'steps'}}) {
                push(
                    @polyline,
                    $point->{start_location}{lat}.','.$point->{start_location}{lng},
                    $point->{end_location}{lat}.','.$point->{end_location}{lng}
                );
            }

            $res = encode_json(\@polyline);
        } else {
            die 'Error.zero_results';
        }

#     };

    if ($@) {
        return $@;
    }

    return $res;
}

sub access_uri {
    my ($uri) = @_;
    my $req;

    die 'URI inválida' if !$uri;

    my $furl = Furl->new(
        agent   => 'MyGreatUA/2.0',
        timeout => 10,
    );

    eval { $req = $furl->get($uri) };

    die $@ if $@;

    return $req;
}

1;