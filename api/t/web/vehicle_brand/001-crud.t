use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova marca de veiculo
    rest_post '/vehicle_brands',
      name  => 'criar marca de veículo',
      list  => 1,
      stash => 'vehicle_brand',
      [ name => 'renault', ];

    stash_test 'vehicle_brand.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_brand.id', 'get has the same id!' );
    };

    stash_test 'vehicle_brand.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_brands}, 'vehicle brand list exists' );

        is( @$me, 1, '1 vehicle brand' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{name}, 'renault', 'listing ok' );
    };

    rest_put stash 'vehicle_brand.url',
      name => 'atualizar marca de veiculo',
      [ name => 'Volkswagen' ];

    rest_reload 'vehicle_brand';

    stash_test 'vehicle_brand.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Volkswagen', 'vehicle brand updated!' );
    };

    rest_delete stash 'vehicle_brand.url';

    rest_reload 'vehicle_brand', 404;

    rest_reload_list 'vehicle_brand';

    stash_test 'vehicle_brand.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_brands}, 'vehicle brand list exists' );

        is( @$me, 0, '0 vehicle brand' );
    };

};

done_testing;
