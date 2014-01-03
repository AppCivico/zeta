use utf8;
package PI::Schema::Result::CampaignPerimeter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::CampaignPerimeter

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

=head1 TABLE: C<campaign_perimeter>

=cut

__PACKAGE__->table("campaign_perimeter");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'campaign_perimeter_id_seq'

=head2 campaign_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 polyline

  data_type: 'text'
  is_nullable: 0

=head2 gis_polyline

  data_type: 'geometry'
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "campaign_perimeter_id_seq",
  },
  "campaign_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "polyline",
  { data_type => "text", is_nullable => 0 },
  "gis_polyline",
  { data_type => "geometry", is_nullable => 1, size => 4 },
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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-23 11:26:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qvl0zufAA2545lZR9Pf4Yw
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr/;

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
                polyline => {
                    required => 0,
                    type     => 'Str',
                },
                gis_polyline => {
                    required    => 0,
                    type        => 'Str',
                    post_check => sub {
                        my $r = shift;

                        return 1 unless $r->get_value('gis_polyline') =~ /^(-?\d{1,3}(\.\d+)? -?\d{1,3}(\.\d+)?,?)+$/;

                        return 1;
                    }
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

            if( $values{gis_polyline} ) {
                my $geo_p   = $values{gis_polyline};
                $geo_p      =~ s/,$//;

                $values{gis_polyline} = \"ST_GeomFromText('LINESTRING($geo_p)', -1)";
            }

            my $campaign_perimeter = $self->update( \%values );

            return $campaign_perimeter;
        },
    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;