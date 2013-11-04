package PI::Schema::ResultSet::Document;
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
                class_name => {
                    required => 1,
                    type     => 'Str',
                },
                private_path => {
                    required => 0,
                    type     => 'Str',
                },
                validated_at => {
                    required => 0,
                    type     => DataStr,
                },
                validated_by => {
                    required => 0,
                    type     => 'Int',
                },
                vehicle_id => {
                    required => 0,
                    type     => 'Int',
                },
                user_id => {
                    required => 0,
                    type     => 'Int',
                },
                status => {
                    required    => 0,
                    type        => 'Int'
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

            my $document = $self->create( \%values );

            return $document;
          }
    };
}

1;

