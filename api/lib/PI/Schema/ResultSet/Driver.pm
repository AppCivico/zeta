package PI::Schema::ResultSet::Driver;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
use MooseX::Types::CPF qw(CPF);
use PI::Types qw /DataStr/;
use DateTime;
use DateTime::Format::Pg;

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
                    required   => 1,
                    type       => 'Str',
                    post_check => sub {
                        my $r    = shift;
                        my $name = $r->get_value('name');

                        return 0 if $name !~ /^[^\d]+$/;
                        return 0 if length($name) <= 1;

                        return 1;
                      }
                },
                birth_date => {
                    required   => 1,
                    type       => DataStr,
                    post_check => sub {
                        my $r        = shift;
                        my $now      = DateTime->now();
                        my $date     = eval { DateTime::Format::Pg->parse_datetime( $r->get_value('birth_date') ) };
                        my $interval = eval { $now->subtract_datetime($date) };

                        return 1 if $interval->years >= 18 && $interval->years < 120;

                        return 0;
                      }
                },
                cpf => {
                    required   => 1,
                    type       => CPF,
                    filters    => [$PI::Types::ONLY_DIGITY],
                    post_check => sub {
                        my $r   = shift;
                        my $ret = 1;
                        eval {
                            my $str = $r->get_value('cpf');

                           $ret = 0 if $str =~ /^(\d)\1*$/ || $self->find( { cpf => $str } );
                       };
                        return 0 if $@;

                        return $ret;
                      }
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
                address_id => {
                    required => 0,
                    type     => 'Int',
                },
                validation_key => {
                    required => 0,
                    type     => 'Str',
                },
                password => {
                    required => 1,
                    type     => 'Str',
                },
                gender => {
                    required    => 1,
                    type        => 'Str'
                },
                email => {
                    required  => 1,
                    type      => EmailAddress,
                    dependent => {
                        email_confirm => {
                            required => 1,
                            type     => EmailAddress,
                        },
                    },
                    post_check => sub {
                        my $r = shift;
                        return 0
                          if ( $self->resultset('User')->find( { email => lc $r->get_value('email') } )
                            || $r->get_value('email') ne $r->get_value('email_confirm') );

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
            my %values = shift->valid_values;

            delete $values{password_confirm};
            delete $values{email_confirm};
            my $user_rs = $self->resultset('User');
            my $user    = $user_rs->create(
                {
                    email    => lc delete $values{email},
                    name     => "$values{name}",
                    password => delete $values{password},
                    active   => 0
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