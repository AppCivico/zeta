use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {
	
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

    #criar novo endereço
    rest_post '/coalitions',
		name  => 'criar nova coligação',
		list  => 1,
		stash => 'coalition',
		[	
			name 					=> 'Teste',
			creation_date 			=> '2014-06-25',
			election_campaign_id 	=>  stash 'election_campaign.id',
		];

    stash_test 'coalition.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'coalition.id', 'get has the same id!' );
        is( $me->{name}, 'Teste', 'name ok!' );
    };

    stash_test 'coalition.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{coalitions}, 'coalition list exists' );

        is( @$me, 1, '1 coalition' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{name}, 'Teste', 'listing ok' );
    };

    rest_put stash 'coalition.url',
      name => 'atualizar campanha eleitoral',
		[ 	
			name => 'Teste 2'
		];

    rest_reload 'coalition';

    stash_test 'coalition.get', sub {
        my ($me) = @_;

		is( $me->{name}, 'Teste 2', 'name updated!' );
    };

    rest_delete stash 'coalition.url';

    rest_reload 'coalition', 404;

    rest_reload_list 'coalition';

    stash_test 'coalition.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{coalitions}, 'coalitions list exists' );

        is( @$me, 0, '0 coalition' );
    };

};

done_testing;