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
        email            => 'car_owner@aware.com',
        name             => 'new',
        last_name        => 'owner',
        birth_date       => '1990-09-19',
        cpf              => '38979486804',
        bank_code        => '034',
        bank_ag          => '0147',
        bank_cc          => '3254126',
        telephone_number => '551165522547',
        mobile_provider  => 'claro',
        mobile_number    => '5511999999999',
        address          => 'Kingston',
        city_id          => 1,
        neighborhood     => 'DOWNTOWN',
        complement       => 'teste',
        number           => '13',
        postal_code      => '012478520',

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
        password_confirm       => '012478520',
        password               => '012478520',
        'city_id'              => 1,
        'email'                => 'sdasdas@asdas.com'
      ];

    #criar novo veiculo
    rest_post '/vehicles',
      name  => 'criar veículos',
      list  => 1,
      stash => 'vehicle',
      [
        renavam          => '123456789',
        cpf              => '38979486804',
        car_plate        => 'LPI2672',
        doors_number     => '5',
        manufacture_year => '2009',
        model            => 'clio',
        model_year       => '2009',
        brand_name       => 'Renault',
        car_type         => 'Hatch',
        km               => 41000,
        color            => 'silver',
        fuel_type        => 'flex',
        chassi           => '21231dsfs3',
        crv              => '231ss32',
        observations     => 'teste',
        driver_id        => stash 'driver.id',
        vehicle_owner_id => stash 'vehicle_owner.id'
      ];

    #criar novo rastreador
    rest_post '/trackers',
      name  => 'criar rastreador de veiculos',
      list  => 1,
      stash => 'tracker',
      [
        code       => '123456789',
        vehicle_id => stash 'vehicle.id'
      ];

    stash_test 'tracker.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'tracker.id', 'get has the same id!' );
    };

    stash_test 'tracker.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{trackers}, 'trackers list exists' );

        is( @$me, 1, '1 tracker' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{vehicle_id}, stash 'vehicle.id', 'listing ok' );
    };

    rest_put stash 'tracker.url',
      name => 'atualizar rastreador',
      [ code => 'ABCDE', ];

    rest_reload 'tracker';

    stash_test 'tracker.get', sub {
        my ($me) = @_;

        is( $me->{id},   stash 'tracker.id', 'get has the same id!' );
        is( $me->{code}, 'ABCDE',            'code updated!' );
    };

    rest_delete stash 'tracker.url';

    rest_reload 'tracker', 404;

    rest_reload_list 'tracker';

    stash_test 'tracker.list', sub {
        my ($me) = @_;
        ok( $me = delete $me->{trackers}, 'tracker list exists' );

        is( @$me, 0, '0 trackers' );
    };
};

done_testing;
