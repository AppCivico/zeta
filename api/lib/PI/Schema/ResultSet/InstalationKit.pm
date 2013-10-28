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
                driver_id => {
                    required => 1,
                    type     => 'Int',
                },
                sent_at => {
                    required => 0,
                    type     => DataStr
                },
                token => {
                    required => 1,
                    type     => 'Str'
                },
                status => {
                    required => 1,
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

