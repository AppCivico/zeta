package PI::Role::Verification;
use namespace::autoclean;
use Moose::Role;

use PI::Data::Manager;
use Data::Diver qw(Dive);

has verifiers => (
    is         => 'ro',
    isa        => 'HashRef',
    lazy_build => 1,
    builder    => 'verifiers_specs'
);

has actions => (
    is         => 'ro',
    isa        => 'HashRef',
    lazy_build => 1,
    builder    => 'action_specs'
);

has verifier_scope_name => ( is => 'ro', lazy_build => 1, isa => 'Str' );

requires 'verifiers_specs';
requires 'action_specs';
requires '_build_verifier_scope_name';

use Data::Printer;

sub check {
    my ( $self, %args ) = @_;

    my $path     = delete $args{for};
    my $input    = delete $args{with};
    my $verifier = Dive( $self->verifiers, split( /\./, $path ) );
    my $action   = Dive( $self->actions, split( /\./, $path ) );

    return PI::Data::Manager->new(
        input     => $input,
        verifiers => { $path => $verifier },
        actions   => { $path => $action }
    );
}

1;
