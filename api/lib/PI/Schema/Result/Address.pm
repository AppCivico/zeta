use utf8;
package PI::Schema::Result::Address;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Address

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

=head1 TABLE: C<address>

=cut

__PACKAGE__->table("address");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'address_id_seq'

=head2 address

  data_type: 'text'
  is_nullable: 0

=head2 number

  data_type: 'text'
  is_nullable: 0

=head2 neighborhood

  data_type: 'text'
  is_nullable: 1

=head2 postal_code

  data_type: 'integer'
  is_nullable: 1

=head2 lat_lng

  data_type: 'point'
  is_nullable: 1

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 complement

  data_type: 'text'
  is_nullable: 1

=head2 city_id

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
    sequence          => "address_id_seq",
  },
  "address",
  { data_type => "text", is_nullable => 0 },
  "number",
  { data_type => "text", is_nullable => 0 },
  "neighborhood",
  { data_type => "text", is_nullable => 1 },
  "postal_code",
  { data_type => "integer", is_nullable => 1 },
  "lat_lng",
  { data_type => "point", is_nullable => 1 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "complement",
  { data_type => "text", is_nullable => 1 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
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
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drivers

Type: has_many

Related object: L<PI::Schema::Result::Driver>

=cut

__PACKAGE__->has_many(
  "drivers",
  "PI::Schema::Result::Driver",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user

Type: belongs_to

Related object: L<PI::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "PI::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 vehicle_parking

Type: might_have

Related object: L<PI::Schema::Result::VehicleParking>

=cut

__PACKAGE__->might_have(
  "vehicle_parking",
  "PI::Schema::Result::VehicleParking",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_route_type

Type: might_have

Related object: L<PI::Schema::Result::VehicleRouteType>

=cut

__PACKAGE__->might_have(
  "vehicle_route_type",
  "PI::Schema::Result::VehicleRouteType",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-11-28 10:28:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:g2pstfzASahWFC4nuTn4Cg

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
                address => {
                    required => 0,
                    type     => 'Str',
                },
                number => {
                    required => 0,
                    type     => 'Str',
                },
                neighborhood => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code => {
                    required => 0,
                    type     => 'Str',
                },
                lat_lng => {
                    required => 0,
                    type     => 'Str',
                },
                user_id => {
                    required => 0,
                    type     => 'Int',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                complement => {
                    required => 0,
                    type     => 'Str',
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

            my $address = $self->update( \%values );

            return $address;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;