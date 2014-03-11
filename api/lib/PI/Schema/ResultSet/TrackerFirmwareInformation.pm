package PI::Schema::ResultSet::TrackerFirmwareInformation;
use namespace::autoclean;

use utf8;
use Moose;
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
                version => {
                    required => 1,
                    type     => 'Num'
                },
                status => {
                    required => 1,
                    type     => 'Int'
                },
                private_path => {
                    required => 0,
                    type     => 'Str'
                },
                version_hash => {
                    required => 1,
                    type     => 'Str'
                },
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $firmware = $self->create( \%values );

            return $firmware;
          }
    };
}

1;
