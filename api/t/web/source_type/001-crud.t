use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova categoria
    rest_post '/source_types',
      name  => 'criar nova categoria',
      list  => 1,
      stash => 'source_type',
      [ name => 'Teste' ];

    stash_test 'source_type.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'source_type.id', 'get has the same id!' );
        is( $me->{name}, 'Teste', 'nome ok!' );
    };

    stash_test 'source_type.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{source_types}, 'source_type list exists' );

        is( @$me, 1, '1 source_type' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{name}, 'Teste', 'listing ok' );
    };

    rest_put stash 'source_type.url',
		name => 'atualizar categoria',
		[ name => 'Teste 2' ];

    rest_reload 'source_type';

    stash_test 'source_type.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Teste 2', 'name updated!' );
    };

    rest_delete stash 'source_type.url';

    rest_reload 'source_type', 404;

    rest_reload_list 'source_type';

    stash_test 'source_type.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{source_types}, 'source_types list exists' );

        is( @$me, 0, '0 source_type' );
    };

};

done_testing;