package Zeta::Schema::ResultSet::ElectoralRegionalCourt;
use namespace::autoclean;

use utf8;
use Moose;
use Zeta::Types qw /DataStr/;
extends 'DBIx::Class::ResultSet';
with 'Zeta::Role::Verification';
with 'Zeta::Role::Verification::TransactionalActions::DBIC';
with 'Zeta::Schema::Role::InflateAsHashRef';

use Data::Verifier;

sub verifiers_specs {
    my $self = shift;
    return {
        create => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
               state_id => {
                    required => 1,
                    type     => 'Int',
                },
            },
        ),
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $electoral_regional_court = $self->create( \%values );

            return $electoral_regional_court;
          }

    };
}

1;