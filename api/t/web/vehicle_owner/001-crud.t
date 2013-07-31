use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {
    rest_post '/vehicle_owners',
      name  => 'criar dono de veiculos',
      list  => 1,
      stash => 'vehicle_owner',
      [
        email   => 'car_owner@aware.com',
        name    => 'new',
        last_name   => 'owner',
        birth_date=> '1990-09-19',
        cpf=> '38979486804',
        bank_code=> '034',
        bank_ag=> '0147',
        bank_cc=> '3254126',
        telephone_number=> '551165522547',
        mobile_provider=>   'claro',
        mobile_number=> '5511999999999',
        address=> 'Kingston',
        city_id=> 1,
        neighborhood=> 'DOWNTOWN',
        complement=> 'teste',
        number=> '13',
        postal_code=> '012478520'
      ];

    stash_test 'vehicle_owner.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_owner.id',  'get has the same id!' );
    };

    stash_test 'vehicle_owner.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_owners}, 'vehicle list exists' );

        is( @$me, 1, '1 vehicle owner' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{email}, 'car_owner@aware.com', 'listing ok' );
    };

    rest_put stash 'vehicle_owner.url',
      name => 'atualizar dono de veiculo',
      [
        email   => 'car_owner2@aware.com',
        name    => 'new2',
        last_name   => 'owner2',
        birth_date=> '1990-09-20',
        cpf=> '38979486810',
        bank_code=> '035',
        bank_ag=> '0148',
        bank_cc=> '3254127',
        telephone_number=> '551165522548',
        mobile_provider=>   'vivo',
        mobile_number=> '5511999999998',
        address=> 'Kingston',
        city_id=> 1,
        neighborhood=> 'ROCK',
        complement=> 'tes',
        number=> '14',
        postal_code=> '012478521'
      ];

    rest_reload 'vehicle_owner';

    stash_test 'vehicle_owner.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'vehicle_owner.id',  'get has the same id!' );
        is( $me->{email}, 'car_owner2@aware.com', 'email updated!' );
    };

    rest_delete stash 'vehicle_owner.url';

    rest_reload 'vehicle_owner', 404;

    rest_reload_list 'vehicle_owner';

    stash_test 'vehicle_owner.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_owners}, 'vehicle_owners list exists' );

        is( @$me, ,0, '0 vehicle_owner' );
    };
};

done_testing;
