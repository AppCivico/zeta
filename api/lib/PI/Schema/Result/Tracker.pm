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

=head2 status

  data_type: 'text'
  is_nullable: 1

=head2 iccid

  data_type: 'bigint'
  is_nullable: 1

=head2 mobile_number

  data_type: 'integer'
  is_nullable: 1

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
  "status",
  { data_type => "text", is_nullable => 1 },
  "iccid",
  { data_type => "bigint", is_nullable => 1 },
  "mobile_number",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<tracker_code_vehicle_id_key>

=over 4

=item * L</code>

=item * L</vehicle_id>

=back

=cut

__PACKAGE__->add_unique_constraint("tracker_code_vehicle_id_key", ["code", "vehicle_id"]);

=head1 RELATIONS

=head2 vehicle_displacement_statistics

Type: has_many

Related object: L<PI::Schema::Result::VehicleDisplacementStatistic>

=cut

__PACKAGE__->has_many(
  "vehicle_displacement_statistics",
  "PI::Schema::Result::VehicleDisplacementStatistic",
  { "foreign.tracker_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_tracker_events

Type: has_many

Related object: L<PI::Schema::Result::VehicleTrackerEvent>

=cut

__PACKAGE__->has_many(
  "vehicle_tracker_events",
  "PI::Schema::Result::VehicleTrackerEvent",
  { "foreign.tracker_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-30 19:37:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RpaEQa7Fpxn6St21vyp6nA

with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr TimeStr/;

sub verifiers_specs {
    my $self = shift;
     return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                code => {
                    required => 0,
                    type     => 'Str',
                },
                status => {
                    required => 0,
                    type     => 'Str'
                },
                vehicle_id => {
                    required => 0,
                    type     => 'Int'
                }
            }
        ),
    };
}

sub action_specs {
    my $self = shift;
    use DDP;
    return {
        update => sub {
            my %values = shift->valid_values;

            not defined $values{$_} and delete $values{$_} for grep {$_ !~ /vehicle_id/} keys %values;

            my $tracker = $self->update( \%values );

            return $tracker;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
