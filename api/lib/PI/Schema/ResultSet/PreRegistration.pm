package PI::Schema::ResultSet::PreRegistration;
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
                email=> {
                    required => 1,
                    type     => 'Str',
                    post_check => sub {
                        my $r   = shift;
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
                },
                postal_code_college => {
                    required => 0,
                    type     => 'Int',
                },
                postal_code_home=> {
                    required => 0,
                    type     => 'Int',
                },
                postal_code_job => {
                    required => 0,
                    type     => 'Int',
                },
                record_origin => {
                    required => 0,
                    type     => 'Str',
                },
                fb_id => {
                    required => 0,
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

            my $pre_registration = $self->create( \%values );

            return $pre_registration;
        },
    };
}

1;

