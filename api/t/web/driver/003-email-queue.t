use strict;
use warnings;
use utf8;
use JSON::XS;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Test::More;

use_ok('PI::EmailQueue');

ok(my $mail =  PI::EmailQueue->new( queue_key => 'test', host => 'localhost:6379'), 'sucesso ao instanciar');


$mail->redis->del('test');

my $mail_info = {
  email     => 'gian@aware.com.br',
  name      => 'Gian Vizzotto',
  content   => 'Email de teste',
  template  => 'vazio',
  subject   => 'Teste',
};

is($mail->add(%$mail_info), 1, 'registro adicionado na fila');

my $email = decode_json($mail->redis->lpop('test'));

is($email->{email}, 'gian@aware.com.br', 'Registro recuperado com sucesso');

done_testing;