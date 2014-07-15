package Zeta::Schema::ResultSet::Organization;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
use Zeta::Types qw /DataStr TimeStr/;
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
                address => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code => {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                description => {
                    required => 0,
                    type     => 'Str',
                },
                phone => {
					required => 0,
                    type     => 'Str',
                },
                email => {
					required => 0,
                    type     => 'Str',
                },
                website => {
					required => 0,
                    type     => 'Str',
                },
                complement => {
					required => 0,
                    type     => 'Str',
                },
                number => {
					required => 0,
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

			my $organization = $self->create( \%values );

			return $organization;
        }
    };
}

1;