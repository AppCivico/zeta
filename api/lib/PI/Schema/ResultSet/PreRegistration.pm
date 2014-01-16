package PI::Schema::ResultSet::PreRegistration;
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
                email=> {
                    required => 1,
                    type     => 'Str',
                    post_check => sub {
                        my $r = shift;
                        my $ret = 1;
                        eval {
                            $ret = 0
                            if (
                                $self->resultset('User')->find( { email => lc $r->get_value('email') } )
                                || $self->resultset('PreRegistration')->find( { email => lc $r->get_value('email') } )
                            );
                        };
                        return 0 if $@;

                        return $ret;
                    }
                },
                name=> {
                    required => 1,
                    type     => 'Str',
                },
                birth_date=> {
                    required => 1,
                    type     => DataStr,
                },
                telephone=> {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
                    required => 1,
                    type     => 'Int',
                },
                zone_id => {
                    required => 1,
                    type     => 'Int',
                },
                manufactured_year => {
                    required => 0,
                    type     => 'Int',
                },
                average_mileage => {
                    required => 0,
                    type     => 'Num',
                },
                marital_state => {
                    required => 0,
                    type     => 'Str',
                },
                gender => {
                    required => 1,
                    type     => 'Str',
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

            my $pre_registration = $self->create( \%values );

            return $pre_registration;
        },
    };
}

1;

