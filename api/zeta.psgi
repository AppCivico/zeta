use strict;
use warnings;
use lib 'lib';
use Zeta;

my $app = Zeta->apply_default_middlewares(Zeta->psgi_app);
$app;

