use utf8;
package PI::Schema::Result::Customer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Customer

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

=head1 TABLE: C<customer>

=cut

__PACKAGE__->table("customer");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'customer_id_seq'

=head2 fancy_name

  data_type: 'text'
  is_nullable: 1

=head2 corporate_name

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: 'text'
  is_nullable: 0

=head2 cnpj

  data_type: 'text'
  is_nullable: 0

=head2 state_registration

  data_type: 'text'
  is_nullable: 1

=head2 municipal_registration

  data_type: 'text'
  is_nullable: 1

=head2 phone

  data_type: 'text'
  is_nullable: 0

=head2 mobile_phone

  data_type: 'text'
  is_nullable: 0

=head2 secondary_phone

  data_type: 'text'
  is_nullable: 1

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 address_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "customer_id_seq",
  },
  "fancy_name",
  { data_type => "text", is_nullable => 1 },
  "corporate_name",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "text", is_nullable => 0 },
  "cnpj",
  { data_type => "text", is_nullable => 0 },
  "state_registration",
  { data_type => "text", is_nullable => 1 },
  "municipal_registration",
  { data_type => "text", is_nullable => 1 },
  "phone",
  { data_type => "text", is_nullable => 0 },
  "mobile_phone",
  { data_type => "text", is_nullable => 0 },
  "secondary_phone",
  { data_type => "text", is_nullable => 1 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "address_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 address

Type: belongs_to

Related object: L<PI::Schema::Result::Address>

=cut

__PACKAGE__->belongs_to(
  "address",
  "PI::Schema::Result::Address",
  { id => "address_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 campaigns

Type: has_many

Related object: L<PI::Schema::Result::Campaign>

=cut

__PACKAGE__->has_many(
  "campaigns",
  "PI::Schema::Result::Campaign",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 contracts

Type: has_many

Related object: L<PI::Schema::Result::Contract>

=cut

__PACKAGE__->has_many(
  "contracts",
  "PI::Schema::Result::Contract",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer_payments

Type: has_many

Related object: L<PI::Schema::Result::CustomerPayment>

=cut

__PACKAGE__->has_many(
  "customer_payments",
  "PI::Schema::Result::CustomerPayment",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 invitations

Type: has_many

Related object: L<PI::Schema::Result::Invitation>

=cut

__PACKAGE__->has_many(
  "invitations",
  "PI::Schema::Result::Invitation",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user

Type: belongs_to

Related object: L<PI::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "PI::Schema::Result::User",
  { id => "user_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-15 19:52:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sy3kA+9LLazuM85tGcGDiw
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr/;

sub verifiers_specs {
    my $self = shift;
     return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                email=> {
                    required => 0,
                    type     => 'Str',
                },
                fancy_name=> {
                    required => 0,
                    type     => 'Str',
                },
                corporate_name=> {
                    required => 0,
                    type     => 'Str',
                },
                cnpj=> {
                    required => 0,
                    type     => 'Str',
                },
                state_registration=> {
                    required => 0,
                    type     => 'Str',
                },
                municipal_registration=> {
                    required => 0,
                    type     => 'Str',
                },
                phone=> {
                    required => 0,
                    type     => 'Str',
                },
                mobile_phone=> {
                    required => 0,
                    type     => 'Str',
                },
                secondary_phone=> {
                    required => 0,
                    type     => 'Str',
                },
                address_id => {
                    required => 0,
                    type     => 'Int',
                },
#                 password => {
#                     required  => 0,
#                     type      => 'Str',
#                     dependent => {
#                         password_confirm => {
#                             required => 0,
#                             type     => 'Str',
#                         },
#                     },
#                     post_check => sub {
#                         my $r = shift;
#
#                         if (!$r->get_value('password')) {
#                             return 1;
#                         }
#
#                         return $r->get_value('password') eq $r->get_value('password_confirm');
#                     },
#                 },
            }
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

            my $user_rs = $self->resultset('User');

            if( $values{password} ) {
                my $user = $user_rs->update({
                        password => delete $values{password}
                    });
            }

            my $customer = $self->update( \%values );

            return $customer;
        },
    };
}
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
