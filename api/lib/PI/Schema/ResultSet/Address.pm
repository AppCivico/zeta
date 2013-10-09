package PI::Schema::ResultSet::Address;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr TimeStr/;
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
                    required => 1,
                    type     => 'Str',
                },
                number => {
                    required => 1,
                    type     => 'Str',
                },
                neighborhood => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code => {
                    required => 0,
                    type     => 'Str',
                },
                lat_lng => {
                    required => 0,
                    type     => 'Str',
                },
                user_id => {
                    required => 1,
                    type     => 'Int',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
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

            my $address = $self->create( \%values );

            return $address;
          }
    };
}

1;
