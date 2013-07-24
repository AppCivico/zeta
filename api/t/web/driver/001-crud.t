use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Test::More;
use Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    my ( $res, $c );
    ( $res, $c ) = ctx_request(
        POST '/drivers',
        [
            'name'                  => 'Foo',
            'last_name'             => 'Bar',
            'birth_date'            => '1970-01-01',
            'cpf'                   => '38979486804',
            'first_driver_license'  => '1990-01-01',
            'cnh_code'              => 'xxxxx',
            'cnh_validity'          => '2014-01-01',
            'mobile_provider'       => 'test',
            'mobile_number'         => '5511123456789',
            'telephone_number'      => '551112345678',
            'marital_state'         => 'S',
            'address'               => 'foo st',
            'neighborhood'          => 'foo bar',
            'complement'            => 'second floor',
            'number'                => '1',
            'postal_code'           => '01310000',
            'city_id'               => 1,
            'email'               => 'sdasdas@asdas.com'
       ]
    );
    ok( $res->is_success, 'driver created' );
    is( $res->code, 201, 'driver created' );

    my $driver_url = $res->header('Location');
    ( $res, $c ) = ctx_request(
        GET $driver_url
    );

    ok( $res->is_success, 'get driver success' );
    is( $res->code, 200, 'get 200' );

    ( $res, $c ) = ctx_request(
        GET '/drivers'
    );

    ok( $res->is_success, 'get driver success' );
    is( $res->code, 200, 'get 200' );

    my $req = POST $driver_url,
        [
            'name'                  => 'Foo2',
            'last_name'             => 'Bar2',
            'birth_date'            => '1972-01-01',
            'cpf'                   => '93075317810',
            'first_driver_license'  => '1992-01-01',
            'cnh_code'              => 'xxxxx2',
            'cnh_validity'          => '2016-01-01',
            'mobile_provider'       => 'test2',
            'mobile_number'         => '551111111111',
            'telephone_number'      => '551111111111',
            'marital_state'         => 'D',
            'address'               => 'foo st2',
            'neighborhood'          => 'foo bar2',
            'complement'            => 'third floor',
            'number'                => '2',
            'postal_code'           => '01310002',
            'city_id'               => 1
        ];
    $req->method('PUT');
    ( $res, $c ) = ctx_request($req);
    ok( $res->is_success, 'put driver success' );
    is( $res->code, 202, 'put 202' );

    ( $res, $c ) = ctx_request(
        GET $driver_url
    );

    ok( $res->is_success, 'get driver success' );
    is( $res->code, 200, 'get 200' );

};
done_testing;
