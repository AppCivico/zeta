use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    rest_post '/drivers',
      name  => 'criar motorista',
      list  => 1,
      stash => 'driver1',
      [
        'name'                 => 'Foo',
        'last_name'            => 'Bar',
        'birth_date'           => '1970-01-01',
        'cpf'                  => '38979486804',
        'first_driver_license' => '1990-01-01',
        'cnh_code'             => 'xxxxx',
        'cnh_validity'         => '2014-01-01',
        'mobile_provider'      => 'test',
        'mobile_number'        => '5511123456789',
        'telephone_number'     => '551112345678',
        'marital_state'        => 'S',
        'address'              => 'foo st',
        'neighborhood'         => 'foo bar',
        'complement'           => 'second floor',
        'number'               => '1',
        'postal_code'          => '01310000',
        'city_id'              => 1,
        password               => 'a',
        password_confirm       => 'a',
        'email'                => 'sdasdas@asdas.com'
      ];

    stash_test 'driver1.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'driver1.id',  'get has the same id!' );
        is( $me->{email}, 'sdasdas@asdas.com', 'email ok!' );
    };

    stash_test 'driver1.list', sub {
        my ($me) = @_;
        ok( $me = delete $me->{drivers}, 'drivers list exists' );

        is( @$me, 1, '1 drivers' );

        is( $me->[0]{email}, 'sdasdas@asdas.com', 'listing ok' );
    };

    rest_put stash 'driver1.url',
      name => 'atualizar motorista',
      [
        'name'                 => 'Foo2',
        'last_name'            => 'Bar2',
        'birth_date'           => '1972-01-01',
        'cpf'                  => '93075317810',
        'first_driver_license' => '1992-01-01',
        'cnh_code'             => 'xxxxx2',
        'cnh_validity'         => '2016-01-01',
        'mobile_provider'      => 'test2',
        'mobile_number'        => '551111111111',
        'telephone_number'     => '551111111111',
        'marital_state'        => 'D',
        'address'              => 'foo st2',
        'neighborhood'         => 'foo bar2',

        password               => 'a',
        password_confirm       => 'a',
        'complement'           => 'third floor',
        'number'               => '2',
        'postal_code'          => '01310002',
        'city_id'              => 1
      ];

    rest_reload 'driver1';

    stash_test 'driver1.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Foo2', 'name updated!' );
    };

    rest_delete stash 'driver1.url';

    rest_reload 'driver1', 404;

    rest_reload_list 'driver1';

    stash_test 'driver1.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{drivers}, 'drivers list exists' );

        is( @$me, 0, '0 drivers ' );
    };

};
done_testing;
