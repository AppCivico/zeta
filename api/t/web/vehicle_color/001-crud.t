use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova cor de veiculo
    rest_post '/vehicle_colors',
      name  => 'criar cor de veículo',
      list  => 1,
      stash => 'vehicle_color',
      [ name => 'Preto', ];

    stash_test 'vehicle_color.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_color.id', 'get has the same id!' );
    };

    stash_test 'vehicle_color.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_colors}, 'vehicle model list exists' );

        is( @$me, 1, '1 vehicle model' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{name}, 'Preto', 'listing ok' );
    };

    rest_put stash 'vehicle_color.url',
      name => 'atualizar cor de veiculo',
      [ name => 'Prata' ];

    rest_reload 'vehicle_color';

    stash_test 'vehicle_color.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Prata', 'vehicle color updated!' );
    };

    rest_delete stash 'vehicle_color.url';

    rest_reload 'vehicle_color', 404;

    rest_reload_list 'vehicle_color';

    stash_test 'vehicle_color.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_colors}, 'vehicle model list exists' );

        is( @$me, 0, '0 vehicle color' );
    };

};

done_testing;
