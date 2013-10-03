use lib './lib';
use utf8;
use strict;
use PI::Schema;
use PI::EmailQueue;
use PI::Redis;
use Email::Sender::Simple qw(sendmail);
use JSON::XS;

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use Catalyst::Test q(PI);

my $config          = PI->config;
my $redis           = PI::Redis->new();
my $transport_class = 'Email::Sender::Transport::' . $config->{email}{transport}{class};

eval("use $transport_class");
die $@ if $@;

&send_emails;

sub  send_emails {
    print "Aguardando itens na fila \n";
    my $transport = $transport_class->new( %{ $config->{email}{transport}{opts} } );

    while ( 1 ) {
        my ($list, $iten) = $redis->redis->blpop('email',0);

        $iten = decode_json($iten);
        eval {

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

        if ( $@ ) {
            &error_queue( $@, $iten->{email} )
        } else {
            print "Email enviado a $iten->{email}\n";
        }

    }
}

sub error_queue {
    my ( @params ) = @_;

    my $error = {
      'message'     => $params[0]->message ? $params[0]->message : undef,
      'recipients'  => $params[1] ? $params[1] : undef
    };

    PI::EmailQueue->add_error( encode_json($error) );

    return 1;
}