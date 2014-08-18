package Zeta::Schema::ResultSet::StateElectoralProcess;
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
                content => {
					required => 1,
                    type     => 'Str'
                },
                source => {
					required => 1,
                    type     => 'Str'
                },
                created_by => {
					required => 1,
                    type     => 'Int'
                },
                electoral_regional_court_id => {
					required => 0,
                    type     => 'Int'
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

            my $state_electoral_process = $self->create( \%values );

            return $state_electoral_process;
        }
    };
}

1;