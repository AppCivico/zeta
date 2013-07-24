use utf8;
package PI::Schema::Result::Tracker;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Tracker

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

=head1 TABLE: C<tracker>

=cut

__PACKAGE__->table("tracker");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tracker_id_seq'

=head2 code

  data_type: 'text'
  is_nullable: 0

=head2 vehicle_id

  data_type: 'integer'
  is_nullable: 1

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
    sequence          => "tracker_id_seq",
  },
  "code",
  { data_type => "text", is_nullable => 0 },
  "vehicle_id",
  { data_type => "integer", is_nullable => 1 },
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

=head2 vehicle_trackers

Type: has_many

Related object: L<PI::Schema::Result::VehicleTracker>

=cut

__PACKAGE__->has_many(
  "vehicle_trackers",
  "PI::Schema::Result::VehicleTracker",
  { "foreign.tracker_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-07-23 18:27:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cl2NUGT8gUZIMpsPzKq6DA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
