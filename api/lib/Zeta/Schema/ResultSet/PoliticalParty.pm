package Zeta::Schema::ResultSet::PoliticalParty;
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
                name => {
                    required => 1,
                    type     => 'Str',
                },
                acronym => {
                    required => 1,
                    type     => 'Str',
                },
                status => {
                    required => 1,
                    type     => 'Int',
                },
                party_number => {
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

            my $political_party = $self->create( \%values );

            return $political_party;
        }

    };
}

1;