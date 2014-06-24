use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova companhia de seguros
    rest_post '/insurance_companies',
      name  => 'criar cia de seguoros',
      list  => 1,
      stash => 'insurance_company',
      [
        name => 'Cia de Seguros Teste',
      ];

    stash_test 'insurance_company.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'insurance_company.id', 'get has the same id!' );
        is( $me->{name}, 'Cia de Seguros Teste', 'name ok!' );
    };

    stash_test 'insurance_company.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{insurance_company}, 'insurance_company list exists' );

        is( @$me, 1, '1 insurance_company' );

        is( $me->[0]{name}, 'Cia de Seguros Teste', 'listing ok' );
    };

    rest_put stash 'insurance_company.url',
      name => 'atualizar cia de seguros',
      [
        name => 'Cia de Seguros Teste 2'
      ];

    rest_reload 'insurance_company';

    stash_test 'insurance_company.get', sub {
        my ($me) = @_;

        is( $me->{name}, 'Cia de Seguros Teste 2', 'name updated!' );
    };

    rest_delete stash 'insurance_company.url';

    rest_reload 'insurance_company', 404;

    rest_reload_list 'insurance_company';

    stash_test 'insurance_company.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{insurance_company}, 'insurance_companies list exists' );

        is( @$me, 0, '0 insurance_company' );
    };

};

done_testing;