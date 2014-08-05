package Zeta::Schema::ResultSet::PromiseContent;
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
                promise_id => {
                    required => 1,
                    type     => 'Int',
                },
                name => {
                    required => 0,
                    type     => 'Str',
                },
                'link' => {
                    required => 0,
                    type     => 'Str',
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
					required => 1,
                    type     => 'Int',
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

            my $promise_content = $self->create( \%values );

            return $promise_content;
        }
    };
}

1;