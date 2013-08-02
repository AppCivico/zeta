package PI::Schema::ResultSet::VehicleRoute;
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
                name => {
                    required => 0,
                    type     => 'Str',
                },
                start_time_gone => {
                    required => 0,
                    type     => TimeStr,
                },
                start_time_back => {
                    required => 0,
                    type     => TimeStr,
                },
                origin => {
                    required => 0,
                    type     => 'Str',
                },
                origin_lat_lng => {
                    required => 0,
                    type     => 'Str',
                },
                destination => {
                    required => 0,
                    type     => 'Str',
                },
                destination_lat_lng => {
                    required => 0,
                    type     => 'Str',
                },
                vehicle_id => {
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
            my %values = shift->valid_values;

            my $vehicle_route = $self->create( \%values );

            return $vehicle_route;
          }
    };
}

1;
