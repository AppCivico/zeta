use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    for my $num (1..3){
        rest_post '/drivers',
            name  => 'criar motorista',
            stash => 'driver' . $num,
        [
            'name'                 => 'Foo' . $num,
            'last_name'            => 'Bar' . $num,
            'birth_date'           => '1970-01-01',
            'cpf'                  => '3897948680' . $num,
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
            password_confirm=> '012478520',
            password=> '012478520',
            'city_id'              => 1,
            'email'                => $num . 'sdasdas@asdas.com'
        ];
    }

    api_auth_as user_id => 1, roles => ['user'];

    my $url = (stash 'driver1.url') . '/vehicle_with_owner';
    rest_post $url,
      name  => 'criar carro sem passar os dados do dono, mas driver_is_the_owner=1',
      stash => 'vehicle1',
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

        # vai sem esse campo
        # vehicle_owner_id => stash 'vehicle_owner.id'

        driver_is_the_owner => 1,

        bank_cc => 'fo',
        bank_ag => 'fo',
        bank_code => '123',

      ];

    stash_test 'vehicle1.get', sub {
        my ($me) = @_;

        is( $me->{vehicle_owner_id}, (stash 'vehicle1')->{vehicle_owner_id},  'vehicle_with_owner has owner id' );
    };


    $url = (stash 'driver2.url') . '/vehicle_with_owner';
    rest_post $url,
      name  => 'criar dono sem driver_is_the_owner',
      stash => 'vehicle2',
      [
        renavam => '123456790',
        cpf     => '38979486805',
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

        email => 'foobar@email.com',
        city_id => 1,
        name => 'dono do carro',
        telephone_number => '12 4555555',
        birth_date => '2012-01-01',
        last_name => 'zomubar',

        bank_cc => '222',
        bank_ag => '112',
        bank_code => '33',

      ];

    stash_test 'vehicle2.get', sub {
        my ($me) = @_;

        is( $me->{vehicle_owner_id}, (stash 'vehicle2')->{vehicle_owner_id},  'vehicle_with_owner has owner id' );
    };

    do {
        my $res = rest_get '/vehicle_owners/' . (stash 'vehicle2')->{vehicle_owner_id};

        is($res->{email}, 'foobar@email.com', 'email looks good');
        is($res->{last_name}, 'zomubar', 'last_name looks good');
    };

    do {
        my $res = rest_get '/vehicle_owners/' . (stash 'vehicle1')->{vehicle_owner_id};

        my $driver1 = stash 'driver1.get';

        is($res->{email}, $driver1->{email}, 'email looks good');
        is($res->{last_name}, $driver1->{last_name}, 'last_name looks good');
    };



    $url = (stash 'driver3.url') . '/vehicle_with_owner';
    rest_post $url,
      name  => 'tentar criar faltando campos do carro',
      is_fail => 1,
      stash => 'vehicle3',
      [
        renavam => '123456740',
        # vai sem esse campo
        # vehicle_owner_id => stash 'vehicle_owner.id'

        driver_is_the_owner => 1,

        bank_cc => '222',
        bank_ag => '112',
        bank_code => '33',
      ];
    stash_test 'vehicle3', sub {
        my ($me) = @_;
        like $me->{error}, qr/"missing"/, 'has errors';
    };



};

done_testing;
