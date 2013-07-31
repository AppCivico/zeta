use strict;
use warnings;

use WebPI;

my $app = WebPI->apply_default_middlewares(WebPI->psgi_app);
$app;

