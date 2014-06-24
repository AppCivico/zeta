use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Zeta::Test::Further;

api_auth_as user_id => 2, roles => ['webapi'];

db_transaction {

    my $list = rest_get '/cities';

    is( @{ $list->{cities} }, 1, '1 cidade' );

};
done_testing;
