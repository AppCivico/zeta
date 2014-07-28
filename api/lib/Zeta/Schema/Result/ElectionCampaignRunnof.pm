use utf8;
package Zeta::Schema::Result::ElectionCampaignRunnof;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::ElectionCampaignRunnof

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

=head1 TABLE: C<election_campaign_runnof>

=cut

__PACKAGE__->table("election_campaign_runnof");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'election_campaign_runnof_id_seq'

=head2 election_campaign_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 candidate_id

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
    sequence          => "election_campaign_runnof_id_seq",
  },
  "election_campaign_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "candidate_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 candidate

Type: belongs_to

Related object: L<Zeta::Schema::Result::Candidate>

=cut

__PACKAGE__->belongs_to(
  "candidate",
  "Zeta::Schema::Result::Candidate",
  { id => "candidate_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 election_campaign

Type: belongs_to

Related object: L<Zeta::Schema::Result::ElectionCampaign>

=cut

__PACKAGE__->belongs_to(
  "election_campaign",
  "Zeta::Schema::Result::ElectionCampaign",
  { id => "election_campaign_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-27 21:21:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q9EBRuLm4VvgCuHcM9SuOw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
