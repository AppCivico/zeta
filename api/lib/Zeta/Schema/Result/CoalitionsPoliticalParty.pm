use utf8;
package Zeta::Schema::Result::CoalitionsPoliticalParty;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::CoalitionsPoliticalParty

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

=head1 TABLE: C<coalitions_political_parties>

=cut

__PACKAGE__->table("coalitions_political_parties");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'coalitions_political_parties_id_seq'

=head2 coalition_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 political_party_id

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
    sequence          => "coalitions_political_parties_id_seq",
  },
  "coalition_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "political_party_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 coalition

Type: belongs_to

Related object: L<Zeta::Schema::Result::Coalition>

=cut

__PACKAGE__->belongs_to(
  "coalition",
  "Zeta::Schema::Result::Coalition",
  { id => "coalition_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 political_party

Type: belongs_to

Related object: L<Zeta::Schema::Result::PoliticalParty>

=cut

__PACKAGE__->belongs_to(
  "political_party",
  "Zeta::Schema::Result::PoliticalParty",
  { id => "political_party_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-24 11:13:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JfxIv7lcmAP3hzE4eSH0Dg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
