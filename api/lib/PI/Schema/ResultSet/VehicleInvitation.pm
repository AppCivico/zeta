package PI::Schema::ResultSet::VehicleInvitation;
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
use String::Random;

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
                invitation_id => {
                    required => 1,
                    type     => 'Int',
                },
                sent_at => {
                    required => 0,
                    type     => DataStr,
                },
            },
        ),
    };
}

sub action_specs {
    my $self = shift;

    my $random = new String::Random;
    return {
        create => sub {
            my %values = shift->valid_values;

            my $vehicle_invitation = $self->create( \%values );

            return $vehicle_invitation;
          }
    };
}

1;