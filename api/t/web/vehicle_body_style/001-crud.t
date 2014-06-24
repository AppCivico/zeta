use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova carroceria de veiculo
    rest_post '/vehicle_body_styles',
      name  => 'criar carroceria de veículo',
      list  => 1,
      stash => 'vehicle_body_style',
      [ name => 'Hatch', ];

    stash_test 'vehicle_body_style.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'vehicle_body_style.id', 'get has the same id!' );
    };

    stash_test 'vehicle_body_style.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_body_styles}, 'vehicle body style list exists' );

        is( @$me, 1, '1 vehicle body style' );

        $me = [ sort { $a->{id} cmp $b->{id} } @$me ];

        is( $me->[0]{name}, 'Hatch', 'listing ok' );
    };

    rest_put stash 'vehicle_body_style.url',
      name => 'atualizar carroceria de veiculo',
      [ name => 'Conversível' ];

    rest_reload 'vehicle_body_style';

    stash_test 'vehicle_body_style.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Conversível', 'vehicle body style updated!' );
    };

    rest_delete stash 'vehicle_body_style.url';

    rest_reload 'vehicle_body_style', 404;

    rest_reload_list 'vehicle_body_style';

    stash_test 'vehicle_body_style.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{vehicle_body_styles}, 'vehicle body style list exists' );

        is( @$me, 0, '0 vehicle body style' );
    };

};

done_testing;
