use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova categoria
    rest_post '/categories',
      name  => 'criar nova categoria',
      list  => 1,
      stash => 'category',
      [	name => 'Teste' ];

    stash_test 'category.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'category.id', 'get has the same id!' );
        is( $me->{name}, 'Teste', 'nome ok!' );
    };

    stash_test 'category.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{categories}, 'category list exists' );

        is( @$me, 1, '1 category' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{name}, 'Teste', 'listing ok' );
    };

    rest_put stash 'category.url',
      name => 'atualizar categoria',
      [
        name => 'Teste 2',
      ];

    rest_reload 'category';

    stash_test 'category.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Teste 2', 'name updated!' );
    };

    rest_delete stash 'category.url';

    rest_reload 'category', 404;

    rest_reload_list 'category';

    stash_test 'category.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{categories}, 'categorys list exists' );

        is( @$me, 0, '0 category' );
    };

};

done_testing;