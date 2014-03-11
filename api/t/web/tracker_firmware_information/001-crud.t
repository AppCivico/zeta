use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar nova versão de firmware
    rest_post '/tracker_firmware_informations',
      name  => 'criar informações de firmware',
      list  => 1,
      stash => 'firmware',
      [
        version         => 1.0,
        status          =>  1,
        private_path    => '/teste',
        public_path     => '/teste',
        version_hash    => 'teste'
      ];

    stash_test 'firmware.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'firmware.id', 'get has the same id!' );
    };

    stash_test 'firmware.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{tracker_firmware_informations}, 'information list exists' );

        is( $me->[0]{id}, stash 'firmware.id', 'listing ok' );
    };

    rest_put stash 'firmware.url',
      name => 'atualizar infos',
      [
        version         => 1.1,
        status          =>  1,
        private_path    => '/teste',
        public_path     => '/teste',
        version_hash    => 'teste'
      ];

    rest_reload 'firmware';

    stash_test 'firmware.get', sub {
        my ($me) = @_;

        is( $me->{id}, stash 'firmware.id', 'get has the same id!' );
        is( $me->{version}, 1.1, 'version updated!' );
    };

    rest_delete stash 'firmware.url';

    rest_reload 'firmware', 404;

    rest_reload_list 'firmware';

    stash_test 'firmware.list', sub {
        my ($me) = @_;
        ok( $me = delete $me->{tracker_firmware_informations}, 'information list exists' );

        is( @$me, 0, '0 information' );
    };
};

done_testing;