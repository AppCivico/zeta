use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

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

    rest_post '/campaign_payment_ranges',
    name  => 'criar faixa de pagamento de campanha',
    list  => 1,
    stash => 'campaign_payment_range',
    [
        campaign_id => stash 'campaign.id',
        range       => '60',
        value       => '400'
    ];

    stash_test 'campaign_payment_range.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'campaign_payment_range.id', 'get has the same id!' );
        is( $me->{range}, 60, 'range ok!' );
    };

    stash_test 'campaign_payment_range.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{campaign_payment_ranges}, 'campaign_payment_range list exists' );

        is( @$me, 1, '1 campaign_payment_range' );

        is( $me->[0]{value}, 400, 'listing ok' );
    };

    rest_put stash 'campaign_payment_range.url',
      name => 'atualizar faixa de pagamento',
      [
        range       => '80',
        value       => '600.00'
      ];

    rest_reload 'campaign_payment_range';

    stash_test 'campaign_payment_range.get', sub {
        my ($me) = @_;

        is( $me->{range}, 80, 'range updated!' );
    };

    rest_delete stash 'campaign_payment_range.url';

    rest_reload 'campaign_payment_range', 404;

    rest_reload_list 'campaign_payment_range';

    stash_test 'campaign_payment_range.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{campaign_payment_ranges}, 'campaign_payment_range list exists' );

        is( @$me, 0, '0 campaign_payment_range' );
    };

};

done_testing;