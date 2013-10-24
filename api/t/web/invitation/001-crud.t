use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {

    #criar novo endereço
    rest_post '/addresses',
      name  => 'criar novo endereço',
      list  => 1,
      stash => 'address',
      [
        address      => 'Av. Paulista',
        number       => '568',
        neighborhood => 'Bela Vista',
        user_id      => 1,
        postal_code  => '01310000',
        city_id     => 1
      ];

    rest_post '/customers',
      name  => 'criar cliente',
      list  => 1,
      stash => 'customer',
      [
        fancy_name             => 'Foo Bar',
        corporate_name         => 'Foo Bar LTDA.',
        email                  => 'foo@bar.com.br',
        cnpj                   => '021.925.0001/25',
        state_registration     => '123acbd1',
        municipal_registration => 'muni12121',
        phone                  => '551111111111',
        mobile_phone           => '5511111111111',
        secondary_phone        => '5511111111144',
        address_id             => stash 'address.id',
        password               => 'teste',
        password_confirm       => 'teste',
        user_id                => 1
      ];

    rest_post '/campaigns',
    name  => 'criar campanha',
    list  => 1,
    stash => 'campaign',
      [
        name            => 'Campanha para teste',
        valid_from      => '2013-10-16 00:00:00',
        valid_to        => '2013-10-16 23:59:59',
        customer_id     => stash 'customer.id',
        status          => 1,
        activated_at    => '2013-10-16 18:30:30',
      ];

    rest_post '/invitations',
    name  => 'criar convite',
    list  => 1,
    stash => 'invitation',
      [
        title           => 'Convite teste',
        content         => 'Testando a criacao de convite',
        campaign_id     => stash 'campaign.id',
      ];

    stash_test 'invitation.get', sub {
        my ($me) = @_;

        is( $me->{id},    stash 'invitation.id', 'get has the same id!' );
        is( $me->{title}, 'Convite teste', 'title ok!' );
    };

    stash_test 'invitation.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{invitations}, 'invitation list exists' );

        is( @$me, 1, '1 invitation' );

        is( $me->[0]{content}, 'Testando a criacao de convite', 'listing ok' );
    };

    rest_put stash 'invitation.url',
      name => 'atualizar convite',
      [
        title           => 'Convite teste2',
        content         => 'Testando a criacao de convite2'
      ];

    rest_reload 'invitation';

    stash_test 'invitation.get', sub {
        my ($me) = @_;

        is( $me->{title}, 'Convite teste2', 'invitation updated ok' );
    };

    rest_delete stash 'invitation.url';

    rest_reload 'invitation', 404;

    rest_reload_list 'invitation';

    stash_test 'invitation.list', sub {
        my ($me) = @_;

        ok( $me = delete $me->{invitations}, 'invitations list exists' );

        is( @$me, 0, '0 invitation' );
    };

};

done_testing;