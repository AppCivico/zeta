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
                    required => 1,
                    type     => 'Str',
                    post_check => sub {
                        my $r = shift;
                        return 0 if $self->resultset('Vehicle')->search( {
                            renavam => $r->get_value('renavam'),
                            cpf     => $r->get_value('cpf')
                        } )->count;

                        return 1;
                      }
                },
                cpf => {
                    required => 1,
                    type     => 'Str',
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
                model => {
                    required => 1,
                    type     => 'Str',
                },
                model_year => {
                    required => 1,
                    type     => 'Int',
                },
                brand_name => {
                    required => 1,
                    type     => 'Str',
                },
                car_type => {
                    required => 1,
                    type     => 'Str',
                },
                km => {
                    required => 1,
                    type     => 'Int',
                },
                color   => {
                    required => 1,
                    type     => 'Str',
                },
                fuel_type => {
                    required => 1,
                    type     => 'Str',
                },
                chassi => {
                    required => 0,
                    type     => 'Str',
                },
                crv => {
                    required => 0,
                    type     => 'Str',
                },
                observations  => {
                    required => 0,
                    type     => 'Str',
                },
                driver_id => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_owner_id => {
                    required => 1,
                    type     => 'Int',
                },
                created_by => {
                    required => 1,
                    type    => 'Int'
                }
            },
        ),
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values  = shift->valid_values;

            my $vehicle = $self->create( \%values );

            return $vehicle;
          }

    };
}

1;

