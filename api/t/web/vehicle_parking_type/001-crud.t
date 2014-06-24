use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo tipo de estacionamento
    rest_post '/vehicle_parking_types',
      name  => 'criar novo tipo de estacionamento',
      list  => 1,
      stash => 'vehicle_parking_type',
      [ name => 'Galpão fechado' ];

    stash_test 'vehicle_parking_type.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_parking_type.id', 'get has the same id!' );
    };

    stash_test 'vehicle_parking_type.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_parking_types}, 'vehicle_parking_type list exists' );

        is( @$me, 1, '1 vehicle_parking_type' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{name}, 'Galpão fechado', 'listing ok' );
    };

    rest_put stash 'vehicle_parking_type.url',
      name => 'atualizar estacionamento',
      [ name => 'Rua / Avenida' ];

    rest_reload 'vehicle_parking_type';

    stash_test 'vehicle_parking_type.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_parking_type.id', 'get has the same id!' );
        is( $me->{name}, 'Rua / Avenida', 'name updated!' );
    };

    rest_delete stash 'vehicle_parking_type.url';

    rest_reload 'vehicle_parking_type', 404;

    rest_reload_list 'vehicle_parking_type';

    stash_test 'vehicle_parking_type.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_parking_types}, 'vehicle_parking_type list exists' );

        is( @$me, 0, '0 vehicle_parking_type' );
    };
};

done_testing;
