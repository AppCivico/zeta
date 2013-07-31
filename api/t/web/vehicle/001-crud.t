use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

#criar novo owner
    rest_post '/vehicle_owners',
        name  => 'criar dono de veículos',
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

#criar novo driver
    rest_post '/drivers',
        name  => 'criar motorista',
        list  => 1,
        stash => 'driver',
      [
        'name'                 => 'Foo',
        'last_name'            => 'Bar',
        'birth_date'           => '1970-01-01',
        'cpf'                  => '38979486804',
        'first_driver_license' => '1990-01-01',
        'cnh_code'             => 'xxxxx',
        'cnh_validity'         => '2014-01-01',
        'mobile_provider'      => 'test',
        'mobile_number'        => '5511123456789',
        'telephone_number'     => '551112345678',
        'marital_state'        => 'S',
        'address'              => 'foo st',
        'neighborhood'         => 'foo bar',
        'complement'           => 'second floor',
        'number'               => '1',
        'postal_code'          => '01310000',
        'city_id'              => 1,
        'email'                => 'sdasdas@asdas.com'
      ];

#criar novo veiculo
    rest_post '/vehicles',
      name  => 'criar veículos',
      list  => 1,
      stash => 'vehicle',
      [
        renavam => '123456789',
        cpf     => '38979486804',
        car_plate   => 'LPI2672',
        doors_number => '5',
        manufacture_year => '2009',
        model => 'clio',
        model_year => '2009',
        brand_name => 'Renault',
        car_type => 'Hatch',
        km => 41000,
        color => 'silver',
        fuel_type => 'flex',
        chassi => '21231dsfs3',
        crv => '231ss32',
        observations => 'teste',
        driver_id   => stash 'driver.id',
        vehicle_owner_id => stash 'vehicle_owner.id'
      ];

    stash_test 'vehicle.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle.id',  'get has the same id!' );
    };

    stash_test 'vehicle.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicles}, 'vehicle list exists' );

        is( @$me, 1, '1 vehicle' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{model}, 'clio', 'listing ok' );
    };

    rest_put stash 'vehicle.url',
      name => 'atualizar veiculo',
      [
        renavam => '1234567810',
        cpf     => '02193635872',
        car_plate   => 'BUA2609',
        doors_number => '3',
        manufacture_year => '1995',
        model => 'gol',
        model_year => '1995',
        brand_name => 'VW',
        car_type => 'Hatch',
        km => 100000,
        color => 'silver',
        fuel_type => 'gasoline',
        chassi => '21231dssa21fs3',
        crv => '231s114s32',
        observations => 'teste2',
        driver_id   => stash 'driver.id',
        vehicle_owner_id => stash 'vehicle_owner.id'
      ];

    rest_reload 'vehicle';

    stash_test 'vehicle.get', sub {
        my ($me) = @_;

        is( $me->{model}, 'gol', 'car model updated!' );
    };

    rest_delete stash 'vehicle.url';

    rest_reload 'vehicle', 404;

    rest_reload_list 'vehicle';

    stash_test 'vehicle.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicles}, 'vehicle list exists' );

        is( @$me, 0, '0 vehicles' );
    };
};

done_testing;
