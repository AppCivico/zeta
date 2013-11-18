package PI::Model::Geolocation;

use base 'Catalyst::Model';
use Moose;
use Furl;
use JSON::XS;
use MIME::Base64;
use URI;
use URI::QueryParam;

has uri => (
    is      => 'ro',
    isa     => 'Str',
    default => 'http://maps.googleapis.com/maps/api/geocode/json'
);

sub geo_by_address {
    my ( $self, $address ) = @_;
    my $res;

    eval {
        my $uri = URI->new($self->uri . "?address=$address&sensor=false");
        my $req = &access_uri($uri);
        my $con = $req->content;
        $res    = decode_json( $req->content );
    };

    if ($@) {
        return $@;
    }

    return $res->{results}[0]{geometry}{location};;
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