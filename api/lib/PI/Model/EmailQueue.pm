package PI::Model::EmailQueue;

use base 'Catalyst::Model';
use PI::EmailQueue;
use Moose;

our $AUTOLOAD;

has 'emailinstance' => (
  is => 'rw',
  isa => 'PI::EmailQueue',
);

sub initialize_after_setup {
    my ( $self, $app ) = @_;

    $self->emailinstance(
        PI::EmailQueue->new(
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