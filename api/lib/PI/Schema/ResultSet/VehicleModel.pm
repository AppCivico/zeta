package PI::Schema::ResultSet::VehicleModel;
use namespace::autoclean;

use utf8;
use Moose;
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
                name => {
                    required => 1,
                    type     => 'Str',
                },
                vehicle_brand_id => {
                    required => 1,
                    type     => 'Int',
                }
            }
        ),
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $vehicle_model = $self->create( \%values );

            return $vehicle_model;
        },
    };
}

1;
