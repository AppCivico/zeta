package PI::TraitFor::Controller::Search;

use Moose::Role;

around list_GET => sub {
    my $orig = shift;
    my $self = shift;

    $self->$orig(@_);
};

1;

