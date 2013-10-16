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
                valid_from=> {
                    required => 0,
                    type     => DataStr,
                },
                valid_to=> {
                    required => 0,
                    type     => DataStr,
                },
                status => {
                    required => 1,
                    type     => 'Int',
                },
                est_drivers => {
                    required => 0,
                    type     => 'Int',
                },
                activated_at => {
                    required => 0,
                    type     => DataStr,
                },
                customer_id => {
                    required => 1,
                    type     => 'Int',
                },
            },
        ),
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $campaign = $self->create( \%values );

            return $campaign;
          }

    };
}

1;
