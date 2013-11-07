package PI::Schema::ResultSet::InstalationKit;
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
                vehicle_id => {
                    required => 1,
                    type     => 'Int',
                },
                sent_at => {
                    required => 0,
                    type     => DataStr
                },
                status => {
                    required => 0,
                    type     => 'Int',
                },
                used_at => {
                    required => 0,
                    type     => DataStr
                },
                campaign_id => {
                    required => 1,
                    type     => 'Int',
                },
            },
        ),
    };
}

sub action_specs {
    my $self    = shift;
    my $random  = new String::Random;

    return {
        create => sub {
            my %values = shift->valid_values;

            my $instalation_kit;
            do {
                $values{token}      = $random->randpattern("ssss");
                $instalation_kit    = eval { $self->create( \%values ) };

                die $@ if $@ && "$@" !~ /instalation_kit_driver_id_token_key/;

            } while !$instalation_kit;

            return $instalation_kit;
        }
    };

}

1;

