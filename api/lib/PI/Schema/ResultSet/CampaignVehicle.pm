package PI::Schema::ResultSet::CampaignVehicle;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
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
               vehicle_id => {
                    required => 1,
                    type     => 'Int',
                },
                campaign_id => {
                    required => 1,
                    type     => 'Int',
                },
                status => {
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

            my $campaign = $self->create( \%values );

            return $campaign;
          }

    };
}

1;
