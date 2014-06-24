package Zeta::Model::EmailQueue;

use base 'Catalyst::Model';
use Zeta::EmailQueue;
use Moose;

our $AUTOLOAD;

has 'emailinstance' => (
    is  => 'rw',
    isa => 'Zeta::EmailQueue',
);

sub initialize_after_setup {
    my ( $self, $app ) = @_;

    $self->emailinstance(
        Zeta::EmailQueue->new(
            schema => $app->model('DB')->schema
        )
    );
}

sub AUTOLOAD {
    my $self = shift;
    my $name = $AUTOLOAD;
    $name =~ s/.*://;
    $self->emailinstance->$name(@_);
}

1;
