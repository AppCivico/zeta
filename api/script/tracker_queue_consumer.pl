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

use DDP;

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

my $schema     = PI->model('DB')->schema;
my $coder      = JSON::XS->new;

my $tracking_manager    = PI::TrackingManager->new( { schema => $schema } );
my $sqs                 = PI::SqsManager->new();

&process;

sub process {
    print "Consumer initialized successfully, waiting for data.......\n";

    eval {
        my $i = 0;

        while (1) {
            my $message = $sqs->sqs->ReceiveMessage();

            if( $message ) {
                my %msg_trans = PI::TrackerMessageParser::parser($message->MessageBody);

                next unless $tracking_manager->add(%msg_trans);

                $sqs->sqs->DeleteMessage($message->ReceiptHandle);
            }

            next;
        }
    };

    print $@ if $@;
}