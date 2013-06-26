use strict;
use warnings;
use lib 'lib';
use PI;

my $app = PI->apply_default_middlewares(PI->psgi_app);
$app;

