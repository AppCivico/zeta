package PI::Data::Manager;
use namespace::autoclean;
use Moose;

extends 'Data::Manager';

use PI::Data::Visitor;

has _input => ( is => 'ro', isa => 'HashRef', init_arg => 'input' );

has actions => (
    is      => 'ro',
    isa     => 'HashRef',
    default => sub { +{} },
);

sub apply {
    my ($self) = @_;
    foreach my $scope ( keys %{ $self->verifiers } ) {
        my $results = $self->verify( $scope, $self->_input );
        if ( $results->success ) {
            my $ref = $self->actions->{$scope};

            return $ref ? $ref->($results) : 1;
        }
    }
    return;
}

sub errors {
    my $self = shift;
    my %errors;
    for my $msg ( @{ $self->messages->messages || [] } ) {
        $errors{ $msg->subject } = 'invalid'
          if $msg->msgid =~ /invalid/g;
        $errors{ $msg->subject } = 'missing'
          if $msg->msgid =~ /missing/g;
    }
    return unless scalar keys %errors;
    return \%errors;
}

around success => sub {
    my $orig = shift;
    my $self = shift;
    return !!( $self->$orig(@_) && scalar keys %{ $self->results } );
};

1;
