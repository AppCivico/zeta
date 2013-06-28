use strict;
use warnings;

use Test::More;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Catalyst::Test q(PI);

use HTTP::Request::Common qw(GET POST DELETE HEAD PUT);
use Package::Stash;

use PI::TestOnly::Mock::AuthUser;
my $stash  = Package::Stash->new('Catalyst::Plugin::Authentication');
my $user   = PI::TestOnly::Mock::AuthUser->new;

$PI::TestOnly::Mock::AuthUser::_id    = 1;
@PI::TestOnly::Mock::AuthUser::_roles = qw/ admin /;

$stash->add_symbol( '&user',  sub { return $user } );
$stash->add_symbol( '&_user', sub { return $user } );

my $schema = PI->model('DB');

eval {
    $schema->txn_do(
        sub {

            my ( $res, $c );
            ( $res, $c ) = ctx_request(
                POST '/api/user?api_key=test',
                [
                    api_key    => 'test_partner',
                    'name'     => 'Foo Bar',
                    'email'    => 'foo1@email.com',
                    'password' => 'foobarquux1',
                    role       => 'user'
                ]
            );use DDP; p $res;

            ok( $res->is_success, 'user created' );
            is( $res->code, 201, 'user created' );

            die 'rollback';
        }
    );

};

die $@ unless $@ =~ /rollback/;

done_testing;
