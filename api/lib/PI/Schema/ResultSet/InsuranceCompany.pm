package PI::Schema::ResultSet::InsuranceCompany;
use namespace::autoclean;

use utf8;
use Moose;
use String::Random;
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
            },
        ),
    };
}

sub action_specs {
    my $self    = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $insurance_company = $self->create( \%values );

            return $insurance_company;
          }

    };

}

1;

