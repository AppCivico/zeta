use lib './lib';
use utf8;
use strict;
use PI::Schema;
# use PI::EmailQueue;
use Furl;
use MIME::Lite;
use PI::Redis;
use Email::Sender::Simple qw(sendmail);
use Email::Sender::Transport::SMTP::TLS;
use JSON::XS;
use Template;
use Encode;

package PI;
use Catalyst qw( ConfigLoader  );

__PACKAGE__->setup();

package main;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use Catalyst::Test q(PI);
use FindBin;
use  File::Slurp qw/read_file/;

my $config          = PI->config;
my $redis           = PI::Redis->new();
my $transport_class = 'Email::Sender::Transport::' . $config->{email}{transport}{class};
my $logo            =  scalar read_file("$FindBin::Bin/../../web/root/static/img/logo.png");

eval("use $transport_class");
die $@ if $@;

&send_emails;

sub send_emails {
    my ( $self ) = @_;
    print "Aguardando itens na fila \n";

    my $template = Template->new(
        INCLUDE_PATH => "$FindBin::Bin/../../web/root/src/email",
        INTERPOLATE  => 1,
        POST_CHOMP   => 1,
        EVAL_PERL    => 1,
        ENCODING     => 'utf-8'
    );

    while (1) {
        my ( $list, $iten ) = $redis->redis->blpop( 'email', 0 );

        my $from    = 'no-reply@publicidadeinteligente.com.br';
        $iten       = decode_json($iten);

        eval {
            my $str_template = '';
            my $vars = {
                content => $iten->{content},
                domain  => $config->{domain}{default},

            };

            eval { $template->process( $iten->{template}, $vars, \$str_template ) || die $template->error(); };
            use DDP;
            p $@ if $@;

            my $email = MIME::Lite->new(
                To      =>  $iten->{email},
                From    => 'no-reply@publicidadeinteligente.com.br',
                Subject =>  Encode::encode('MIME-Header', $iten->{subject}),
                Type    => q{multipart/related},
            );

            $email->attach(
                Type => 'text/html; charset=UTF-8',
                Data => $str_template,
            );

             $email->attach(
                Type     => 'image/png',
                Id       => 'logo.png',
                Encoding => 'base64',
                Data     => $logo
            );

            sendmail( $email->as_string, { from => $from, transport => &_build_transport } );
        };

        if ($@) {
            &error_queue( $@, $iten->{email} );
        }
        else {
            print "Email enviado a $iten->{email}\n";
        }

    }
}

sub error_queue {
    my (@params) = @_;

    my $error = {
        'message'    => $params[0] ? $params[0] : undef,
        'recipients' => $params[1] ? $params[1] : undef
    };

    PI::EmailQueue->add_error( encode_json($error) );

    return 1;
}

sub _build_transport {

    my $transport = $config->{email}{transport}{opts};
    my $username  = $transport->{username};
    my $password  = $transport->{password};
    my $host      = $transport->{host};

    return Email::Sender::Transport::SMTP::TLS->new(
        helo     => "pi.com.br",
        host     => $host,
        timeout  => 20,
        port     => 587,
        username => $username,
        password => $password
    );

}