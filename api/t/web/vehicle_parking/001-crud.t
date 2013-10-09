use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo driver
    rest_post '/drivers',
      name  => 'criar motorista',
      list  => 1,
      stash => 'driver',
      [
        'name'                 => 'Foo Bar',
        'birth_date'           => '1970-01-01',
        'cpf'                  => '88654621400',
        'first_driver_license' => '1990-01-01',
        'cnh_code'             => '12345678911',
        'cnh_validity'         => '2014-01-01',
        'mobile_number'        => '5511123456789',
        'telephone_number'     => '551112345678',
        'marital_state'        => 'S',
        'address'              => 'foo st',
        'neighborhood'         => 'foo bar',
        'complement'           => 'second floor',
        'number'               => '1',
        'postal_code'          => '01310000',
        'city_id'              => 1,
        password               => '12345',
        password_confirm       => '12345',
        'email'                => 'sdasdas@asdas.com',
        'email_confirm'        => 'sdasdas@asdas.com'
      ];

    #criar nova marca
    rest_post '/vehicle_brands',
      name  => 'criar marca de veículo',
      list  => 1,
      stash => 'vehicle_brand',
      [ name => 'teste', ];

    #criar novo modelo de veiculo
    rest_post '/vehicle_models',
      name  => 'criar modelo de veículo',
      list  => 1,
      stash => 'vehicle_model',
      [
        name             => 'TesteCar',
        vehicle_brand_id => stash 'vehicle_brand.id'
      ];

    #criar novo veiculo
    rest_post '/vehicles',
      name  => 'criar veículos',
      list  => 1,
      stash => 'vehicle',
      [
        renavam               => '123456789',
        car_plate             => 'LPI2672',
        doors_number          => '5',
        manufacture_year      => '2009',
        vehicle_model_id      => stash 'vehicle_model.id',
        model_year            => '2009',
        vehicle_brand_id      => stash 'vehicle_brand.id',
        vehicle_body_style_id => 1,
        km                    => 41000,
        vehicle_color_id      => 1,
        fuel_type             => 'flex',
        observations          => 'teste',
        driver_id             => stash 'driver.id',
        vehicle_owner_id      => stash 'vehicle_owner.id',
        state_id              => 1,
        city_id               => 1
      ];

    #criar novo endereço destino
    rest_post '/addresses',
      name  => 'criar novo endereço do estacionamento',
      list  => 1,
      stash => 'address',
      [
        address      => 'Av. Queiroz Filho',
        number       => '1500',
        neighborhood => 'Vila Hamburguesa',
        user_id      => 1,
        postal_code  => '05319000'
      ];

    #criar novo estacionamento
    rest_post '/vehicle_parking',
      name  => 'criar estacionamento veiculos',
      list  => 1,
      stash => 'vehicle_parking',
      [
        arrival_time            => '09:00:00',
        departure_time          => '18:00:00',
        address_id              => stash 'address.id',
        name                    => 'Carrefour',
        user_id                 => 1,
        vehicle_parking_type_id => 1,
      ];

    stash_test 'vehicle_parking.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_parking.id', 'get has the same id!' );
    };

    stash_test 'vehicle_parking.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_parking}, 'vehicle_parking list exists' );

        is( @$me, 1, '1 vehicle_parking' );
    };

    rest_put stash 'vehicle_parking.url',
      name => 'atualizar estacionamento',
      [
        arrival_time            => '10:00:00',
        departure_time          => '18:00:00',
        vehicle_id              => stash 'vehicle.id',
        address_id              => stash 'address.id',
        name                    => 'Carrefour',
        vehicle_parking_type_id => 1
      ];

    rest_reload 'vehicle_parking';

    stash_test 'vehicle_parking.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_parking.id', 'get has the same id!' );
        is( $me->{arrival_time}, '10:00:00', 'arrival time updated!' );
    };

    rest_delete stash 'vehicle_parking.url';

    rest_reload 'vehicle_parking', 404;

    rest_reload_list 'vehicle_parking';

    stash_test 'vehicle_parking.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_parking}, 'vehicle_parking list exists' );

        is( @$me, 0, '0 vehicle_parking' );
    };
};

done_testing;
