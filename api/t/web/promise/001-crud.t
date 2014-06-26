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
	
	#criar novo campanha eleitoral
	rest_post '/election_campaigns',
		name  => 'criar nova campanha eleitoral',
		list  => 1,
		stash => 'election_campaign',
		[	
			year 					=> 2014,
			state_id				=> undef,
			city_id					=> undef,
			country_id				=> 1,
			political_position_id 	=> 1,
		];

    #criar novo promessa
    rest_post '/promises',
		name  => 'criar nova promessa',
		list  => 1,
		stash => 'promise',
		[	
			name 					=> 'Promessa teste',
			description				=> 'Teste',
			election_campaign_id 	=>  stash 'election_campaign.id',
			category_id 			=>  stash 'category.id',
			candidate_id 			=>  stash 'candidate.id',
			created_by				=> 1,
			source					=> 'google.com',
		];

    stash_test 'promise.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'promise.id', 'get has the same id!' );
		is( $me->{name}, 'Promessa teste', 'name ok!' );
    };

    stash_test 'promise.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{promises}, 'promise list exists' );

        is( @$me, 1, '1 promise' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

		is( $me->[0]{name}, 'Promessa teste', 'listing ok' );
    };

    rest_put stash 'promise.url',
      name => 'atualizar promessa',
		[ 	
			name => 'Promessa teste 2'
		];

    rest_reload 'promise';

    stash_test 'promise.get', sub {
        my ($me) = @_;

		is( $me->{name}, 'Promessa teste 2', 'name updated!' );
    };

    rest_delete stash 'promise.url';

    rest_reload 'promise', 404;

    rest_reload_list 'promise';

    stash_test 'promise.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{promises}, 'promises list exists' );

        is( @$me, 0, '0 promise' );
    };

};

done_testing;