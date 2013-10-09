use strict;
use warnings;
use utf8;
use JSON::XS;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Test::More;

use_ok('PI::Redis');
use_ok('PI::EmailQueue');

ok( my $redis = PI::Redis->new(), 'sucesso ao instanciar Redis Manager' );

$redis->redis->del('test');

my $mail_info = {
    email     => 'gian@aware.com.br',
    name      => 'Gian Vizzotto',
    content   => 'Email de teste',
    template  => 'vazio',
    subject   => 'Teste',
    queue_key => 'test'
};

is( PI::EmailQueue->add(%$mail_info), 1, 'registro adicionado na fila' );

my $email = decode_json( $redis->redis->lpop('test') );

is( $email->{email}, 'gian@aware.com.br', 'Registro recuperado com sucesso' );

done_testing;
