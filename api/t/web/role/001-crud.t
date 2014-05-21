use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use PI::Test::Further;

api_auth_as user_id => 2, roles => ['webapi'];

db_transaction {

    my $list = rest_get '/roles';

	cmp_ok( @{ $list->{roles} }, '>=', 1, 'Listing ok' );
};

done_testing;
