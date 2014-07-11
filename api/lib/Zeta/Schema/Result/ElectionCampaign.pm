use utf8;
package Zeta::Schema::Result::ElectionCampaign;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::ElectionCampaign

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

=head1 TABLE: C<election_campaign>

=cut

__PACKAGE__->table("election_campaign");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'election_campaign_id_seq'

=head2 year

  data_type: 'integer'
  is_nullable: 0

=head2 state_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 country_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 political_position_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 elected_candidate_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 is_active

  data_type: 'boolean'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "election_campaign_id_seq",
  },
  "year",
  { data_type => "integer", is_nullable => 0 },
  "state_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "country_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "political_position_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "elected_candidate_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "is_active",
  { data_type => "boolean", is_nullable => 1 },
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

Related object: L<Zeta::Schema::Result::City>

=cut

__PACKAGE__->belongs_to(
  "city",
  "Zeta::Schema::Result::City",
  { id => "city_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 coalitions

Type: has_many

Related object: L<Zeta::Schema::Result::Coalition>

=cut

__PACKAGE__->has_many(
  "coalitions",
  "Zeta::Schema::Result::Coalition",
  { "foreign.election_campaign_id" => "self.id" },
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
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 elected_candidate

Type: belongs_to

Related object: L<Zeta::Schema::Result::Candidate>

=cut

__PACKAGE__->belongs_to(
  "elected_candidate",
  "Zeta::Schema::Result::Candidate",
  { id => "elected_candidate_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 election_campaign_candidates

Type: has_many

Related object: L<Zeta::Schema::Result::ElectionCampaignCandidate>

=cut

__PACKAGE__->has_many(
  "election_campaign_candidates",
  "Zeta::Schema::Result::ElectionCampaignCandidate",
  { "foreign.election_campaign_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 political_position

Type: belongs_to

Related object: L<Zeta::Schema::Result::PoliticalPosition>

=cut

__PACKAGE__->belongs_to(
  "political_position",
  "Zeta::Schema::Result::PoliticalPosition",
  { id => "political_position_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 promises

Type: has_many

Related object: L<Zeta::Schema::Result::Promise>

=cut

__PACKAGE__->has_many(
  "promises",
  "Zeta::Schema::Result::Promise",
  { "foreign.election_campaign_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 state

Type: belongs_to

Related object: L<Zeta::Schema::Result::State>

=cut

__PACKAGE__->belongs_to(
  "state",
  "Zeta::Schema::Result::State",
  { id => "state_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-10 18:22:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zT1ePhQv0a1VXQPOar/B8A
with 'Zeta::Role::Verification';
with 'Zeta::Role::Verification::TransactionalActions::DBIC';
with 'Zeta::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use Zeta::Types qw /DataStr TimeStr/;

sub verifiers_specs {
    my $self = shift;
     return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                year => {
                    required => 0,
                    type     => 'Int',
                },
                state_id => {
                    required => 0,
                    type     => 'Int',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                country_id => {
                    required => 0,
                    type     => 'Int',
                },
                political_position_id => {
                    required => 0,
                    type     => 'Int',
                },
                elected_candidate_id => {
                    required => 0,
                    type     => 'Int',
                },
                is_active => {
                    required => 0,
                    type     => 'Bool'
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

            my $election_campaign = $self->update( \%values );

            return $election_campaign;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
