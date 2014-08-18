package Zeta::Schema::ResultSet::Promise;
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
                description => {
                    required => 0,
                    type     => 'Str',
                },
                category_id => {
                    required => 1,
                    type     => 'Int',
                },
                election_campaign_id => {
                    required => 0,
                    type     => 'Int',
                },
                candidate_id => {
                    required => 1,
                    type     => 'Int',
                },
                created_by => {
                    required => 1,
                    type     => 'Int',
                },
                source => {
                    required => 0,
                    type     => 'Str',
                },
                source_type_id => {
					required => 0,
                    type     => 'Int',
                },
                city_id => {
					required => 0,
                    type     => 'Int',
                },
                state_id => {
					required => 0,
                    type     => 'Int',
                },
                country_id => {
					required => 0,
                    type     => 'Int',
                },
                publication_date => {
					required 	=> 0,
					type		=> DataStr
                },
                external_link => {
					required 	=> 0,
					type		=> 'Str'
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

            my $promise = $self->create( \%values );

            return $promise;
        }
    };
}

1;