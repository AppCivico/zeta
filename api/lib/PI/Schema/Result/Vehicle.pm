use utf8;
package PI::Schema::Result::Vehicle;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Vehicle

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

=head1 TABLE: C<vehicle>

=cut

__PACKAGE__->table("vehicle");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vehicle_id_seq'

=head2 renavam

  data_type: 'text'
  is_nullable: 1

=head2 car_plate

  data_type: 'text'
  is_nullable: 0

=head2 doors_number

  data_type: 'smallint'
  is_nullable: 0

=head2 manufacture_year

  data_type: 'integer'
  is_nullable: 0

=head2 model_year

  data_type: 'integer'
  is_nullable: 0

=head2 km

  data_type: 'integer'
  is_nullable: 0

=head2 fuel_type

  data_type: 'text'
  is_nullable: 0

=head2 vehicle_owner_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 created_by

  data_type: 'integer'
  is_nullable: 0

=head2 driver_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 state_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vehicle_model_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vehicle_brand_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vehicle_color_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 insurance_company_id

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
    sequence          => "vehicle_id_seq",
  },
  "renavam",
  { data_type => "text", is_nullable => 1 },
  "car_plate",
  { data_type => "text", is_nullable => 0 },
  "doors_number",
  { data_type => "smallint", is_nullable => 0 },
  "manufacture_year",
  { data_type => "integer", is_nullable => 0 },
  "model_year",
  { data_type => "integer", is_nullable => 0 },
  "km",
  { data_type => "integer", is_nullable => 0 },
  "fuel_type",
  { data_type => "text", is_nullable => 0 },
  "vehicle_owner_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "created_by",
  { data_type => "integer", is_nullable => 0 },
  "driver_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "state_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vehicle_model_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vehicle_brand_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vehicle_color_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "insurance_company_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<vehicle_renavam_key>

=over 4

=item * L</renavam>

=back

=cut

__PACKAGE__->add_unique_constraint("vehicle_renavam_key", ["renavam"]);

=head1 RELATIONS

=head2 campaign_vehicles

Type: has_many

Related object: L<PI::Schema::Result::CampaignVehicle>

=cut

__PACKAGE__->has_many(
  "campaign_vehicles",
  "PI::Schema::Result::CampaignVehicle",
  { "foreign.vehicle_id" => "self.id" },
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
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 documents

Type: has_many

Related object: L<PI::Schema::Result::Document>

=cut

__PACKAGE__->has_many(
  "documents",
  "PI::Schema::Result::Document",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 instalation_kits

Type: has_many

Related object: L<PI::Schema::Result::InstalationKit>

=cut

__PACKAGE__->has_many(
  "instalation_kits",
  "PI::Schema::Result::InstalationKit",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 insurance_company

Type: belongs_to

Related object: L<PI::Schema::Result::InsuranceCompany>

=cut

__PACKAGE__->belongs_to(
  "insurance_company",
  "PI::Schema::Result::InsuranceCompany",
  { id => "insurance_company_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
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

=head2 vehicle_brand

Type: belongs_to

Related object: L<PI::Schema::Result::VehicleBrand>

=cut

__PACKAGE__->belongs_to(
  "vehicle_brand",
  "PI::Schema::Result::VehicleBrand",
  { id => "vehicle_brand_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 vehicle_color

Type: belongs_to

Related object: L<PI::Schema::Result::VehicleColor>

=cut

__PACKAGE__->belongs_to(
  "vehicle_color",
  "PI::Schema::Result::VehicleColor",
  { id => "vehicle_color_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 vehicle_displacement_statistics

Type: has_many

Related object: L<PI::Schema::Result::VehicleDisplacementStatistic>

=cut

__PACKAGE__->has_many(
  "vehicle_displacement_statistics",
  "PI::Schema::Result::VehicleDisplacementStatistic",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_invitations

Type: has_many

Related object: L<PI::Schema::Result::VehicleInvitation>

=cut

__PACKAGE__->has_many(
  "vehicle_invitations",
  "PI::Schema::Result::VehicleInvitation",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_model

Type: belongs_to

Related object: L<PI::Schema::Result::VehicleModel>

=cut

__PACKAGE__->belongs_to(
  "vehicle_model",
  "PI::Schema::Result::VehicleModel",
  { id => "vehicle_model_id" },
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
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 vehicle_routes

Type: has_many

Related object: L<PI::Schema::Result::VehicleRoute>

=cut

__PACKAGE__->has_many(
  "vehicle_routes",
  "PI::Schema::Result::VehicleRoute",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_tokens

Type: has_many

Related object: L<PI::Schema::Result::VehicleToken>

=cut

__PACKAGE__->has_many(
  "vehicle_tokens",
  "PI::Schema::Result::VehicleToken",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_tracker_events

Type: has_many

Related object: L<PI::Schema::Result::VehicleTrackerEvent>

=cut

__PACKAGE__->has_many(
  "vehicle_tracker_events",
  "PI::Schema::Result::VehicleTrackerEvent",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_trackers

Type: has_many

Related object: L<PI::Schema::Result::VehicleTracker>

=cut

__PACKAGE__->has_many(
  "vehicle_trackers",
  "PI::Schema::Result::VehicleTracker",
  { "foreign.vehicle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2014-01-07 15:31:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tMgAu0Y1+dDbr10u4q0U7A
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr/;
use Data::Dumper;
sub verifiers_specs {
    my $self = shift;
    return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                renavam => {
                    required   => 0,
                    type       => 'Str',
                    post_check => sub {
                        my $r = shift;

                        if (
                            $self->resultset('Vehicle')->search({
                                    renavam => $r->get_value('renavam'),
                                    id      => {'<>' => $self->id},
                                })->count
                            || (   length $r->get_value('renavam') < 9
                            || length $r->get_value('renavam') > 11 )
                          ) {
                            return 0;
                        }

                        return 1;
                      }
                },
                car_plate => {
                    required => 0,
                    type     => 'Str',
                },
                doors_number => {
                    required => 0,
                    type     => 'Int',
                },
                vehicle_model_id => {
                    required => 0,
                    type     => 'Int',
                },
                manufacture_year => {
                    required => 0,
                    type     => 'Int',
                },
                model_year => {
                    required => 0,
                    type     => 'Int',
                    post_check => sub {
                        my $r = shift;

                        my $manufacture = $r->get_value('manufacture_year');
                        my $model       = $r->get_value('model_year');

                        return 1 if $manufacture <= $model;

                        return 0;
                    }
                },
                vehicle_brand_id => {
                    required => 0,
                    type     => 'Int',
                },
                km => {
                    required => 0,
                    type     => 'Int',
                },
               vehicle_color_id   => {
                    required => 0,
                    type     => 'Int',
                },
                fuel_type => {
                    required => 0,
                    type     => 'Str',
                },
                driver_id => {
                    required => 0,
                    type     => 'Int',
                },
                vehicle_owner_id => {
                    required => 0,
                    type     => 'Int',
                },
                state_id => {
                    required => 0,
                    type     => 'Int',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                insurance_company_id => {
                    required => 0,
                    type     => 'Int',
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

            not defined $values{$_} and delete $values{$_} for keys %values;

            my $vehicle = $self->update( \%values );

            return $vehicle;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
