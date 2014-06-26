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

    stash_test 'election_campaign.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'election_campaign.id', 'get has the same id!' );
        is( $me->{year}, 2014, 'ano ok!' );
    };

    stash_test 'election_campaign.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{election_campaigns}, 'election_campaign list exists' );

        is( @$me, 1, '1 election_campaign' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{year}, 2014, 'listing ok' );
    };

    rest_put stash 'election_campaign.url',
      name => 'atualizar campanha eleitoral',
      [ 	year => 2016  ];

    rest_reload 'election_campaign';

    stash_test 'election_campaign.get', sub {
        my ($me) = @_;

		is( $me->{year}, 2016, 'year updated!' );
    };

    rest_delete stash 'election_campaign.url';

    rest_reload 'election_campaign', 404;

    rest_reload_list 'election_campaign';

    stash_test 'election_campaign.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{election_campaigns}, 'election_campaigns list exists' );

        is( @$me, 0, '0 election_campaign' );
    };

};

done_testing;