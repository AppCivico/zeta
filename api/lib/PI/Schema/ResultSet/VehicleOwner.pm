package PI::Schema::ResultSet::VehicleOwner;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr/;
use MooseX::Types::CPF qw(CPF);
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
                email => {
                    required => 1,
                    type     => 'Str',
                },
                name => {
                    required => 1,
                    type     => 'Str',
                },
                last_name => {
                    required => 1,
                    type     => 'Str',
                },
                birth_date => {
                    required => 1,
                    type     => DataStr,
                },
                cpf => {
                    required   => 1,
                    type       => CPF,
                    filters    => [$PI::Types::ONLY_DIGITY],
                    post_check => sub {
                        my $r   = shift;
                        my $str = $r->get_value('cpf');
                        return 0 if $str =~ /^(\d)\1*$/;
                        return 0 if $self->find( { cpf => $str } );
                        return 1;
                      }
                },
                bank_code => {
                    required => 1,
                    type     => 'Str',
                },
                bank_ag => {
                    required => 1,
                    type     => 'Str',
                },
                bank_cc => {
                    required => 1,
                    type     => 'Str',
                },
                telephone_number => {
                    required => 1,
                    type     => 'Str',
                },
                mobile_provider => {
                    required => 0,
                    type     => 'Str',
                },
                mobile_number => {
                    required => 0,
                    type     => 'Str',
                },
                address => {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
                    required => 1,
                    type     => 'Int',
                },
                neighborhood => {
                    required => 0,
                    type     => 'Str',
                },
                complement => {
                    required => 0,
                    type     => 'Str',
                },
                number => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code => {
                    required => 0,
                    type     => 'Str',
                },
                created_by => {
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

            my $vehicle_owner = $self->create( \%values );

            return $vehicle_owner;
        },

    };
}

1;

