package PI::Schema::ResultSet::CepCache;
use namespace::autoclean;

use utf8;
use Moose;
use PI::Types qw /DataStr/;
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
                address => {
                    required    => 1,
                    type        =>  'Str'
                },
                postal_code =>  {
                    required    => 1,
                    type        =>  'Str'
                },
                neighborhood => {
                    required    => 1,
                    type        =>  'Str'
                },
                city_id => {
                    required    => 1,
                    type        =>  'Str'
                },
                state_id => {
                    required    => 1,
                    type        =>  'Str'
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

            my $address_cache = $self->create( \%values );

            return $address_cache;
          }

    };
}

1;

