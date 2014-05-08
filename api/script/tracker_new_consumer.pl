use utf8;
use strict;
use warnings;

use lib './lib';
use FindBin qw($Bin);
use lib "$Bin/../lib";

use JSON::XS;
use PI::Redis;
use PI::TrackingManager;
use Log::Log4perl qw(get_logger :levels);

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

Log::Log4perl::init('log.conf');

my $coder                   = JSON::XS->new;
my $redis                   = PI::Redis->new();
my $schema                  = PI->model('DB')->schema;
my $tracking_manager        = PI::TrackingManager->new( { schema => $schema } );
my $logger 					= Log::Log4perl->get_logger("new_tracker");

&process;

sub process {
	$logger->info("Consumer initialized successfully, waiting for data.......");
	
    eval {
        while (1) {
            my ( $list, $trackers ) = $redis->redis->blpop( 'new_trackers', 0 );

            if( $trackers ) {
				my $ret = $tracking_manager->new_tracker($trackers);
				
                if ( !$ret ) {
                    $logger->error("Error adding new trackers: $trackers");
                } elsif ( $ret == 2 ) {
					$logger->warn("Tracker already exist: $trackers");
                } else {
					$logger->info("Tracker added successfully: $trackers");
                }
            }

            next;
        }
    };

    $logger->error($@) if $@;
}