use utf8;
package Zeta::Schema::Result::Coalition;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::Coalition

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

=head1 TABLE: C<coalition>

=cut

__PACKAGE__->table("coalition");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'coalition_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 election_campaign_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

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
    sequence          => "coalition_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "election_campaign_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
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

=head2 coalitions_political_parties

Type: has_many

Related object: L<Zeta::Schema::Result::CoalitionsPoliticalParty>

=cut

__PACKAGE__->has_many(
  "coalitions_political_parties",
  "Zeta::Schema::Result::CoalitionsPoliticalParty",
  { "foreign.coalition_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 election_campaign

Type: belongs_to

Related object: L<Zeta::Schema::Result::ElectionCampaign>

=cut

__PACKAGE__->belongs_to(
  "election_campaign",
  "Zeta::Schema::Result::ElectionCampaign",
  { id => "election_campaign_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-14 16:29:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9KUKrky7c7uXe1VWDCn+hQ

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
                election_campaign_id => {
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

            my $coalition = $self->update( \%values );

            return $coalition;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
