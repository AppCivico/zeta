package Zeta::Schema::ResultSet::Candidate;
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
                email => {
                    required => 0,
                    type     => 'Str',
                },
                phone => {
                    required => 0,
                    type     => 'Str',
                },
                img_profile => {
                    required => 0,
                    type     => 'Str',
                },
                political_party_id => {
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

            my $candidate = $self->create( \%values );

            return $candidate;
          }

    };
}

1;

