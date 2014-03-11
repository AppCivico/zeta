use utf8;
package PI::Schema::Result::TrackerFirmwareInformation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::TrackerFirmwareInformation

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

=head1 TABLE: C<tracker_firmware_information>

=cut

__PACKAGE__->table("tracker_firmware_information");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tracker_firmware_information_id_seq'

=head2 version

  data_type: 'numeric'
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=head2 status

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 private_path

  data_type: 'text'
  is_nullable: 1

=head2 version_hash

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tracker_firmware_information_id_seq",
  },
  "version",
  { data_type => "numeric", is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
  "status",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "private_path",
  { data_type => "text", is_nullable => 1 },
  "version_hash",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 status

Type: belongs_to

Related object: L<PI::Schema::Result::StatusDescription>

=cut

__PACKAGE__->belongs_to(
  "status",
  "PI::Schema::Result::StatusDescription",
  { id => "status" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2014-03-10 16:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DZ38GjbSSl+hpMjda2KZug
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
                version => {
                    required => 0,
                    type     => 'Num'
                },
                status => {
                    required => 0,
                    type     => 'Int'
                },
                private_path => {
                    required => 0,
                    type     => 'Str'
                },
                version_hash => {
                    required => 0,
                    type     => 'Str'
                },
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

            my $firmware = $self->update( \%values );

            return $firmware;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;