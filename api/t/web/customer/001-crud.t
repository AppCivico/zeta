use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo endereço origem
    rest_post '/addresses',
      name  => 'criar novo endereço origem',
      list  => 1,
      stash => 'address_orig',
      [
        address      => 'Av. Paulista',
        number       => '568',
        neighborhood => 'Bela Vista',
        user_id      => 1,
        postal_code  => '01310000'
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
        address_id                => stash 'address.id',
        password               => 'teste',
        password_confirm       => 'teste',
        user_id                => 1
      ];

    stash_test 'customer.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'customer.id', 'get has the same id!' );
        is( $me->{email}, 'foo@bar.com.br',    'email ok!' );
    };

    stash_test 'customer.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{customers}, 'customer list exists' );

        is( @$me, 1, '1 customer' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{email}, 'foo@bar.com.br', 'listing ok' );
    };

    rest_put stash 'customer.url',
      name => 'atualizar cliente',
      [
        fancy_name             => 'Foo Bar2',
        corporate_name         => 'Foo Bar2 LTDA.',
        email                  => 'foo@bar2.com.br',
        cnpj                   => '021.925.0001/25',
        state_registration     => '123acbd21',
        municipal_registration => 'muni121221',
        phone                  => '5511111112111',
        mobile_phone           => '55111111112111',
        secondary_phone        => '55111111111244',
        address_id             => stash 'address.id',
        password               => 'teste2',
        password_confirm       => 'teste2'
      ];

    rest_reload 'customer';

    stash_test 'customer.get', sub {
        my ($me) = @_;

        is( $me->{email}, 'foo@bar2.com.br', 'email updated!' );
    };

    rest_delete stash 'customer.url';

    rest_reload 'customer', 404;

    rest_reload_list 'customer';

    stash_test 'customer.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{customers}, 'customers list exists' );

        is( @$me, 0, '0 customer' );
    };

};

done_testing;
