use utf8;
package Zeta::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::User

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'promise_monitor_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: 'text'
  is_nullable: 0

=head2 password

  data_type: 'text'
  is_nullable: 0

=head2 organization_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 is_active

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=head2 reset_password_key

  data_type: 'text'
  is_nullable: 1

=head2 password_defined

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "promise_monitor_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "text", is_nullable => 0 },
  "password",
  { data_type => "text", is_nullable => 0 },
  "organization_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "is_active",
  { data_type => "smallint", default_value => 0, is_nullable => 1 },
  "reset_password_key",
  { data_type => "text", is_nullable => 1 },
  "password_defined",
  { data_type => "boolean", default_value => \"false", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 actions_logs

Type: has_many

Related object: L<Zeta::Schema::Result::ActionsLog>

=cut

__PACKAGE__->has_many(
  "actions_logs",
  "Zeta::Schema::Result::ActionsLog",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 federal_electoral_processes

Type: has_many

Related object: L<Zeta::Schema::Result::FederalElectoralProcess>

=cut

__PACKAGE__->has_many(
  "federal_electoral_processes",
  "Zeta::Schema::Result::FederalElectoralProcess",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 organization

Type: belongs_to

Related object: L<Zeta::Schema::Result::Organization>

=cut

__PACKAGE__->belongs_to(
  "organization",
  "Zeta::Schema::Result::Organization",
  { id => "organization_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 promise_contents

Type: has_many

Related object: L<Zeta::Schema::Result::PromiseContent>

=cut

__PACKAGE__->has_many(
  "promise_contents",
  "Zeta::Schema::Result::PromiseContent",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 promises

Type: has_many

Related object: L<Zeta::Schema::Result::Promise>

=cut

__PACKAGE__->has_many(
  "promises",
  "Zeta::Schema::Result::Promise",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 state_electoral_processes

Type: has_many

Related object: L<Zeta::Schema::Result::StateElectoralProcess>

=cut

__PACKAGE__->has_many(
  "state_electoral_processes",
  "Zeta::Schema::Result::StateElectoralProcess",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_roles

Type: has_many

Related object: L<Zeta::Schema::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "Zeta::Schema::Result::UserRole",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_sessions

Type: has_many

Related object: L<Zeta::Schema::Result::UserSession>

=cut

__PACKAGE__->has_many(
  "user_sessions",
  "Zeta::Schema::Result::UserSession",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_token_admin_trackers

Type: has_many

Related object: L<Zeta::Schema::Result::UserToken>

=cut

__PACKAGE__->has_many(
  "user_token_admin_trackers",
  "Zeta::Schema::Result::UserToken",
  { "foreign.admin_tracker_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_token_users

Type: has_many

Related object: L<Zeta::Schema::Result::UserToken>

=cut

__PACKAGE__->has_many(
  "user_token_users",
  "Zeta::Schema::Result::UserToken",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-08-11 08:12:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lpI/b0b7HanT/ab7x4XBwQ

__PACKAGE__->many_to_many( roles => user_roles => 'role' );

__PACKAGE__->remove_column('password');
__PACKAGE__->add_column(
    password => {
        data_type        => "text",
        passphrase       => 'crypt',
        passphrase_class => 'BlowfishCrypt',
        passphrase_args  => {
            cost        => 8,
            salt_random => 1,
        },
        passphrase_check_method => 'check_password',
        is_nullable             => 0
    },
);

__PACKAGE__->has_many(
    "sessions",
    "Zeta::Schema::Result::UserSession",
    { "foreign.user_id" => "self.id" },
    { cascade_copy      => 0, cascade_delete => 0 },
);


with 'Zeta::Role::Verification';
with 'Zeta::Role::Verification::TransactionalActions::DBIC';
with 'Zeta::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;



sub verifiers_specs {
    my $self = shift;
    return {

        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
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
                        return 1 if $self->email eq $r->get_value('email');

                        return 0 if $self->resultset_find( { email => lc ($r->get_value('email')) } );

                        return 1;
                      }
                },
                password => {
                    required  => 0,
                    type      => 'Str',
                    dependent => {
                        password_confirm => {
                            required => 1,
                            type     => 'Str',
                        },
                    },
                    post_check => sub {
                        my $r = shift;
                        return 1
                        if ( $r->get_value('password') eq $r->get_value('password_confirm')
                            && length $r->get_value('password') >= 5 );
                    },
                },
                is_active => {
                    required => 0,
                    type     => 'Bool'
                },
                reset_password_key => {
                    required    => 0,
                    type        => 'Str'
                },
                organization_id => {
					required 	=> 0,
					type		=> 'Int'
                },
                password_defined => {
					required => 0,
                    type     => 'Bool'
                }
            },
        ),
    };
}

sub action_specs {
    my $self = shift;
    return {
        update => sub {
            my %values = shift->valid_values;
            delete $values{password_confirm};
            not defined $values{$_} and delete $values{$_} for keys %values;

            my $new_role = delete $values{role};

            my $user = $self->update( \%values );
            $user->set_roles( { name => $new_role } ) if $new_role;
            return $user;
        },

    };
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
