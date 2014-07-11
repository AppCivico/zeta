package Zeta::Schema::ResultSet::ElectionCampaign;
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
               year => {
                    required => 1,
                    type     => 'Int',
                },
                state_id => {
                    required => 0,
                    type     => 'Int',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                country_id => {
                    required => 0,
                    type     => 'Int',
                },
                political_position_id => {
                    required => 1,
                    type     => 'Int',
                },
                elected_candidate_id => {
                    required => 0,
                    type     => 'Int',
                },
                is_active => {
                    required => 0,
                    type     => 'Bool'
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

            my $election_campaign = $self->create( \%values );

            return $election_campaign;
          }

    };
}

1;

