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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-07-23 11:21:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zQNN/RessU5NUX0OsGlD5g
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
                    required => 1,
                    type     => TimeStr,
                },
                name=> {
                    required => 0,
                    type     => 'Str',
                },
                last_name=> {
                    required => 0,
                    type     => 'Str',
                },
                birth_date=> {
                    required => 0,
                    type     => DataStr,
                },
                cpf=> {
                    required => 0,
                    type     => 'Str',
                },
                bank_code=> {
                    required => 0,
                    type     => 'Str',
                },
                bank_ag=> {
                    required => 0,
                    type     => 'Str',
                },
                bank_cc=> {
                    required => 0,
                    type     => 'Str',
                },
                telephone_number=> {
                    required => 0,
                    type     => 'Str',
                },
                mobile_provider=> {
                    required => 0,
                    type     => 'Str',
                },
                mobile_number=> {
                    required => 0,
                    type     => 'Str',
                },
                address=> {
                    required => 0,
                    type     => 'Str',
                },
                city_id=> {
                    required => 0,
                    type     => 'Int',
                },
                neighborhood=> {
                    required => 0,
                    type     => 'Str',
                },
                complement=> {
                    required => 0,
                    type     => 'Str',
                },
                number=> {
                    required => 0,
                    type     => 'Str',
                },
                postal_code=> {
                    required => 0,
                    type     => 'Str',
                },
                created_by=> {
                    required => 0,
                    type     => 'Int',
                }
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

            my $vehicle_owner = $self->update( \%values );

            return $vehicle_owner;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
