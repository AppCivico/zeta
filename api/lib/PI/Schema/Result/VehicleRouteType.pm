use utf8;
package PI::Schema::Result::VehicleRouteType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::VehicleRouteType

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

=head1 TABLE: C<vehicle_route_type>

=cut

__PACKAGE__->table("vehicle_route_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vehicle_route_type_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 address_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "vehicle_route_type_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "address_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<vehicle_route_type_address_id_key>

=over 4

=item * L</address_id>

=back

=cut

__PACKAGE__->add_unique_constraint("vehicle_route_type_address_id_key", ["address_id"]);

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

=head2 vehicle_route_destinations

Type: has_many

Related object: L<PI::Schema::Result::VehicleRoute>

=cut

__PACKAGE__->has_many(
  "vehicle_route_destinations",
  "PI::Schema::Result::VehicleRoute",
  { "foreign.destination_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle_route_origins

Type: has_many

Related object: L<PI::Schema::Result::VehicleRoute>

=cut

__PACKAGE__->has_many(
  "vehicle_route_origins",
  "PI::Schema::Result::VehicleRoute",
  { "foreign.origin_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-09-12 14:00:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q5eChx5liEZpmorgM5DKcw

with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::InflateAsHashRef';

use Data::Verifier;

sub verifiers_specs {
    my $self = shift;
    return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                name => {
                    required    => 0,
                    type        => 'Str',
                },
                address_id => {
                    required    => 0,
                    type        => 'Int',
                }
            }
        )
    };
}

sub action_specs {
    my $self = shift;
    return {
        update => sub {
            my %values = shift->valid_values;

            not defined $values{$_} and delete $values{$_} for keys %values;

            my $vehicle_route_type = $self->update( \%values );

            return $vehicle_route_type;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;