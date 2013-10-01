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

my $config          = PI->config;
my $redis_conf      = exists $config->{redis} ? $config->{redis} : { host => 'localhost:6379', queue_key => 'error' };
my $redis           = PI::EmailQueue->new( %{ $redis_conf } );
my $transport_class = 'Email::Sender::Transport::' . $config->{email}{transport}{class};

eval("use $transport_class");
die $@ if $@;

&send_emails;

sub  send_emails {

    print "Aguardando itens na fila \n";
    my $transport = $transport_class->new( %{ $config->{email}{transport}{opts} } );

    while ( 1 ) {
        my ($list, $iten) = $redis->redis->blpop('error', 0);

        eval {
            $iten = decode_json($iten);

            my $email = Email::Simple->create(
                    header => [
                        To      =>  $config->{email}{error_recipient},
                        From    => 'gian@aware.com.br',
                        Subject => 'Erro ao enviar email',
                        Charset => 'UTF-8'
                    ],
                    body => "Destinatário: $iten->{recipients}\nMensagem: $iten->{message}",
                );

            sendmail($email, { transport => $transport });
        };

        if ( $@ ) {
            &error_queue( $@, $iten->{email} )
        } else {
            print "Email de erro enviado a $config->{email}{error_recipient}\n";
        }
    }
}