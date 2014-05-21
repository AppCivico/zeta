package PI::Schema::ResultSet::Role;
use namespace::autoclean;

use utf8;
use Moose;

extends 'DBIx::Class::ResultSet';
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::InflateAsHashRef';

use Data::Verifier;

sub verifiers_specs {
    my $self = shift;
    return {
        create => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                name => {
                    required => 1,
                    type     => 'Str',
                },
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $role = $self->create( \%values );

            return $role;
          }
    };
}

1;
