use lib './lib';
use utf8;
use strict;
use PI::Schema;
use PI::EmailQueue;
use Email::Sender::Simple qw(sendmail);
use JSON::XS;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use Catalyst::Test q(PI);
use DDP;

my $config          = PI->config;
my $redis_conf      = exists $config->{redis} ? $config->{redis} : { host => 'localhost:6379', queue_key => 'email' };
my $redis           = PI::EmailQueue->new( %{ $redis_conf } );
my $transport_class = 'Email::Sender::Transport::' . $config->{email}{transport}{class};

eval("use $transport_class");
die $@ if $@;

&send_emails;

sub  send_emails {
    my $transport = $transport_class->new( %{ $config->{email}{transport}{opts} } );

    while ( 1 ) {
        my ($list, $iten) = $redis->redis->blpop('email',0);

        eval {
            $iten = decode_json($iten);

            my $email = Email::Simple->create(
                    header => [
                        To      => $iten->{email},
                        From    => 'gian@aware.com.br',
                        Subject => $iten->{subject},
                        Charset => 'UTF-8'
                    ],
                    body => $iten->{content},
                );

            sendmail($email, { transport => $transport });
        };

        &error_queue( $@, $iten->{email} ) if $@;
    }
}

sub error_queue {
    my ( @params ) = @_;

    my $error = {
      'message' => $params[0]->message ? $params[0]->message : undef,
      'recipients' => $params[1] ? $params[1] : undef
    };

    $redis->queue_key ('error');
    $redis->add_error(encode_json($error));
    $redis->queue_key ('email');

    return 1;
}