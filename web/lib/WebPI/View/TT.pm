package WebPI::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

use Template::AutoFilter;


__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER            => 'wrapper.tt',
    render_die => 1,

    CLASS => 'Template::AutoFilter',
    ENCODING => 'UTF8',

    PRE_PROCESS => 'macros.tt',

    INCLUDE_PATH => [ WebPI->path_to( 'root', 'src' ) ],
    TIMER        => 0,
    render_die   => 1,
);


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
