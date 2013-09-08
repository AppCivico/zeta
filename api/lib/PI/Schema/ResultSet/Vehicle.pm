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
                renavam => {
                    required   => 1,
                    type       => 'Str',
                    post_check => sub {
                        my $r = shift;
                        return 0
                          if $self->resultset('Vehicle')->search(
                            {
                                renavam => $r->get_value('renavam'),
                            }
                          )->count;

                        return 1;
                      }
                },
                car_plate => {
                    required => 1,
                    type     => 'Str',
                },
                doors_number => {
                    required => 1,
                    type     => 'Int',
                },
                manufacture_year => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_model_id => {
                    required => 1,
                    type     => 'Int',
                },
                model_year => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_brand_id => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_body_style_id => {
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
                observations => {
                    required => 0,
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

