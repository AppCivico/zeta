use utf8;
package PI::Schema::Result::VehicleRoute;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::VehicleRoute

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

=head1 TABLE: C<vehicle_route>

=cut

__PACKAGE__->table("vehicle_route");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vehicle_route_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 start_time_gone

  data_type: 'time'
  is_nullable: 1

=head2 start_time_back

  data_type: 'time'
  is_nullable: 1

=head2 origin

  data_type: 'text'
  is_nullable: 1

=head2 origin_lat_lng

  data_type: 'point'
  is_nullable: 1

=head2 destination

  data_type: 'text'
  is_nullable: 1

=head2 destination_lat_lng

  data_type: 'point'
  is_nullable: 1

=head2 vehicle_id

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
    sequence          => "vehicle_route_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "start_time_gone",
  { data_type => "time", is_nullable => 1 },
  "start_time_back",
  { data_type => "time", is_nullable => 1 },
  "origin",
  { data_type => "text", is_nullable => 1 },
  "origin_lat_lng",
  { data_type => "point", is_nullable => 1 },
  "destination",
  { data_type => "text", is_nullable => 1 },
  "destination_lat_lng",
  { data_type => "point", is_nullable => 1 },
  "vehicle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-07-23 18:27:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GaBuP0AEv5PyE903CEKXIA

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
                 name=> {
                    required => 0,
                    type     => 'Str',
                },
                start_time_gone=> {
                    required => 0,
                    type     => TimeStr,
                },
                start_time_back=> {
                    required => 0,
                    type     => TimeStr,
                },
                origin=> {
                    required => 0,
                    type     => 'Str',
                },
                origin_lat_lng=> {
                    required => 0,
                    type     => 'Str',
                },
                destination=> {
                    required => 0,
                    type     => 'Str',
                },
                destination_lat_lng=> {
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

            my $vehicle_route = $self->update( \%values );

            return $vehicle_route;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
