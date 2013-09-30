#!/usr/bind/perl

use strict;
use warnings;
use Net::Stomp;

my $host = '184.106.196.147';
my $port = 61613;
my $user_id = "pi";
my $pass = "Inte11Ad";
my $queue_name = "/queue/DEVREP.PIPE.PI";

my $stomp = Net::Stomp->new( { hostname => $host, port => $port } );

eval {$stomp->connect( { login => $user_id, passcode => $pass } );};

die $@ if $@;

$stomp->subscribe({
    destination             => $queue_name,
    'ack'                   => 'client',
    'activemq.prefetchSize' => 1
});

# while (1) {
    my $frame = $stomp->receive_frame;
    warn $frame->body;
    use DDP; p $frame;
    $stomp->ack( { frame => $frame } );

# }

$stomp->disconnect;

