use utf8;
package PI::Schema::Result::Driver;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Driver

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

=head1 TABLE: C<driver>

=cut

__PACKAGE__->table("driver");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0
  sequence: 'driver_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 last_name

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 birth_date

  data_type: 'date'
  is_nullable: 0

=head2 cpf

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 first_driver_license

  data_type: 'date'
  is_nullable: 0

=head2 cnh_code

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 cnh_validity

  data_type: 'date'
  is_nullable: 0

=head2 mobile_provider

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 mobile_number

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 telephone_number

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 marital_state

  data_type: 'char'
  is_nullable: 0
  size: 1

=head2 address

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 neighborhood

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 complement

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 number

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 postal_code

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 created_by

  data_type: 'integer'
  is_nullable: 0

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
    sequence          => "driver_id_seq",
  },
  "name",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "last_name",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "birth_date",
  { data_type => "date", is_nullable => 0 },
  "cpf",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "first_driver_license",
  { data_type => "date", is_nullable => 0 },
  "cnh_code",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "cnh_validity",
  { data_type => "date", is_nullable => 0 },
  "mobile_provider",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "mobile_number",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "telephone_number",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "marital_state",
  { data_type => "char", is_nullable => 0, size => 1 },
  "address",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "neighborhood",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "complement",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "number",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "postal_code",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "created_by",
  { data_type => "integer", is_nullable => 0 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

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
  { "foreign.driver_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 id

Type: belongs_to

Related object: L<PI::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "id",
  "PI::Schema::Result::User",
  { id => "id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-07-23 11:21:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sxpRUHXGCkGVxAnMOaGpNA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
