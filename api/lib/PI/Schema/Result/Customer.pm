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
  original: {data_type => "varchar"}

=head2 corporate_name

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 email

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 cnpj

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 state_registration

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 municipal_registration

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 phone

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 mobile_phone

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 secondary_phone

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 postal_code

  data_type: 'integer'
  is_nullable: 0

=head2 address

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 number

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 neighborhood

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 complement

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 state_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

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
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "corporate_name",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "email",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "cnpj",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "state_registration",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "municipal_registration",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "phone",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "mobile_phone",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "secondary_phone",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "postal_code",
  { data_type => "integer", is_nullable => 0 },
  "address",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "number",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "neighborhood",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "complement",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "state_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

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

=head2 city

Type: belongs_to

Related object: L<PI::Schema::Result::City>

=cut

__PACKAGE__->belongs_to(
  "city",
  "PI::Schema::Result::City",
  { id => "city_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
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

=head2 state

Type: belongs_to

Related object: L<PI::Schema::Result::State>

=cut

__PACKAGE__->belongs_to(
  "state",
  "PI::Schema::Result::State",
  { id => "state_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<PI::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "PI::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-07-23 11:21:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0MRFsMtZTA8kh7YSpyUE8g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
