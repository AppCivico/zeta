package PI::Schema::ResultSet::VehicleToken;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr TimeStr/;
use String::Random;
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
                vehicle_id => {
                    required => 1,
                    type     => 'Int',
                },
                used_at => {
                    required => 0,
                    type     => DataStr,
                },
                user_id => {
                    required => 1,
                    type     => 'Int',
                },
                alert_sent_at => {
                    required => 0,
                    type     => DataStr,
                }
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    my $random = new String::Random;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $vehicle_token;
            do {
                $values{token} = $random->randpattern( "ssss" );
                $vehicle_token = eval{$self->create( \%values )};

                die $@ if $@ && "$@" !~ /vehicle_token_token_vehicle_id_key/;

            } while !$vehicle_token;

            return $vehicle_token;
          }
    };
}

1;