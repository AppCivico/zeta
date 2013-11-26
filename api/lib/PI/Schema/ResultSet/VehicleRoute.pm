package PI::Schema::ResultSet::VehicleRoute;
use namespace::autoclean;

use utf8;
use Moose;
use JSON::XS;
use String::Util ':all';
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr TimeStr/;
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
                name => {
                    required => 1,
                    type     => 'Str',
                },
                start_time_gone => {
                    required => 0,
                    type     => TimeStr,
                },
                start_time_back => {
                    required => 0,
                    type     => TimeStr,
                },
                origin_id => {
                    required => 1,
                    type     => 'Int',
                },
                destination_id => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_id => {
                    required => 1,
                    type     => 'Int',
                },
                vehicle_parking_type_id => {
                    required => 1,
                    type     => 'Int',
                },
                days_of_week => {
                    required   => 0,
                    type       => 'Str',
                    post_check => sub {
                        my $r = shift;

                        return 0 unless $r->get_value('days_of_week') =~ /^[1-7](,[1-7]){0,6}$/;

                        return 1;
                      }
                },
                vehicle_route_polyline => {
                    required    => 0,
                    type        => 'Str',
                },
                gis_polyline => {
                    required    => 0,
                    type        => 'Str',
                    post_check => sub {
                        my $r = shift;

                        return 1 unless $r->get_value('gis_polyline') =~ /^(-?\d{1,3}(\.\d+)? -?\d{1,3}(\.\d+)?,?)+$/;

                        return 1;
                    }
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

            if ( $values{days_of_week} ) {
                my @days = split /,/, $values{days_of_week};
                $values{days_of_week} = \@days;
            }

            if( $values{gis_polyline} ) {
                my $geo_p   = $values{gis_polyline};
                $geo_p      =~ s/,$//;

                $values{gis_polyline} = \"ST_GeomFromText('LINESTRING($geo_p)', -1)";
            }

            my $vehicle_route = $self->create( \%values );

            return $vehicle_route;
        }
    };
}

1;
