use utf8;
package PI::Schema::Result::VehicleDisplacementStatistic;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::VehicleDisplacementStatistic

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

=head1 TABLE: C<vehicle_displacement_statistics>

=cut

__PACKAGE__->table("vehicle_displacement_statistics");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vehicle_displacement_statistics_id_seq'

=head2 vehicle_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 tracker_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 max_speed

  data_type: 'double precision'
  is_nullable: 1

=head2 min_speed

  data_type: 'double precision'
  is_nullable: 1

=head2 medium_speed

  data_type: 'double precision'
  is_nullable: 1

=head2 date

  data_type: 'date'
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
    sequence          => "vehicle_displacement_statistics_id_seq",
  },
  "vehicle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "tracker_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "max_speed",
  { data_type => "double precision", is_nullable => 1 },
  "min_speed",
  { data_type => "double precision", is_nullable => 1 },
  "medium_speed",
  { data_type => "double precision", is_nullable => 1 },
  "date",
  { data_type => "date", is_nullable => 0 },
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

=head2 tracker

Type: belongs_to

Related object: L<PI::Schema::Result::Tracker>

=cut

__PACKAGE__->belongs_to(
  "tracker",
  "PI::Schema::Result::Tracker",
  { id => "tracker_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-15 18:47:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HB2nPvS0T4is62sNsiRC+w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
