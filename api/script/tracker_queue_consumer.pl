use utf8;
use strict;
use warnings;

use lib './lib';
use FindBin qw($Bin);
use lib "$Bin/../lib";

use Furl;
use JSON::XS;
use PI::SqsManager;
use PI::TrackingManager;
use PI::TrackerMessageParser;
use Log::Log4perl qw(get_logger :levels);

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

Log::Log4perl::init('log.conf');

my $schema     = PI->model('DB')->schema;
my $coder      = JSON::XS->new;

my $tracking_manager    = PI::TrackingManager->new( { schema => $schema } );
my $sqs                 = PI::SqsManager->new();
my $logger 				= Log::Log4perl->get_logger("tracker_queue");

&process;

sub process {
    $logger->info("Consumer initialized successfully, waiting for data.......");

    eval {
        my $i = 0;

        while (1) {
            my $message = $sqs->sqs->ReceiveMessage();

            if( $message ) {
                my %msg_trans = PI::TrackerMessageParser::parser($message->MessageBody);

                if( !$tracking_manager->add(%msg_trans) ) {
                    $logger->error("Error saving data. Message: $message->MessageBody");
                }

                $sqs->sqs->DeleteMessage($message->ReceiptHandle);
            }
            
            next;
        }
    };

    $logger->error($@) if $@;
}