use utf8;
package Zeta::Schema::Result::Candidate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::Candidate

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

=head1 TABLE: C<candidate>

=cut

__PACKAGE__->table("candidate");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'candidate_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: 'text'
  is_nullable: 1

=head2 phone

  data_type: 'text'
  is_nullable: 1

=head2 img_profile

  data_type: 'text'
  is_nullable: 1

=head2 political_party_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vice

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "candidate_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "text", is_nullable => 1 },
  "phone",
  { data_type => "text", is_nullable => 1 },
  "img_profile",
  { data_type => "text", is_nullable => 1 },
  "political_party_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vice",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 election_campaign_candidates

Type: has_many

Related object: L<Zeta::Schema::Result::ElectionCampaignCandidate>

=cut

__PACKAGE__->has_many(
  "election_campaign_candidates",
  "Zeta::Schema::Result::ElectionCampaignCandidate",
  { "foreign.candidate_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 election_campaigns

Type: has_many

Related object: L<Zeta::Schema::Result::ElectionCampaign>

=cut

__PACKAGE__->has_many(
  "election_campaigns",
  "Zeta::Schema::Result::ElectionCampaign",
  { "foreign.elected_candidate_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 promises

Type: has_many

Related object: L<Zeta::Schema::Result::Promise>

=cut

__PACKAGE__->has_many(
  "promises",
  "Zeta::Schema::Result::Promise",
  { "foreign.candidate_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-05 18:38:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3Ub2Yf3yeIuCcmLIPssQ6A

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
                name => {
                    required => 0,
                    type     => 'Str',
                },
                email => {
                    required => 0,
                    type     => 'Str',
                },
                phone => {
                    required => 0,
                    type     => 'Str',
                },
                img_profile => {
                    required => 0,
                    type     => 'Str',
                },
                political_party_id => {
                    required => 0,
                    type     => 'Int',
                },
                vice => {
					required 	=> 0,
					type		=> 'Str'
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

            my $candidate = $self->update( \%values );

            return $candidate;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
