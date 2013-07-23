use utf8;
package PI::Schema::Result::Contract;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Contract

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

=head1 TABLE: C<contract>

=cut

__PACKAGE__->table("contract");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'contract_id_seq'

=head2 code

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 status

  data_type: 'smallint'
  is_nullable: 0

=head2 total_amout

  data_type: 'numeric'
  is_nullable: 0

=head2 paid_amount

  data_type: 'numeric'
  is_nullable: 1

=head2 customer_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 valid_from

  data_type: 'timestamp'
  is_nullable: 0

=head2 valid_to

  data_type: 'timestamp'
  is_nullable: 0

=head2 driver_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vehicle_owner_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vehicle_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "contract_id_seq",
  },
  "code",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "status",
  { data_type => "smallint", is_nullable => 0 },
  "total_amout",
  { data_type => "numeric", is_nullable => 0 },
  "paid_amount",
  { data_type => "numeric", is_nullable => 1 },
  "customer_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "valid_from",
  { data_type => "timestamp", is_nullable => 0 },
  "valid_to",
  { data_type => "timestamp", is_nullable => 0 },
  "driver_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vehicle_owner_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vehicle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 customer

Type: belongs_to

Related object: L<PI::Schema::Result::Customer>

=cut

__PACKAGE__->belongs_to(
  "customer",
  "PI::Schema::Result::Customer",
  { id => "customer_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 driver

Type: belongs_to

Related object: L<PI::Schema::Result::Driver>

=cut

__PACKAGE__->belongs_to(
  "driver",
  "PI::Schema::Result::Driver",
  { id => "driver_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 payments

Type: has_many

Related object: L<PI::Schema::Result::Payment>

=cut

__PACKAGE__->has_many(
  "payments",
  "PI::Schema::Result::Payment",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle

Type: belongs_to

Related object: L<PI::Schema::Result::Vehicle>

=cut

__PACKAGE__->belongs_to(
  "vehicle",
  "PI::Schema::Result::Vehicle",
  { id => "vehicle_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 vehicle_owner

Type: belongs_to

Related object: L<PI::Schema::Result::VehicleOwner>

=cut

__PACKAGE__->belongs_to(
  "vehicle_owner",
  "PI::Schema::Result::VehicleOwner",
  { id => "vehicle_owner_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-07-23 11:21:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mWmGZ5nmc3Tf246H9xJV2w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
