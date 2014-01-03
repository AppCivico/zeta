package PI::Schema::ResultSet::Vehicle;
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
                car_plate => {
                    required   => 1,
                    type       => 'Str',
                    post_check => sub {
                        my $r     = shift;
                        my $plate = $r->get_value('car_plate');

                        return 0
                          unless $plate =~ /^[a-zA-Z]{3}\d{4}$/;

                        return 1;
                      }
                },
                doors_number => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_model_id => {
                    required => 1,
                    type     => 'Int',
                },
                manufacture_year => {
                    required => 1,
                    type     => 'Int',
                },
                model_year => {
                    required => 1,
                    type     => 'Int',
                    post_check => sub {
                        my $r = shift;

                        my $manufacture = $r->get_value('manufacture_year');
                        my $model       = $r->get_value('model_year');

                        return 1 if $manufacture <= $model;

                        return 0;
                    }
                },
                vehicle_brand_id => {
                    required => 1,
                    type     => 'Int',
                },
                km => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_color_id => {
                    required => 1,
                    type     => 'Int',
                },
                fuel_type => {
                    required => 1,
                    type     => 'Str',
                },
                driver_id => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_owner_id => {
                    required => 0,
                    type     => 'Int',
                },
                created_by => {
                    required => 1,
                    type     => 'Int',
                },
                state_id => {
                    required => 1,
                    type     => 'Int',
                },
                city_id => {
                    required => 1,
                    type     => 'Int',
                },
                insurance_company_id => {
                    required => 0,
                    type     => 'Int',
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

            my $vehicle = $self->create( \%values );

            return $vehicle;
          }

    };
}

1;

