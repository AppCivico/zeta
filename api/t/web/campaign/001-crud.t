use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo endereço
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
        valid_from      => '2013-10-16 00:00:00',
        valid_to        => '2013-10-16 23:59:59',
        customer_id     => stash 'customer.id',
        status          => 1,
        activated_at    => '2013-10-16 18:30:30',
      ];

    stash_test 'campaign.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'customer.id', 'get has the same id!' );
        is( $me->{valid_from}, '2013-10-16 00:00:00', 'valid date ok!' );
    };

    stash_test 'campaign.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{campaigns}, 'campaign list exists' );

        is( @$me, 1, '1 campaign' );

        is( $me->{valid_from}, '2013-10-16 00:00:00', 'listing ok' );
    };

    rest_put stash 'campaign.url',
      name => 'atualizar campanha',
      [
        valid_from      => '2013-10-17 00:00:00',
        valid_to        => '2013-10-17 23:59:59',
        customer_id     => stash 'customer.id',
        status          => 1,
        activated_at    => '2013-10-17 18:30:30',
      ];

    rest_reload 'campaign';

    stash_test 'campaign.get', sub {
        my ($me) = @_;

        is( $me->{valid_from}, '2013-10-17 00:00:00', 'valid_from updated ok' );
    };

    rest_delete stash 'campaign.url';

    rest_reload 'campaign', 404;

    rest_reload_list 'campaign';

    stash_test 'campaign.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{campaigns}, 'campaigns list exists' );

        is( @$me, 0, '0 campaign' );
    };

};

done_testing;