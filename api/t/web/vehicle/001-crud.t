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
        'cpf'                  => '71082918270',
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
            name => 'renault',
        ];

    #criar novo modelo de veiculo
    rest_post '/vehicle_models',
      name  => 'criar modelo de veículo',
      list  => 1,
      stash => 'vehicle_model',
      [
        name => 'Clio',
        vehicle_brand_id => stash 'vehicle_brand.id'
      ];

    #criar nova cor de veiculo
    rest_post '/vehicle_colors',
      name  => 'criar cor de veículo',
      list  => 1,
      stash => 'vehicle_color',
      [
        name => 'Preto',
      ];

    #criar nova carroceria de veiculo
    rest_post '/vehicle_body_styles',
      name  => 'criar carroceria de veículo',
      list  => 1,
      stash => 'vehicle_body_style',
      [
        name => 'Hatch',
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

    stash_test 'vehicle.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle.id', 'get has the same id!' );
    };

    stash_test 'vehicle.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicles}, 'vehicle list exists' );

        is( @$me, 1, '1 vehicle' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{vehicle_model_id}, stash 'vehicle_model.id', 'listing ok' );
    };

    do {
        my $err = rest_get '/vehicles', 400, { driver_id => 'not a number' };
        is( $err->{error}, 'invalid param driver_id', 'invalid number!' );

        $err = rest_get '/vehicles', 200, { driver_id => -5 };
        is_deeply( $err->{vehicles}, [], 'no vehicles' );

        my $res = rest_get '/vehicles', 200, { driver_id => stash 'driver.id' };
        is( @{ $res->{vehicles} }, 1, '1 vehicle' );
        is( $res->{vehicles}[0]{driver_id}, stash 'driver.id', 'same driver' );

    };

    rest_put stash 'vehicle.url',
      name => 'atualizar veiculo',
      [
        renavam                 => '987654321',
        car_plate               => 'BUA2609',
        doors_number            => '5',
        manufacture_year        => '1995',
        vehicle_model_id        => stash 'vehicle_model.id',
        model_year              => '1996',
        vehicle_brand_id        => stash 'vehicle_brand.id',
        vehicle_body_style_id   => stash 'vehicle_body_style_id.id',
        km                      => 70000,
        vehicle_color_id        => stash 'vehicle_color.id',
        fuel_type               => 'flex',
        observations            => 'teste',
        driver_id               => stash 'driver.id',
        vehicle_owner_id        => stash 'vehicle_owner.id',
        state_id                => 1,
        city_id                 => 1
      ];

    rest_reload 'vehicle';

    stash_test 'vehicle.get', sub {
        my ($me) = @_;

        is( $me->{km}, 70000, 'car km updated!' );
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
