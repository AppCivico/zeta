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
        POST '/users',
        [
            'name'     => 'Foo Bar',
            'email'    => 'foo1@email.com',
            'password' => 'foobarquux1',
            role       => 'user'
        ]
    );
    ok( $res->is_success, 'user created' );
    is( $res->code, 201, 'user created' );

    my $user_url = $res->header('Location');
    ( $res, $c ) = ctx_request(
        GET $user_url,
        [
            'name'     => 'Foo Bar',
            'email'    => 'foo1@email.com',
            'password' => 'foobarquux1',
            role       => 'user'
        ]
    );
    ok( $res->is_success, 'get user success' );
    is( $res->code, 200, 'get 200' );

    ( $res, $c ) = ctx_request(
        GET '/users'
    );
    ok( $res->is_success, 'get user success' );
    is( $res->code, 200, 'get 200' );

    my $req = POST $user_url,
        [
        'name'     => 'AAAAAAAAA',
        'email'    => 'foo2@email.com',
        'password' => 'foobarquux1',
        role       => 'user'
        ];
    $req->method('PUT');
    ( $res, $c ) = ctx_request($req);
    ok( $res->is_success, 'put user success' );
    is( $res->code, 202, 'put 202' );

    ( $res, $c ) = ctx_request(
        GET $user_url,
        [
            'name'     => 'Foo Bar',
            'email'    => 'foo1@email.com',
            'password' => 'foobarquux1',
            role       => 'user'
        ]
    );

    ok( $res->is_success, 'get user success' );
    is( $res->code, 200, 'get 200' );

};

done_testing;
