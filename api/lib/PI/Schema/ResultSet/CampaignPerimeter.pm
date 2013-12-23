package PI::Schema::ResultSet::CampaignPerimeter;
use namespace::autoclean;

use utf8;
use Moose;
use JSON::XS;
use String::Util ':all';

extends 'DBIx::Class::ResultSet';
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::InflateAsHashRef';

use Data::Verifier;

sub verifiers_specs {
    my $self = shift;
    return {
        create => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                polyline => {
                    required => 1,
                    type     => 'Str',
                },
                gis_polyline => {
                    required    => 0,
                    type        => 'Str',
                    post_check  => sub {
                        my $r = shift;

                        return 1 unless $r->get_value('gis_polyline') =~ /^(-?\d{1,3}(\.\d+)? -?\d{1,3}(\.\d+)?,?)+$/;

                        return 1;
                    }
                },
                campaign_id => {
                    required    => 1,
                    type        => 'Int'
                }
            }
        )
    };
}

sub action_specs {
    my $self = shift;

    return {
        create => sub {
            my %values = shift->valid_values;

            if( $values{gis_polyline} ) {
                my $geo_p   = $values{gis_polyline};
                $geo_p      =~ s/,$//;

                $values{gis_polyline} = \"ST_GeomFromText('LINESTRING($geo_p)', -1)";
            }

            my $campaign_perimeter = $self->create( \%values );

            return $campaign_perimeter;
        }
    };
}

1;