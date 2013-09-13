use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {
    #criar novo endereço
    rest_post '/addresses',
      name  => 'criar novo endereço',
      list  => 1,
      stash => 'address',
      [
        address         => 'Av. Paulista',
        number          => '568',
        neighborhood    => 'Bela Vista',
        user_id         => 1,
        postal_code     => '01310000'
      ];

    #criar novo profile de rota
    rest_post '/vehicle_route_types',
      name  => 'criar tipo de rota de veiculos',
      list  => 1,
      stash => 'vehicle_route_type',
      [
        name => 'Casa',
        address_id => stash 'address.id'
      ];

    stash_test 'vehicle_route_type.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_route_type.id', 'get has the same id!' );
    };

    stash_test 'vehicle_route_type.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_route_types}, 'vehicle_route_type list exists' );

        is( @$me, 1, '1 vehicle_route_type' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{name}, 'Casa', 'listing ok' );
    };

    rest_put stash 'vehicle_route_type.url',
      name => 'atualizar rota',
      [
        name => 'Trabalho',
      ];

    rest_reload 'vehicle_route_type';

    stash_test 'vehicle_route_type.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_route_type.id', 'get has the same id!' );
        is( $me->{name}, 'Trabalho', 'route type updated!' );
    };

    rest_delete stash 'vehicle_route_type.url';

    rest_reload 'vehicle_route_type', 404;

    rest_reload_list 'vehicle_route_type';

    stash_test 'vehicle_route_type.list', sub {
        my ($me) = @_;
        ok( $me = delete $me->{vehicle_route_types}, 'vehicle_route_type list exists' );

        is( @$me, 0, '0 vehicle_route_type' );
    };
};

done_testing;