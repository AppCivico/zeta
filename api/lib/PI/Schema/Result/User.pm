use utf8;
package PI::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::User

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
  sequence: 'user_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: 'text'
  is_nullable: 0

=head2 active

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 password

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "user_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "text", is_nullable => 0 },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "password",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<user_email_key>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("user_email_key", ["email"]);

=head1 RELATIONS

=head2 actions_logs

Type: has_many

Related object: L<PI::Schema::Result::ActionsLog>

=cut

__PACKAGE__->has_many(
  "actions_logs",
  "PI::Schema::Result::ActionsLog",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 addresses

Type: has_many

Related object: L<PI::Schema::Result::Address>

=cut

__PACKAGE__->has_many(
  "addresses",
  "PI::Schema::Result::Address",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customers

Type: has_many

Related object: L<PI::Schema::Result::Customer>

=cut

__PACKAGE__->has_many(
  "customers",
  "PI::Schema::Result::Customer",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 documents

Type: has_many

Related object: L<PI::Schema::Result::Document>

=cut

__PACKAGE__->has_many(
  "documents",
  "PI::Schema::Result::Document",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drivers

Type: has_many

Related object: L<PI::Schema::Result::Driver>

=cut

__PACKAGE__->has_many(
  "drivers",
  "PI::Schema::Result::Driver",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_roles

Type: has_many

Related object: L<PI::Schema::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "PI::Schema::Result::UserRole",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_sessions

Type: has_many

Related object: L<PI::Schema::Result::UserSession>

=cut

__PACKAGE__->has_many(
  "user_sessions",
  "PI::Schema::Result::UserSession",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_token_admin_trackers

Type: has_many

Related object: L<PI::Schema::Result::UserToken>

=cut

__PACKAGE__->has_many(
  "user_token_admin_trackers",
  "PI::Schema::Result::UserToken",
  { "foreign.admin_tracker_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_token_users

Type: has_many

Related object: L<PI::Schema::Result::UserToken>

=cut

__PACKAGE__->has_many(
  "user_token_users",
  "PI::Schema::Result::UserToken",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_tokens

Type: has_many

Related object: L<PI::Schema::Result::VehicleToken>

=cut

__PACKAGE__->has_many(
  "vehicle_tokens",
  "PI::Schema::Result::VehicleToken",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-02 15:20:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Z49B9qcm4DkmCmzNoz/mRQ

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
    "PI::Schema::Result::UserSession",
    { "foreign.user_id" => "self.id" },
    { cascade_copy      => 0, cascade_delete => 0 },
);


with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

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
                active => {
                    required => 0,
                    type     => 'Bool'
                },
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
