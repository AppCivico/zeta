use strict;
use warnings;

use lib 'lib';
use WebZeta;


my $app = WebZeta->apply_default_middlewares(WebZeta->psgi_app);
$app;

