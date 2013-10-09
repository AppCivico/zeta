package PI::Data::Renavam;
use namespace::autoclean;

sub new {
    my ($renavam) = @_;
    use DDP;

    die if $renavam !~ /[\d]/;

    my $soma = 0;

    for ( my $i = 0 ; $i < length $renavam - 1 ; $i++ ) {
        $soma += substr( $renavam, $i, $i + 1 ) * ( $i + 2 );
        p $soma;
    }
    p $soma;
    $soma = $soma % 11;
    my $ultimo_digito = $soma >= 10 ? 0 : $soma;
    my $digito_informado = substr( $renavam, length $renavam - 1, length $renavam );

    if ( $ultimo_digito == $digito_informado ) {
        return 1;
    }

    p $renavam;
    p $soma;
    p $ultimo_digito;
    p $digito_informado;
    exit;
    die;
}

1;
