use utf8;
package PI::Schema::Result::City;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::City

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

=head1 TABLE: C<city>

=cut

__PACKAGE__->table("city");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'city_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 state_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 country_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 name_url

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "city_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "state_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "country_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name_url",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 cep_caches

Type: has_many

Related object: L<PI::Schema::Result::CepCache>

=cut

__PACKAGE__->has_many(
  "cep_caches",
  "PI::Schema::Result::CepCache",
  { "foreign.city_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 country

Type: belongs_to

Related object: L<PI::Schema::Result::Country>

=cut

__PACKAGE__->belongs_to(
  "country",
  "PI::Schema::Result::Country",
  { id => "country_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 customers

Type: has_many

Related object: L<PI::Schema::Result::Customer>

=cut

__PACKAGE__->has_many(
  "customers",
  "PI::Schema::Result::Customer",
  { "foreign.city_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drivers

Type: has_many

Related object: L<PI::Schema::Result::Driver>

=cut

__PACKAGE__->has_many(
  "drivers",
  "PI::Schema::Result::Driver",
  { "foreign.city_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 regions

Type: has_many

Related object: L<PI::Schema::Result::Region>

=cut

__PACKAGE__->has_many(
  "regions",
  "PI::Schema::Result::Region",
  { "foreign.city_id" => "self.id" },
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
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 vehicle_owners

Type: has_many

Related object: L<PI::Schema::Result::VehicleOwner>

=cut

__PACKAGE__->has_many(
  "vehicle_owners",
  "PI::Schema::Result::VehicleOwner",
  { "foreign.city_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicles

Type: has_many

Related object: L<PI::Schema::Result::Vehicle>

=cut

__PACKAGE__->has_many(
  "vehicles",
  "PI::Schema::Result::Vehicle",
  { "foreign.city_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-09-07 16:57:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F0Q9etLO9mfb4Vh6JN75tw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
