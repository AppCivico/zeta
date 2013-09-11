package PI::Schema::ResultSet::Customer;
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
                email => {
                    required => 0,
                    type     => 'Str',
                },
                fancy_name => {
                    required => 0,
                    type     => 'Str',
                },
                corporate_name => {
                    required => 1,
                    type     => 'Str',
                },
                cnpj => {
                    required => 1,
                    type     => 'Str',
                },
                state_registration => {
                    required => 0,
                    type     => 'Str',
                },
                municipal_registration => {
                    required => 0,
                    type     => 'Str',
                },
                phone => {
                    required => 1,
                    type     => 'Str',
                },
                mobile_phone => {
                    required => 1,
                    type     => 'Str',
                },
                secondary_phone => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code => {
                    required => 1,
                    type     => 'Str',
                },
                address => {
                    required => 1,
                    type     => 'Str',
                },
                number => {
                    required => 1,
                    type     => 'Str',
                },
                neighborhood => {
                    required => 1,
                    type     => 'Str',
                },
                complement => {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
                    required => 1,
                    type     => 'Str',
                },
                state_id => {
                    required => 1,
                    type     => 'Str',
                },
                password => {
                    required  => 1,
                    type      => 'Str',
                    dependent => {
                        password_confirm => {
                            required => 1,
                            type     => 'Str',
                        },
                    },
                    post_check => sub {
                        my $r = shift;
                        return $r->get_value('password') eq $r->get_value('password_confirm');
                    },
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

            delete $values{password_confirm};
            my $user_rs = $self->resultset('User');
            my $user    = $user_rs->create(
                {
                    email    => lc $values{email},
                    name     => "$values{corporate_name}",
                    password => delete $values{password}
                }
            );
            $user->set_roles( { name => 'user' } );
            $values{user_id} = $user->id;

            my $customer = $self->create( \%values );

            return $customer;
          }

    };
}

1;
