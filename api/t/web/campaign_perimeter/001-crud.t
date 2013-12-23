use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    rest_post '/addresses',
    name  => 'criar novo endereço',
    list  => 1,
    stash => 'address',
    [
        address      => 'Av. Paulista',
        number       => '568',
        neighborhood => 'Bela Vista',
        user_id      => 1,
        postal_code  => '01310000',
        city_id     => 1
    ];

    rest_post '/customers',
    name  => 'criar cliente',
    list  => 1,
    stash => 'customer',
    [
        fancy_name             => 'Foo Bar',
        corporate_name         => 'Foo Bar LTDA.',
        email                  => 'foo@bar.com.br',
        cnpj                   => '021.925.0001/25',
        state_registration     => '123acbd1',
        municipal_registration => 'muni12121',
        phone                  => '551111111111',
        mobile_phone           => '5511111111111',
        secondary_phone        => '5511111111144',
        address_id             => stash 'address.id',
        password               => 'teste',
        password_confirm       => 'teste',
        user_id                => 1
    ];

    rest_post '/campaigns',
    name  => 'criar campanha',
    list  => 1,
    stash => 'campaign',
    [
        name            => 'Campanha para teste',
        valid_from      => '2013-10-16 00:00:00',
        valid_to        => '2013-10-16 23:59:59',
        customer_id     => stash 'customer.id',
        status          => 1,
        activated_at    => '2013-10-16 18:30:30',
        description     => 'Campanha teste'
    ];

    rest_post '/campaign_perimeters',
    name  => 'criar perímetro de atuação',
    list  => 1,
    stash => 'campaign_perimeter',
    [
        campaign_id     => stash 'campaign.id',
        polyline        => "-23.5654716,-46.6517829,-23.5661741,-46.6509431, -23.5661741,-46.6509431, -23.5670843,-46.6517346, -23.5670843,-46.6517346",
        gis_polyline    => "-23.5654716,-46.6517829,-23.5661741,-46.6509431, -23.5661741,-46.6509431, -23.5670843,-46.6517346, -23.5670843,-46.6517346",
    ];

    stash_test 'campaign_perimeter.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'campaign_perimeter.id', 'get has the same id!' );
    };

    stash_test 'campaign_perimeter.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{campaign_perimeters}, 'campaign_perimeter list exists' );

        is( @$me, 1, '1 campaign_perimeter' );

        is( $me->[0]{campaign_id}, stash 'campaign.id', 'listing ok' );
    };

    rest_put stash 'campaign_perimeter.url',
      name => 'atualizar',
      [
        polyline        => "-23.5654716,-46.6517829,-23.5661741,-46.6509431, -23.5661741,-46.6509431, -23.5670843,-46.6517346",
        gis_polyline    => "-23.5654716,-46.6517829,-23.5661741,-46.6509431, -23.5661741,-46.6509431, -23.5670843,-46.6517346",
      ];

    rest_reload 'campaign_perimeter';

    stash_test 'campaign_perimeter.get', sub {
        my ($me) = @_;

        is( $me->{polyline}, "-23.5654716,-46.6517829,-23.5661741,-46.6509431, -23.5661741,-46.6509431, -23.5670843,-46.6517346", 'range updated!' );
    };

    rest_delete stash 'campaign_perimeter.url';

    rest_reload 'campaign_perimeter', 404;

    rest_reload_list 'campaign_perimeter';

    stash_test 'campaign_perimeter.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{campaign_perimeters}, 'campaign_perimeter list exists' );

        is( @$me, 0, '0 campaign_perimeter' );
    };

};

done_testing;