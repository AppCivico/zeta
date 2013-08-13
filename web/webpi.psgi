use strict;
use warnings;

use lib 'lib';
use WebPI;


my $app = WebPI->apply_default_middlewares(WebPI->psgi_app);
$app;

