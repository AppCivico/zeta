package PI::Schema::ResultSet::User;
use namespace::autoclean;

use utf8;
use Moose;
extends 'DBIx::Class::ResultSet';
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::InflateAsHashRef';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;

sub _build_verifier_scope_name { 'user' }

use Data::Printer;

sub verifiers_specs {
    my $self = shift;
    return {
        create => Data::Verifier->new(
            profile => {

                name => {
                    required => 1,
                    type     => 'Str',
                },

                password => {
                    required => 1,
                    type     => 'Str',
                },

                role => {
                    required => 1,
                    type     => 'Str',
                },

                email => {
                    required   => 1,
                    type       => EmailAddress,
                    post_check => sub {
                        my $r = shift;
                        return 0 if ( $self->find( { email => $r->get_value('email') } ) );
                        return 1;
                      }
                },

            },
        ),
        update => Data::Verifier->new(
            profile => {
                id => {
                    required => 1,
                    type     => 'Int',
                },
                name => {
                    required => 0,
                    type     => 'Str',
                },

                role => {
                    required => 0,
                    type     => 'Str',
                },
                email => {
                    required   => 0,
                    type       => EmailAddress,
                    post_check => sub {
                        my $r = shift;
                        if ( my $existing_user = $self->find( { email => $r->get_value('email') } ) ) {
                            return $existing_user->id == $r->get_value('id');
                        }
                        return 1;
                      }
                },
                password => {
                    required => 0,
                    type     => 'Str',
                },

            },
        ),

        login => Data::Verifier->new(
            profile => {
                email => {
                    required   => 1,
                    type       => EmailAddress,
                    post_check => sub {
                        my $r = shift;
                        return defined $self->find( { email => $r->get_value('email') } );
                      }
                },
                password => {
                    required => 1,
                    type     => 'Str',
                },
            }
        ),

    };
}

sub active { shift->search_rs( { active => 1 } ) }

sub action_specs {
    my $self = shift;
    return {
        login => sub { 1 },

        create => sub {
            my %values = shift->valid_values;
            delete $values{password_confirm};

            my $role = delete $values{role};

            my $user = $self->create( \%values );
            if ($role) {
                $user->set_roles( { name => $role } );
            }

            return $user;
        },
        update => sub {
            my %values = shift->valid_values;
            not defined $values{$_} and delete $values{$_} for keys %values;
            delete $values{password_confirm};

            # nao altera a senha se ela nao veio.
            delete $values{password} unless $values{password};
            delete $values{cidr} unless defined $values{cidr};

            my $new_role = delete $values{role};
            my $user = $self->find( { id => delete $values{id} } );

            $user = $user->update( \%values );
            $user->set_roles( { name => $new_role } ) if $new_role;
            return $user;
        },

    };
}

1;

