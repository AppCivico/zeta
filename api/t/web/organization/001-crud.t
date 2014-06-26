use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo endereço
    rest_post '/organizations',
      name  => 'criar nova organização',
      list  => 1,
      stash => 'organization',
      [	
		name 		=> 'Org Teste', 
		address		=> 'Adr Teste',
		postal_code	=> 'Porstal Teste',
		city_id		=> '1',
		description	=> 'Org Teste desc',
	];

    stash_test 'organization.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'organization.id', 'get has the same id!' );
        is( $me->{name}, 'Org Teste', 'nome ok!' );
    };

    stash_test 'organization.list', sub {
        my ($me) = @_;

		ok( $me = delete $me->{organizations}, 'organization list exists' );

        is( @$me, 1, '1 organization' );

        $me = [ sort { $a->{id} <=> $b->{id} } @$me ];

        is( $me->[0]{name}, 'Org Teste', 'listing ok' );
    };

    rest_put stash 'organization.url',
      name => 'atualizar organização',
      [
        name => 'Org Teste 2',
      ];

    rest_reload 'organization';

    stash_test 'organization.get', sub {
        my ($me) = @_;

		is( $me->{name}, 'Org Teste 2', 'name updated!' );
    };

    rest_delete stash 'organization.url';

    rest_reload 'organization', 404;

    rest_reload_list 'organization';

    stash_test 'organization.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{organizations}, 'organizations list exists' );

        is( @$me, 0, '0 organization' );
    };

};

done_testing;