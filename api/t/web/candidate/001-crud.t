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

		#criar novo candidato
	rest_post '/candidates',
		name  => 'criar novo candidato',
		list  => 1,
		stash => 'candidate',
		[	
			name 				=> 'Joao', 
			email				=> 'joao@foo.bar',
			political_party_id 	=>  stash 'political_party.id'
		];

    stash_test 'candidate.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'candidate.id', 'get has the same id!' );
		is( $me->{name}, 'Joao', 'nome ok!' );
    };

    stash_test 'candidate.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{candidates}, 'candidate list exists' );

        is( @$me, 1, '1 candidate' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

		is( $me->[0]{name}, 'Joao', 'listing ok' );
    };

    rest_put stash 'candidate.url',
      name => 'atualizar organização',
      [
		name => 'Joao Roberto', 
      ];

    rest_reload 'candidate';

    stash_test 'candidate.get', sub {
        my ($me) = @_;

		is( $me->{name}, 'Joao Roberto', 'name updated!' );
    };

    rest_delete stash 'candidate.url';

    rest_reload 'candidate', 404;

    rest_reload_list 'candidate';

    stash_test 'candidate.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{candidates}, 'candidates list exists' );

        is( @$me, 0, '0 candidate' );
    };

};

done_testing;