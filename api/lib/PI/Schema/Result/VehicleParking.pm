use utf8;
package PI::Schema::Result::VehicleParking;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::VehicleParking

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

=head1 TABLE: C<vehicle_parking>

=cut

__PACKAGE__->table("vehicle_parking");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vehicle_parking_id_seq'

=head2 arrival_time

  data_type: 'time'
  is_nullable: 0

=head2 departure_time

  data_type: 'time'
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

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 address_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vehicle_parking_type_id

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
    sequence          => "vehicle_parking_id_seq",
  },
  "arrival_time",
  { data_type => "time", is_nullable => 0 },
  "departure_time",
  { data_type => "time", is_nullable => 0 },
  "vehicle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "address_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vehicle_parking_type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<vehicle_parking_address_id_key>

=over 4

=item * L</address_id>

=back

=cut

__PACKAGE__->add_unique_constraint("vehicle_parking_address_id_key", ["address_id"]);

=head1 RELATIONS

=head2 address

Type: belongs_to

Related object: L<PI::Schema::Result::Address>

=cut

__PACKAGE__->belongs_to(
  "address",
  "PI::Schema::Result::Address",
  { id => "address_id" },
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

=head2 vehicle_parking_type

Type: belongs_to

Related object: L<PI::Schema::Result::VehicleParkingType>

=cut

__PACKAGE__->belongs_to(
  "vehicle_parking_type",
  "PI::Schema::Result::VehicleParkingType",
  { id => "vehicle_parking_type_id" },
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
  { "foreign.vehicle_parking_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-09-12 15:31:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JQy4SFoP11J3VjGfHO7BbA
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
                arrival_time=> {
                    required => 0,
                    type     => TimeStr,
                },
                departure_time=> {
                    required => 0,
                    type     => TimeStr,
                },
                address_id=> {
                    required => 0,
                    type     => 'Int',
                },
                name=> {
                    required => 0,
                    type     => 'Str',
                },
                vehicle_parking_type_id=> {
                    required => 0,
                    type     => 'Int',
                },
            }
        ),
    };
}

sub action_specs {
    my $self = shift;
    return {
        update => sub {
            my %values = shift->valid_values;

            not defined $values{$_} and delete $values{$_} for keys %values;

            my $vehicle_parking = $self->update( \%values );

            return $vehicle_parking;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
