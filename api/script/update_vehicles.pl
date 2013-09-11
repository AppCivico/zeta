use strict;
use warnings;
use utf8;
use lib './lib';
use FindBin qw($Bin);
use lib "$Bin/../lib";
use Furl;
use MIME::Base64;
use URI;
use URI::QueryParam;
use JSON::XS;

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

my $db = PI->model('DB');

#$db->resultset(Vehicle);

my $resource    = $ARGV[0];
my $url         = URI->new("http://fipeapi.appspot.com/api/1/carros");
my $coder       = JSON::XS->new;

if ($resource eq 'brand') {

    &update_brands ( $url.'/'.'marcas.json' );

} elsif ($resource eq 'model') {

    &update_models ( $url.'/'.'veiculos' );

} else {

    &update_brands ( $url.'/'.'marcas.json' );
    &update_models ( $url.'/'.'veiculos' );

}

sub update_brands {
    my ( $uri ) = @_;

    my $req         = &access_uri($uri);
    my $response    = $coder->decode( $req->content );

    my %brands;
    my $rs = $db->resultset('VehicleBrand')->search( undef, { columns => ['fipe_id'] } );

    while ( my $r = $rs->next ) {
        $brands{$r->fipe_id} = 1;
    }

    my $count = 0;
    foreach my $item ( @$response ) {
        next if exists $brands{$item->{id}};
        $rs->create({
            'name'      => $item->{fipe_name},
            'fipe_id'   => $item->{id}
        });
        $count++;
    }

    print $count." marcas atualizadas\n";
}

sub update_models {
    my ( $uri ) = @_;

    my %brands;
    my %model_list;
    my $db_models;

    my $rs          = $db->resultset('VehicleBrand')->search( undef, { columns => ['id', 'fipe_id'] } );
    my $model_rs    = $db->resultset('VehicleModel');

    while ( my $r = $rs->next ) {
        $brands{$r->id} = $r->fipe_id;
    }

    while (my ($key, $value) = each(%brands) ) {
        $db_models = $model_rs->search({'vehicle_brand_id' => $key}, { columns => ['fipe_id'] });

        while ( my $r = $db_models->next ) {
            $model_list{$r->fipe_id} = 1;
        }

        my $req         = &access_uri($uri."/$value.json");
        my $api_models  = $coder->decode( $req->content );
        my @car_name;
        my $aux_name = '';

        foreach my $item ( @$api_models ) {
            @car_name   = split('\b', $item->{name});
            my $str_car = $car_name[0];

            if ( ( exists $car_name[1] && $car_name[1] =~ /[\d||-]/) || $value == 33 ) {
                $str_car = $str_car.' '.$car_name[1].' '.exists $car_name[2]?$car_name[2]:'';
            }

            if($aux_name ne $str_car) {
               next if exists $model_list{$item->{id}};
               $model_rs->create({
                   'name'               => $str_car,
                   'fipe_id'            => $item->{id},
                   'vehicle_brand_id'   => $key
               });

               $aux_name = $str_car;
            }
        }

    }
}

sub access_uri {
    my ( $uri ) = @_;
    my $req;

    die 'URI inválida' if ! $uri;

    my $furl = Furl->new(
        agent   => 'MyGreatUA/2.0',
        timeout => 10,
    );

    eval { $req = $furl->get($uri) };

    die $@ if $@;

    return $req;
}