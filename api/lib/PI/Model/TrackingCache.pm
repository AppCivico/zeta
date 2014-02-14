package PI::Model::TrackingCache;

use base 'Catalyst::Model';
use PI::TrackingManager::Cache;
use Moose;

our $AUTOLOAD;

has 'cacheinstance' => (
    is  => 'rw',
    isa => 'PI::TrackingManager::Cache',
);

sub initialize_after_setup {
    my ( $self, $app ) = @_;

    $self->cacheinstance(
        PI::TrackingManager::Cache->new()
    );
}

sub AUTOLOAD {
    my $self = shift;
    my $name = $AUTOLOAD;
    $name =~ s/.*://;
    $self->cacheinstance->$name(@_);
}

1;
