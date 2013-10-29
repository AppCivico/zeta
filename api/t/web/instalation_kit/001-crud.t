use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo driver
    rest_post '/drivers',
      name  => 'criar motorista',
      list  => 1,
      stash => 'driver',
      [
        'name'                 => 'Foolish Bar',
        'birth_date'           => '1972-01-01',
        email                => 'test5478@yopmail.com',
        email_confirm        => 'test5478@yopmail.com',
        'cpf'                  => '88654621400',
        'first_driver_license' => '1992-01-01',
        'cnh_code'             => '12345678911',
        'cnh_validity'         => '2016-01-01',
        'mobile_number'        => '551111111111',
        'telephone_number'     => '551111111111',
        'marital_state'        => 'D',
        'address'              => 'foo st2',
        'neighborhood'         => 'foo bar2',
        password               => '12345',
        password_confirm       => '12345',
        'complement'           => 'third floor',
        'number'               => '2',
        'postal_code'          => '01310002',
        'city_id'              => 1
      ];

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

    #criar campanha
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
      ];

    #criar kit de instalação
    rest_post '/instalation_kits',
    name  => 'criar kit de instalação',
    list  => 1,
    stash => 'instalation_kit',
      [
        driver_id   => stash 'driver.id',
        status      => 1,
        campaign_id => stash 'campaign.id'
      ];

    stash_test 'instalation_kit.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'instalation_kit.id', 'get has the same id!' );
    };

    stash_test 'instalation_kit.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{instalation_kits}, 'instalation_kit list exists' );

        is( @$me, 1, '1 instalation_kit' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{driver_id}, stash 'driver.id', 'listing ok' );
    };

    rest_delete stash 'instalation_kit.url';

    rest_reload 'instalation_kit', 404;

    rest_reload_list 'instalation_kit';

    stash_test 'instalation_kit.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{instalation_kits}, 'instalation_kit list exists' );

        is( @$me, 0, '0 instalation_kits' );
    };

};

done_testing;
