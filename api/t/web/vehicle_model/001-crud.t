use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    rest_post '/vehicle_brands',
      name  => 'criar marca de veículo',
      list  => 1,
      stash => 'vehicle_brand',
      [ name => 'renault', ];

    #criar novo modelo de veiculo
    rest_post '/vehicle_models',
      name  => 'criar modelo de veículo',
      list  => 1,
      stash => 'vehicle_model',
      [
        name             => 'Clio',
        vehicle_brand_id => stash 'vehicle_brand.id'
      ];

    stash_test 'vehicle_model.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_model.id', 'get has the same id!' );
    };

    stash_test 'vehicle_model.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_models}, 'vehicle model list exists' );

        is( @$me, 1, '1 vehicle model' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{name}, 'Clio', 'listing ok' );
    };

    rest_put stash 'vehicle_model.url',
      name => 'atualizar modelo de veiculo',
      [ name => 'Megane' ];

    rest_reload 'vehicle_model';

    stash_test 'vehicle_model.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Megane', 'vehicle model updated!' );
    };

    rest_delete stash 'vehicle_model.url';

    rest_reload 'vehicle_model', 404;

    rest_reload_list 'vehicle_model';

    stash_test 'vehicle_model.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_models}, 'vehicle model list exists' );

        is( @$me, 0, '0 vehicle model' );
    };

};

done_testing;
