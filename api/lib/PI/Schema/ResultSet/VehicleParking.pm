package PI::Schema::ResultSet::VehicleParking;
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
                entry_time=> {
                    required => 1,
                    type     => TimeStr,
                },
                departure_time=> {
                    required => 1,
                    type     => TimeStr,
                },
                monthly_payment=> {
                    required => 0,
                    type     => 'Bool',
                },
                lat_lng=> {
                    required => 0,
                    type     => 'Str',
                },
                vehicle_id=> {
                    required => 1,
                    type     => 'Int',
                }
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values  = shift->valid_values;

            my $vehicle_parking = $self->create( \%values );

            return $vehicle_parking;
        }
    };
}

1;

