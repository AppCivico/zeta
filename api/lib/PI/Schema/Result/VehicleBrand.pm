use utf8;
package PI::Schema::Result::VehicleBrand;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::VehicleBrand

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

=head1 TABLE: C<vehicle_brand>

=cut

__PACKAGE__->table("vehicle_brand");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vehicle_brand_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 fipe_id

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "vehicle_brand_id_seq",
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
  "fipe_id",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 vehicle_models

Type: has_many

Related object: L<PI::Schema::Result::VehicleModel>

=cut

__PACKAGE__->has_many(
  "vehicle_models",
  "PI::Schema::Result::VehicleModel",
  { "foreign.vehicle_brand_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicles

Type: has_many

Related object: L<PI::Schema::Result::Vehicle>

=cut

__PACKAGE__->has_many(
  "vehicles",
  "PI::Schema::Result::Vehicle",
  { "foreign.vehicle_brand_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-09-10 15:13:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iAJx/Rva1KaZfzl1Nf51jQ
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use PI::Types qw /DataStr/;

sub verifiers_specs {
    my $self = shift;
    return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                name => {
                    required => 0,
                    type     => 'Str',
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

            my $vehicle_brand = $self->update( \%values );

            return $vehicle_brand;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;