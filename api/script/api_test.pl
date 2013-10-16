#!/user/bin/perl

use strict;
use warnings;
use DateTime;
use Digest::SHA1 qw(sha1 sha1_hex sha1_base64);
use Furl;
use MIME::Base64;
use URI;
use URI::QueryParam;
use JSON::XS;

my $auth_user = 'CargoTracck';
my $auth_org  = 'CargoTracck';
my $secret    = 'M2Mtracck';
my $resource  = $ARGV[0];
my $dt        = DateTime->now;
$dt = join '', $dt->ymd, $dt->hms;
$dt =~ s/[-\:]//g;
my $auth_sig = encode_base64( sha1( $auth_org . $auth_user . $dt . $secret ) );
print $auth_sig. "\n";
chomp($auth_sig);

my $url = URI->new("http://partner.api.sensorlogic.com/v4.1/$resource");

if ( $resource eq 'locationReport/list.json' || $resource eq 'locationReport/list' ) {
    $url->query_form_hash(
        {
            authSig       => $auth_sig,
            authTime      => $dt,
            authOrg       => $auth_org,
            authUser      => $auth_user,
            deviceId      => '989e1744-f2e0-11e2-810c-005056aa04c5',
            atLeastLatest => 'true'
        }
    );
}
else {
    $url->query_form_hash(
        {
            authSig  => $auth_sig,
            authTime => $dt,
            authOrg  => $auth_org,
            authUser => $auth_user
        }
    );
}

my $furl = Furl->new(
    agent   => 'MyGreatUA/2.0',
    timeout => 10,
);

my $req = $furl->get($url);

#print $req->content;
my $coder    = JSON::XS->new;
my $response = $coder->decode( $req->content );
use DDP;
my $lat  = $response->{body}->{locationReports}->{resultSet}->[0]->{latitude};
my $long = $response->{body}->{locationReports}->{resultSet}->[0]->{longitude};
print $url;
print $lat. '  ---  ' . $long . "\n";
