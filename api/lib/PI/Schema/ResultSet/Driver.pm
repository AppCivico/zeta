package PI::Schema::ResultSet::Driver;
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
                    required => 1,
                    type     => 'Str',
                },
                cnh_code => {
                    required => 1,
                    type     => 'Str',
                },
                cnh_validity => {
                    required => 1,
                    type     => DataStr,
                },
                first_driver_license => {
                    required => 1,
                    type     => DataStr,
                },
                mobile_provider => {
                    required => 1,
                    type     => 'Str',
                },
                mobile_number => {
                    required => 1,
                    type     => 'Str',
                },
                telephone_number => {
                    required => 1,
                    type     => 'Str',
                },
                marital_state => {
                    required => 1,
                    type     => 'Str',
                },
                address => {
                    required => 0,
                    type     => 'Str',
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
                city_id => {
                    required => 1,
                    type     => 'Int',
                },
                email => {
                    required   => 1,
                    type       => EmailAddress,
                    post_check => sub {
                        my $r = shift;
                        return 0 if ( $self->resultset('User')->find( { email => $r->get_value('email') } ) );
                        return 1;
                      }
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
            my $user_rs = $self->resultset('User');
            my $user    = $user_rs->create(
                {
                    email    => delete $values{email},
                    name     => "$values{name} $values{last_name}",
                    password => '12345'
                }
            );
            $user->set_roles( { name => 'user' } );
            $values{user_id}    = $user->id;
            $values{created_by} = 1;
            my $driver = $self->create( \%values );

            return $driver;
          }

    };
}

1;
