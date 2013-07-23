package PI::TraitFor::Controller::AutoBase;

use Moose::Role;

requires 'base';

around base => sub {
    my $orig = shift;
    my $self = shift;

    my ($c) = @_;
    my $config = $self->config;

    $c->stash->{collection} = $c->model( $self->config->{result} );
    if (exists $config->{result_where}){
        $c->stash->{collection} = $c->stash->{collection}->search($config->{result_where});
    }

    $self->$orig(@_);
};

1;

