use strict;
use warnings;

use Test::More;
use HTTP::Request::Common;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Catalyst::Test qw(PI);

my $schema = PI->model('DB');

eval {
    $schema->txn_do(

        sub {

            my ( $res, $c );
            ( $res, $c ) = ctx_request( GET '/users', );

            ok( !$res->is_success, 'access denied' );
            is( $res->code, 403, q{forbidden} );

            ( $res, $c ) = ctx_request(
                POST '/login',
                [
                    'email'    => 'INVALDOO',
                    'password' => '12345'
                ],
            );
            ok( !$res->is_success, 'user ok' );
            is( $res->code, 400, 'status 400 OK' );

            ( $res, $c ) = ctx_request(
                POST '/login',
                [
                    'email'    => 'superadmin@email.com',
                    'password' => '12345'
                ],
            );
            ok( $res->is_success, 'user ok' );
            is( $res->code, 200, 'status 200 OK' );

            die 'rollback';
        }
    );
};

die $@ unless $@ =~ /rollback/;

done_testing;
