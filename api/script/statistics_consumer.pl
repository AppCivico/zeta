use strict;
use warnings;
use utf8;
use lib './lib';
use FindBin qw($Bin);
use lib "$Bin/../lib";
use Furl;
use JSON::XS;
use PI::TrackingManager;
use PI::Redis;

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

my $schema              = PI->model('DB')->schema;
my $coder               = JSON::XS->new;
my $tracking_manager    = PI::TrackingManager->new( { schema => $schema } );
my $redis               = PI::Redis->new();

&process;

sub process {
    my @itens;

    print "Consumer initialized successfully, waiting for data.......\n";

    eval {
        while (1) {
            my ($list, $iten) = $redis->redis->blpop('vehicle_statistics',0);

            push(@itens, $iten);

            if (!$iten) {
                $tracking_manager
            }
        }

    };

    use DDP; p $@ if $@;

}