use utf8;
package Zeta::Schema::Result::Promise;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Zeta::Schema::Result::Promise

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

=head1 TABLE: C<promise>

=cut

__PACKAGE__->table("promise");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'promise_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 election_campaign_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 candidate_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created_by

  data_type: 'integer'
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 source

  data_type: 'text'
  is_nullable: 1

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 state_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 country_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "promise_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "category_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "election_campaign_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "candidate_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_by",
  { data_type => "integer", is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "source",
  { data_type => "text", is_nullable => 1 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "state_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "country_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
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

=head2 category

Type: belongs_to

Related object: L<Zeta::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "Zeta::Schema::Result::Category",
  { id => "category_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

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

=head2 promise_contents

Type: has_many

Related object: L<Zeta::Schema::Result::PromiseContent>

=cut

__PACKAGE__->has_many(
  "promise_contents",
  "Zeta::Schema::Result::PromiseContent",
  { "foreign.promise_id" => "self.id" },
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


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-25 20:18:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8fJrtw3/d+L7dEMffn9KtQ
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
                description => {
                    required => 0,
                    type     => 'Str',
                },
                category_id => {
                    required => 0,
                    type     => 'Int',
                },
                election_campaign_id => {
                    required => 0,
                    type     => 'Int',
                },
                candidate_id => {
                    required => 0,
                    type     => 'Int',
                },
                created_by => {
                    required => 0,
                    type     => 'Int',
                },
                source => {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
					required => 0,
                    type     => 'Int',
                },
                state_id => {
					required => 0,
                    type     => 'Int',
                },
                country_id => {
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

            my $promise = $self->update( \%values );

            return $promise;
        }
    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
