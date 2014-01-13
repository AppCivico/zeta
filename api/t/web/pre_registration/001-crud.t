use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

#     criar novo pré-cadastro
    rest_post '/pre_registrations',
      name  => 'criar pré-cadastro',
      list  => 1,
      stash => 'pre_registration',
      [
        'name'                 => 'Foo Bar',
        'birth_date'           => '1970-01-01',
        'telephone'            => '551112345678',
        'marital_state'        => 'S',
        'email'                => 'sdasdas@asdas.com',
        'gender'               => 'm',
        city_id                => 1,
        zone_id                => 1,
        'manufactured_year'    => 2014,
        'average_mileage'      => 5000
      ];

    stash_test 'pre_registration.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'pre_registration.id',  'get has the same id!' );
        is( $me->{email}, 'sdasdas@asdas.com', 'email ok!' );
    };

    stash_test 'pre_registration.list', sub {
        my ($me) = @_;
        ok( $me = delete $me->{pre_registrations}, 'pre_registrations list exists' );

        is( @$me, 1, '1 pre_registrations' );

        is( $me->[0]{email}, 'sdasdas@asdas.com', 'listing ok' );
    };

    rest_put stash 'pre_registration.url',
      name => 'atualizar pré-cadastro',
      [
        'name'                 => 'Foolish Bar',
        'birth_date'           => '1970-01-01',
        'telephone'            => '551112345678',
        'marital_state'        => 'S',
        'email'                => 'sdasdas@asdas.com',
        'gender'               => 'm',
        city_id                => 1,
        zone_id                => 1,
        'manufactured_year'    => 2014,
        'average_mileage'      => 5000
      ];

    rest_reload 'pre_registration';

    stash_test 'pre_registration.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Foolish Bar', 'name updated!' );
    };

    rest_delete stash 'pre_registration.url';

    rest_reload 'pre_registration', 404;

    rest_reload_list 'pre_registration';

    stash_test 'pre_registration.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{pre_registrations}, 'pre_registrations list exists' );

        is( @$me, 0, '0 pre_registrations ' );
    };

};

done_testing;