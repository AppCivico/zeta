package PI::Schema::ResultSet::VehicleTracker;
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
                tracker_id => {
                    required => 1,
                    type     => 'Int',
                },
                track_event => {
                    required => 0,
                    type     => DataStr,
                },
                lat => {
                    required => 1,
                    type     => 'Num',
                },
                lng => {
                    required => 1,
                    type     => 'Num',
                },
                speed => {
                    required => 1,
                    type     => 'Num',
                },
                vehicle_id => {
                    required => 1,
                    type     => 'Int',
                },
                transaction => {
                    required => 0,
                    type     => 'Str',
                }
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $vehicle_tracker = $self->create( \%values );

            return $vehicle_tracker;
          }
    };
}

1;
