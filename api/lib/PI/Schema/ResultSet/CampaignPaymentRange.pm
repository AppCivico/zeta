package PI::Schema::ResultSet::CampaignPaymentRange;
use namespace::autoclean;

use utf8;
use Moose;

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
                campaign_id => {
                    required => 1,
                    type     => 'Int',
                },
                range => {
                    required => 1,
                    type     => 'Num',
                },
                value => {
                    required => 1,
                    type     => 'Num',
                },
            }
        ),
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $campaign_payment_range = $self->create( \%values );

            return $campaign_payment_range;
        }
    };
}

1;