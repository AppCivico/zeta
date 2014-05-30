package PI::Controller::API::Reports;
use utf8;
use JSON::XS;
use DateTime;
use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::VehicleRoute',
    object_key  => 'vehicle_route',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],
);

sub base : Chained('/api/base') : PathPart('reports') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub drivers_by_region: Chained('base') : PathPart('drivers-by-region') : Args(0) {
    my ( $self, $c ) = @_;
    my $rs;
 
	my $filters = $c->req->params;
	$rs         = $c->model('DB::Vehicle');
	
	my $distance	= $c->req->params->{distance} ? $c->req->params->{distance} : 0;
	my @ids         = $self->_get_assoc_by_region($c, $c->req->params->{gis_polyline}, $distance);
	
	if( scalar @ids > 0 ) {
		my @conditions;

		my $campaign_filter = undef;
		if( $c->req->params->{active_campaign} eq 's' ) {
			$campaign_filter = { 'in'    => \"(select vehicle_id from campaign_vehicle where status <> 3)" };
		} elsif ( $c->req->params->{active_campaign} eq 'n' ) {
			$campaign_filter = { 'not in'    => \"(select vehicle_id from campaign_vehicle where status <> 3)" };
		}
		
		if($campaign_filter) {
			push(@conditions, {
				'vehicle.id' => {
					'-in'       => \@ids,
					$campaign_filter ? { %$campaign_filter } : undef
				},
			});
		} else {
			push(@conditions, {
				'vehicle.id' => {
					'-in'       => \@ids
				},
			});
		}

		if( $filters->{gender} ) {
			push(@conditions, {'driver.gender' => $filters->{gender}});
		}

		if( $filters->{start_age} && $filters->{end_age} ) {
			my $now     = DateTime->now();
			my $start   = $now->clone->subtract( years => $filters->{start_age} );
			my $end     = $now->clone->subtract( years => $filters->{end_age} );

			push(@conditions, {
				'driver.birth_date' => {
					'-between' =>
					[
						$end->format_cldr( 'yyyy-M-d' ),
						$start->format_cldr( 'yyyy-M-d' )
					]
				}
			});
		}

		if( $filters->{brand} ) {
			push( @conditions, {'vehicle.vehicle_brand_id' => $filters->{brand}} );
		}

		my @result = $c->model('DB::VehicleRoute')->search(
			{ '-and' => \@conditions },
			{
				select 	=> [ 
					{ sum => 'me.distance' },
					'user.name',
					'user.email',
					'vehicle.id'
				],
				as		=> ['total', 'name', 'email', 'vehicle_id'],
				join	=> [
					{'vehicle', {'driver' => 'user'} }
				],
				group_by => [
					
					'user.name',
					'user.email',
					'vehicle.id'
				],
				order_by => 'user.name'
			}
		)->as_hashref->all;

		if(@result) {
			$self->status_ok(
				$c,
				entity => { associateds => \@result }
			);
		} else {
			$self->status_ok(
				$c,
				entity => { associateds => 0 }
			);
		}
		
	} else {
		$self->status_ok(
			$c,
			entity => {
				associateds => 0
			}
		);
	}
}

sub _get_assoc_by_region :Private {
    my ($self, $c, $params, $distance) = @_;

    my @where = $self->_build_params($c, $params);

    my @rs = $c->model('DB::VehicleRoute')->search(
        { '-or' => \@where },
        {
            columns     => ['vehicle_id'],
            group_by    => ['vehicle_id'],
            having      => \[ 'sum(distance) >= ?', [ sum => $distance ] ]
        }
    )->all;

    my @ids;

    foreach(@rs) {
        push(@ids, $_->get_column('vehicle_id'));
    }

    return @ids;
}

sub _build_params :Private {
    my ($self, $c, $params) = @_;

    my @where;

    $params = [$params] unless ref $params eq 'ARRAY';

    foreach my $item (@{ $params}) {
        push  @where, \['ST_Intersects(gis_polyline, ?::geometry)', "LINESTRING($item)"];
    }

    return @where;
}

1;