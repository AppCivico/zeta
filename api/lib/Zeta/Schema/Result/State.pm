use utf8;
package Zeta::Schema::Result::State;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::State

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

=head1 TABLE: C<state>

=cut

__PACKAGE__->table("state");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'state_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 uf

  data_type: 'text'
  is_nullable: 0

=head2 country_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  is_nullable: 1

=head2 created_by

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "state_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "uf",
  { data_type => "text", is_nullable => 0 },
  "country_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_at",
  { data_type => "timestamp", is_nullable => 1 },
  "created_by",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 cep_caches

Type: has_many

Related object: L<Zeta::Schema::Result::CepCache>

=cut

__PACKAGE__->has_many(
  "cep_caches",
  "Zeta::Schema::Result::CepCache",
  { "foreign.state_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cities

Type: has_many

Related object: L<Zeta::Schema::Result::City>

=cut

__PACKAGE__->has_many(
  "cities",
  "Zeta::Schema::Result::City",
  { "foreign.state_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 country

Type: belongs_to

Related object: L<Zeta::Schema::Result::Country>

=cut

__PACKAGE__->belongs_to(
  "country",
  "Zeta::Schema::Result::Country",
  { id => "country_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 election_campaigns

Type: has_many

Related object: L<Zeta::Schema::Result::ElectionCampaign>

=cut

__PACKAGE__->has_many(
  "election_campaigns",
  "Zeta::Schema::Result::ElectionCampaign",
  { "foreign.state_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 electoral_regional_courts

Type: has_many

Related object: L<Zeta::Schema::Result::ElectoralRegionalCourt>

=cut

__PACKAGE__->has_many(
  "electoral_regional_courts",
  "Zeta::Schema::Result::ElectoralRegionalCourt",
  { "foreign.state_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 promises

Type: has_many

Related object: L<Zeta::Schema::Result::Promise>

=cut

__PACKAGE__->has_many(
  "promises",
  "Zeta::Schema::Result::Promise",
  { "foreign.state_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-25 20:18:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hEWrirwU83Wr6evdS9DTkg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
