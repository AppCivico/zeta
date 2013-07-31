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
        'email'                => 'email1@email.com'
      ];

    rest_post '/drivers',
      name    => 'nao criar motorista com mesmo email',
      stash   => 'driver2',
      is_fail => 1,
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
        password               => 'a',
        password_confirm       => 'a',
        'postal_code'          => '01310000',
        'city_id'              => 1,
        'email'                => 'email1@email.com'
      ];

    stash_test 'driver2', sub {
        my ($me) = @_;
        like( $me->{error}, qr/"email":"invalid"/, 'email invalido' );
    };


    rest_post '/drivers',
      name    => 'criando mais um usuario com email diferente',
      stash   => 'driver2',
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
        password               => 'a',
        password_confirm       => 'a',
        'neighborhood'         => 'foo bar',
        'complement'           => 'second floor',
        'number'               => '1',
        'postal_code'          => '01310000',
        'city_id'              => 1,
        'email'                => 'email2@email.com'
      ];

    stash_test 'driver2.get', sub {
        my ($me) = @_;

        is( $me->{email}, 'email2@email.com', 'email valido' );
    };

    rest_put stash 'driver2.url',
      name => 'atualizar o email do motorista',
      [
        'email'              => 'email_novo@email.com'
      ];

    rest_reload 'driver2';

    stash_test 'driver2.get', sub {
        my ($me) = @_;
        is( $me->{email}, 'email_novo@email.com', 'email atualizado' );
    };


    rest_put stash 'driver2.url',
      is_fail => 1,
      stash => 'driver2',
      name => 'atualizar motorista novo com o email do antigo tem que dar pau',
      [
        'email'              => 'email1@email.com'
      ];

    stash_test 'driver2', sub {
        my ($me) = @_;
        like( $me->{error}, qr/"email":"invalid"/, 'email invalido' );
    };

};
done_testing;
