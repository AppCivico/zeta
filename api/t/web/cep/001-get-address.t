use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 1, roles => ['superadmin'];

db_transaction {
    my $addr = rest_get '/cep', 200,
    {
        postal_code => '01310000'
    };

    is( $addr->{state_id}, 1, 'Address is valid!' );

    my $addr = rest_get '/cep', 200,
    {
        postal_code => '00000000'
    };

    use DDP; p $addr;
#     is( $addr->{state_id}, 1, 'Address is valid!' );
};

done_testing;
