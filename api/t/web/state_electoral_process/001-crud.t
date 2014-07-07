use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {
	
    #criar novo processo
		rest_post '/state_electoral_processes',
		name  => 'criar novo processo tse',
		list  => 1,
		stash => 'state_electoral_process',
		[	
			name						=> 'Processo 1',
			content 					=> 'Processo teste',
			created_by					=> 1,
			source						=> 'google.com',
			electoral_regional_court_id => 1
		];
	
		stash_test 'state_electoral_process.get', sub {
        my ($me) = @_;

		is( $me->{id},    stash 'state_electoral_process.id', 'get has the same id!' );
		is( $me->{name}, 'Processo 1', 'name ok!' );
    };

	stash_test 'state_electoral_process.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{state_electoral_processs}, 'promise list exists' );

        is( @$me, 1, '1 promise document' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

		is( $me->[0]{name}, 'Processo 1', 'listing ok' );
    };

	rest_put stash 'state_electoral_process.url',
      name => 'atualizar processo',
		[ 	
			content => 'Processo test 2',
		];

		rest_reload 'state_electoral_process';

		stash_test 'state_electoral_process.get', sub {
        my ($me) = @_;

		is( $me->{content}, 'Processo test 2', 'content updated!' );
    };

	rest_delete stash 'state_electoral_process.url';

	rest_reload 'state_electoral_process', 404;

	rest_reload_list 'state_electoral_process';

	stash_test 'state_electoral_process.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{state_electoral_processs}, 'promises list exists' );

        is( @$me, 0, '0 promise document' );
    };

};

done_testing;