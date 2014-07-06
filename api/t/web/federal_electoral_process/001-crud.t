use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {
	
	#criar novo campanha eleitoral
	rest_post '/federal_electoral_processes',
		name  => 'criar novo processo tse',
		list  => 1,
		stash => 'federal_electoral_process',
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
		
	#criar novo promessa
	rest_post '/promise_contents',
		name  => 'criar novo documento',
		list  => 1,
		stash => 'promise_content',
		[	
			name 		=> 'Documento promessa teste',
			promise_id	=> stash 'promise.id',
			source		=> 'wikepedia',
			'link' 		=> 'google.com',
			created_by	=> 1,
		];

		stash_test 'promise_content.get', sub {
        my ($me) = @_;

		is( $me->{id},    stash 'promise_content.id', 'get has the same id!' );
		is( $me->{name}, 'Documento promessa teste', 'name ok!' );
    };

	stash_test 'promise_content.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{promise_contents}, 'promise list exists' );

        is( @$me, 1, '1 promise document' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

		is( $me->[0]{name}, 'Documento promessa teste', 'listing ok' );
    };

	rest_put stash 'promise_content.url',
      name => 'atualizar promessa',
		[ 	
			name => 'Documento promessa teste 2'
		];

		rest_reload 'promise_content';

		stash_test 'promise_content.get', sub {
        my ($me) = @_;

		is( $me->{name}, 'Documento promessa teste 2', 'name updated!' );
    };

	rest_delete stash 'promise_content.url';

	rest_reload 'promise_content', 404;

	rest_reload_list 'promise_content';

	stash_test 'promise_content.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{promise_contents}, 'promises list exists' );

        is( @$me, 0, '0 promise document' );
    };

};

done_testing;