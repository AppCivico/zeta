use utf8;
package PI::Schema::Result::Document;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Document

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

=head1 TABLE: C<document>

=cut

__PACKAGE__->table("document");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'document_id_seq'

=head2 class_name

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 public_url

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 private_path

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 validated_at

  data_type: 'timestamp'
  is_nullable: 1

=head2 validated_by

  data_type: 'integer'
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
    sequence          => "document_id_seq",
  },
  "class_name",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "public_url",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "private_path",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "validated_at",
  { data_type => "timestamp", is_nullable => 1 },
  "validated_by",
  { data_type => "integer", is_nullable => 1 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:53T7x6v/DG7zrjkQ5JJVMQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
