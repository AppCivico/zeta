use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

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
        car_plate        => 'LZeta2672',
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

    #criar token de veículo
    rest_post '/vehicle_tokens',
      name  => 'criar token para veículo',
      list  => 1,
      stash => 'vehicle_token',
      [
        vehicle_id => stash 'vehicle.id',
        user_id    => 3,
      ];

    #checar validade de token de veículo
    stash_test 'vehicle', sub {
        my ($vehicle) = @_;
        stash_test 'vehicle_token', sub {
            my ($token) = @_;

            my $ret = rest_get '/vehicle_token_check', 200,
              {
                car_plate => $vehicle->{car_plate},
                token     => $token->{token}
              };

            is( $vehicle->{id}, $ret->{id}, 'Token is valid!' );
          }

      }

};

done_testing;
