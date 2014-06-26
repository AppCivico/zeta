use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo partido politico
    rest_post '/political_parties',
      name  => 'criar novo partido politico',
      list  => 1,
      stash => 'political_party',
		[	
			name 			=> 'Partido teste', 
			acronym			=> 'PTW',
			status			=> 1,
			party_number	=> 666,
		];

    stash_test 'political_party.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'political_party.id', 'get has the same id!' );
        is( $me->{name}, 'Partido teste', 'nome ok!' );
    };

    stash_test 'political_party.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{political_parties}, 'political_party list exists' );

        is( @$me, 1, '1 political_party' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{name}, 'Partido teste', 'listing ok' );
    };

    rest_put stash 'political_party.url',
      name => 'atualizar organização',
      [
		name => 'Partido teste 2', 
      ];

    rest_reload 'political_party';

    stash_test 'political_party.get', sub {
        my ($me) = @_;

		is( $me->{name}, 'Partido teste 2', 'name updated!' );
    };

    rest_delete stash 'political_party.url';

    rest_reload 'political_party', 404;

    rest_reload_list 'political_party';

    stash_test 'political_party.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{political_parties}, 'political_parties list exists' );

        is( @$me, 0, '0 political_party' );
    };

};

done_testing;