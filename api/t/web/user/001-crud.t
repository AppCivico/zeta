use strict;
use warnings;

use Test::More;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Catalyst::Test q(PI);

use HTTP::Request::Common qw(GET POST DELETE HEAD PUT);
use Package::Stash;

use PI::TestOnly::Mock::AuthUser;
my $stash = Package::Stash->new('Catalyst::Plugin::Authentication');
my $user  = PI::TestOnly::Mock::AuthUser->new;

$PI::TestOnly::Mock::AuthUser::_id    = 1;
@PI::TestOnly::Mock::AuthUser::_roles = qw/ superadmin /;

$stash->add_symbol( '&user',  sub { return $user } );
$stash->add_symbol( '&_user', sub { return $user } );

my $schema = PI->model('DB');

eval {
    $schema->txn_do(
        sub {

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

            die 'rollback';
        }
    );

};

die $@ unless $@ =~ /rollback/;

done_testing;
