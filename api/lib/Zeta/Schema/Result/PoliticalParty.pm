use utf8;
package Zeta::Schema::Result::PoliticalParty;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::PoliticalParty

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

=head1 TABLE: C<political_party>

=cut

__PACKAGE__->table("political_party");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'political_party_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 acronym

  data_type: 'text'
  is_nullable: 0

=head2 status

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 party_number

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "political_party_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "acronym",
  { data_type => "text", is_nullable => 0 },
  "status",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "party_number",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 candidates

Type: has_many

Related object: L<Zeta::Schema::Result::Candidate>

=cut

__PACKAGE__->has_many(
  "candidates",
  "Zeta::Schema::Result::Candidate",
  { "foreign.political_party_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 coalitions_political_parties

Type: has_many

Related object: L<Zeta::Schema::Result::CoalitionsPoliticalParty>

=cut

__PACKAGE__->has_many(
  "coalitions_political_parties",
  "Zeta::Schema::Result::CoalitionsPoliticalParty",
  { "foreign.political_party_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-25 17:00:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1sJmi0/j5eqAxcYshKyDEg
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
                acronym => {
                    required => 0,
                    type     => 'Str',
                },
                status => {
                    required => 0,
                    type     => 'Int',
                },
                party_number => {
                    required => 0,
                    type     => 'Int',
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

            my $political_party = $self->update( \%values );

            return $political_party;
        }
    };
}
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
