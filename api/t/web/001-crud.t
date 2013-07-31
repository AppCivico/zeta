use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

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
        driver_id   => 1,
        vehicle_owner_id => 1
      ];

    stash_test 'vehicle.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle.id',  'get has the same id!' );
    };

    stash_test 'vehicle.list', sub {
        my ($me) = @_;
        use DDP; p @$me;
        ok( $me = delete $me->{vehicles}, 'vehicle list exists' );

        is( @$me, 2, '2 users' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[1]{email}, 'foo1@email.com', 'listing ok' );
    };

    rest_put stash 'user.url',
      name => 'atualizar usuario',
      [
        name     => 'AAAAAAAAA',
        email    => 'foo2@email.com',
        password => 'foobarquux1',
        role     => 'user'
      ];

    rest_reload 'user';

    stash_test 'user.get', sub {
        my ($me) = @_;

        is( $me->{email}, 'foo2@email.com', 'email updated!' );
    };

    rest_delete stash 'user.url';

    rest_reload 'user', 404;

    # ao inves de
    # my $list = rest_get '/users';
    # use DDP; p $list;

    # utilizar

    rest_reload_list 'user';

    stash_test 'user.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{users}, 'users list exists' );

        is( @$me, 1, '1 users' );

        is( $me->[0]{email}, 'superadmin@email.com', 'listing ok' );
    };
};

done_testing;
