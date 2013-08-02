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

=head2 entry_time

  data_type: 'time'
  is_nullable: 0

=head2 departure_time

  data_type: 'time'
  is_nullable: 0

=head2 monthly_payment

  data_type: 'boolean'
  is_nullable: 1

=head2 lat_lng

  data_type: 'point'
  is_nullable: 1

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

=head2 address

  data_type: 'text'
  is_nullable: 1

=head2 is_street

  data_type: 'boolean'
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
  "entry_time",
  { data_type => "time", is_nullable => 0 },
  "departure_time",
  { data_type => "time", is_nullable => 0 },
  "monthly_payment",
  { data_type => "boolean", is_nullable => 1 },
  "lat_lng",
  { data_type => "point", is_nullable => 1 },
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
  "address",
  { data_type => "text", is_nullable => 1 },
  "is_street",
  { data_type => "boolean", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-08-02 18:23:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JN93IP4Ao74Dh/sir2N/IA
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
                entry_time=> {
                    required => 0,
                    type     => TimeStr,
                },
                departure_time=> {
                    required => 0,
                    type     => TimeStr,
                },
                monthly_payment=> {
                    required => 0,
                    type     => 'Bool',
                },
                lat_lng=> {
                    required => 0,
                    type     => 'Str',
                },
                address=> {
                    required => 0,
                    type     => 'Str',
                },
                name=> {
                    required => 0,
                    type     => 'Str',
                },
                is_street=> {
                    required => 0,
                    type     => 'Bool',
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
