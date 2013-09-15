package WebPI::View::TT;
use Moose;
use namespace::autoclean;
use utf8;

extends 'Catalyst::View::TT';

use Template::AutoFilter;

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER            => 'wrapper.tt',
    render_die         => 1,

    CLASS    => 'Template::AutoFilter',
    ENCODING => 'UTF8',

    PRE_PROCESS => 'macros.tt',

    INCLUDE_PATH => [ WebPI->path_to( 'root', 'src' ) ],
    TIMER        => 0,
    render_die   => 1,
);

sub days_of_week_human {
    my ($self, $c, $dow) = @_;

    my $str = join '', sort @$dow;

    return 'Dias úteis' if $str == '23456';

    return 'Fins de semana' if $str == '17';

    my $week = {
        1 => 'Domingo',
        2 =>  'Segunda-feira',
        3 =>  'Terça-feira',
        4 =>  'Quarta-feira',
        5 =>  'Quinta-feira',
        6 =>  'Sexta-feira',
        7 =>  'Sábado',
    };

    my $x =  join ', ', map { $week->{$_} } sort @$dow;

    $x =~ s/^(.+)\,\s(.+)$/$1 e $2/;

    return "$x";
}

sub hour_human {
    my ($self, $c, $time) = @_;

    my $h = substr($time,0, 5);
    $h =~ s/:/h/;

    return $h;
}

=head1 NAME

WebPI::View::TT - TT View for WebPI

=head1 DESCRIPTION

TT View for WebPI.

=head1 SEE ALSO

L<WebPI>

=head1 AUTHOR

renato,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
