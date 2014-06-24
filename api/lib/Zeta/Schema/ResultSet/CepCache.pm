package Zeta::Schema::ResultSet::CepCache;
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
                address => {
                    required => 1,
                    type     => 'Str'
                },
                postal_code => {
                    required => 1,
                    type     => 'Str'
                },
                neighborhood => {
                    required => 1,
                    type     => 'Str'
                },
                city_id => {
                    required => 1,
                    type     => 'Str'
                },
                state_id => {
                    required => 1,
                    type     => 'Str'
                },
                location => {
                    required => 0,
                    type     => 'Str'
                }
            },
        ),
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $address_cache = $self->create( \%values );

            return $address_cache;
          }

    };
}

1;

