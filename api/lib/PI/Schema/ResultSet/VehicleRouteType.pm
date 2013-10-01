package PI::Schema::ResultSet::VehicleRouteType;
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
                name => {
                    required    => 1,
                    type        => 'Str',
                },
                address_id => {
                    required    => 1,
                    type        => 'Int',
                },
                vehicle_parking_id => {
                    required    => 0,
                    type        => 'Int',
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

            my $vehicle_route_type = $self->create( \%values );

            return $vehicle_route_type;
          }
    };
}

1;