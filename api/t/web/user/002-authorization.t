use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

db_transaction {

    my $res = rest_get '/users', 403;
    is( $res->{error}, 'access denied', 'access denied' );

    rest_post '/login',
      name    => 'teste o login',
      is_fail => 1,
      stash   => 'login',
      [
        'email'    => 'superadmin@email.com',
        'password' => '44444'
      ];

    stash_test 'login', sub {
        my ($me) = @_;

        is( $me->{error}, "Login invalid(2)", 'Login invalid' );
    };

    rest_post '/login',
      name  => 'teste o login',
      code  => 200,
      stash => 'login',
      [
        'email'    => 'superadmin@email.com',
        'password' => '12345'
      ];

    stash_test 'login', sub {
        my ($me) = @_;

        ok( $me->{api_key}, 'has api_key' );
        is( $me->{email}, 'superadmin@email.com', 'email ok' );

        is_deeply( $me->{roles}, ['superadmin'], 'roles looks good' );

    };

    api_auth_as;

    rest_post '/check_email',
      name  => 'testar se o email existe',
      code  => 200,
      stash => 'mailtest',
      [ 'email' => 'superadmin@email.com' ];

    stash_test 'mailtest', sub {
        my ($me) = @_;
        is( $me->{user}{name}, 'superadmin', 'looks good' );
    };

    rest_post '/check_email',
      name  => 'testar se o email existe',
      code  => 200,
      stash => 'mailtest',
      [ 'email' => 'fooobar@aa.com' ];

    stash_test 'mailtest', sub {
        my ($me) = @_;
        is( $me->{user}, undef, 'looks ok too' );
    };

    rest_post '/check_email',
      name    => 'testar se o email existe',
      is_fail => 1,
      stash   => 'mailtest',
      [ 'email' => 'doesnot is a email' ];

};

done_testing;
