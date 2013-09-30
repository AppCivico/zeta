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

    my $conf = exists $app->config->{redis} ? $app->config->{redis} : {
        host => 'localhost:6379',
    };
    $self->emailinstance(
        PI::EmailQueue->new(
            schema => $app->model('DB')->schema,
            %$conf
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