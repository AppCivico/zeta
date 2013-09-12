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
        [
            name => 'teste',
        ];

    #criar novo modelo de veiculo
    rest_post '/vehicle_models',
      name  => 'criar modelo de veículo',
      list  => 1,
      stash => 'vehicle_model',
      [
        name => 'TesteCar',
        vehicle_brand_id => stash 'vehicle_brand.id'
      ];

    #criar nova cor de veiculo
    rest_post '/vehicle_colors',
      name  => 'criar cor de veículo',
      list  => 1,
      stash => 'vehicle_color',
      [
        name => 'Teste Gold',
      ];

    #criar nova carroceria de veiculo
    rest_post '/vehicle_body_styles',
      name  => 'criar carroceria de veículo',
      list  => 1,
      stash => 'vehicle_body_style',
      [
        name => 'Teste sedan',
      ];

     #criar novo veiculo
    rest_post '/vehicles',
      name  => 'criar veículos',
      list  => 1,
      stash => 'vehicle',
      [
        renavam                 => '123456789',
        car_plate               => 'LPI2672',
        doors_number            => '5',
        manufacture_year        => '2009',
        vehicle_model_id        => stash 'vehicle_model.id',
        model_year              => '2009',
        vehicle_brand_id        => stash 'vehicle_brand.id',
        vehicle_body_style_id   => stash 'vehicle_body_style.id',
        km                      => 41000,
        vehicle_color_id        => stash 'vehicle_color.id',
        fuel_type               => 'flex',
        observations            => 'teste',
        driver_id               => stash 'driver.id',
        vehicle_owner_id        => stash 'vehicle_owner.id',
        state_id                => 1,
        city_id                 => 1
      ];

    #criar novo endereço origem
    rest_post '/addresses',
      name  => 'criar novo endereço origem',
      list  => 1,
      stash => 'address_orig',
      [
        address         => 'Av. Paulista',
        number          => '568',
        neighborhood    => 'Bela Vista',
        user_id         => 1,
        postal_code     => '01310000'
      ];

    #criar novo profile de rota origem
    rest_post '/vehicle_route_types',
      name  => 'criar tipo de rota de veiculos origem',
      list  => 1,
      stash => 'vehicle_route_type_orig',
      [
        name => 'Casa',
        address_id => stash 'address_orig.id'
      ];

    #criar novo endereço destino
    rest_post '/addresses',
      name  => 'criar novo endereço destino',
      list  => 1,
      stash => 'address_destino',
      [
        address         => 'Av. Queiroz Filho',
        number          => '1700',
        neighborhood    => 'Vila Hamburguesa',
        user_id         => 1,
        postal_code     => '05319000'
      ];

    #criar novo profile de rota de destino
    rest_post '/vehicle_route_types',
      name  => 'criar tipo de rota de veiculos destino',
      list  => 1,
      stash => 'vehicle_route_type_destino',
      [
        name => 'Trabalho',
        address_id => stash 'address_destino.id'
      ];

    #criar nova rota
    rest_post '/vehicle_routes',
      name  => 'criar rota de veiculos',
      list  => 1,
      stash => 'vehicle_route',
      [
        name                => 'Rota teste 1',
        start_time_gone     => '08:00:00',
        start_time_back     => '18:00:00',
        origin_id           => stash 'vehicle_route_type_orig.id',
        destination_id      => stash 'vehicle_route_type_destino.id',
        vehicle_id          => stash 'vehicle.id',
        days_of_week        => '1,2,3,4,5,6,7'
      ];

    stash_test 'vehicle_route.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_route.id', 'get has the same id!' );
    };

    stash_test 'vehicle_route.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_routes}, 'vehicle_route list exists' );

        is( @$me, 1, '1 vehicle_route' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{vehicle_id}, stash 'vehicle.id', 'listing ok' );
    };

    rest_put stash 'vehicle_route.url',
      name => 'atualizar rota',
      [
        name                => 'Rota teste 2',
        start_time_gone     => '18:00:00',
        start_time_back     => '20:00:00',
        origin_id           => stash 'vehicle_route_type_destino.id',
        destination_id      => stash 'vehicle_route_type_orig.id',
        vehicle_id          => stash 'vehicle.id',
        days_of_week        => '1,2,3,4,5,6,7'
      ];

    rest_reload 'vehicle_route';

    stash_test 'vehicle_route.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_route.id', 'get has the same id!' );
        is( $me->{start_time_gone}, '18:00:00', 'start_time_gone updated!' );
    };

    rest_delete stash 'vehicle_route.url';

    rest_reload 'vehicle_route', 404;

    rest_reload_list 'vehicle_route';

    stash_test 'vehicle_route.list', sub {
        my ($me) = @_;
        ok( $me = delete $me->{vehicle_routes}, 'vehicle_route list exists' );

        is( @$me, 0, '0 vehicle_route' );
    };
};

done_testing;