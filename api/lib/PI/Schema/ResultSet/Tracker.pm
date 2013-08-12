package PI::Schema::ResultSet::Tracker;
use namespace::autoclean;

use utf8;
use Moose;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr TimeStr/;
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
                code => {
                    required => 1,
                    type     => 'Str',
                },
                vehicle_id => {
                    required => 1,
                    type     => 'Int',
                },
                status => {
                    required => 0,
                    type     => 'Str'
                }
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $tracker = $self->create( \%values );

            return $tracker;
          }
    };
}

1;
