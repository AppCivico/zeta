use utf8;
package PI::Schema::Result::CampaignPaymentRange;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::CampaignPaymentRange

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

=head1 TABLE: C<campaign_payment_range>

=cut

__PACKAGE__->table("campaign_payment_range");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'campaign_payment_range_id_seq'

=head2 campaign_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 range

  data_type: 'numeric'
  is_nullable: 0

=head2 value

  data_type: 'numeric'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "campaign_payment_range_id_seq",
  },
  "campaign_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "range",
  { data_type => "numeric", is_nullable => 0 },
  "value",
  { data_type => "numeric", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 campaign

Type: belongs_to

Related object: L<PI::Schema::Result::Campaign>

=cut

__PACKAGE__->belongs_to(
  "campaign",
  "PI::Schema::Result::Campaign",
  { id => "campaign_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-16 15:46:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fWZ1ieqLQFPuae5LZBCPIw
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;

sub verifiers_specs {
    my $self = shift;
     return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                campaign_id => {
                    required => 0,
                    type     => 'Int',
                },
                range => {
                    required => 0,
                    type     => 'Num',
                },
                value => {
                    required => 0,
                    type     => 'Num',
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

            my $campaign_payment_range = $self->update( \%values );

            return $campaign_payment_range;
        },
    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
