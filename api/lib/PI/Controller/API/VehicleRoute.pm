package PI::Controller::API::VehicleRoute;
use utf8;
use JSON::XS;
use DateTime;
use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::VehicleRoute',
    object_key  => 'vehicle_route',
    result_attr => {
        prefetch => [
            { 'origin' => { 'address' => 'city' } },
            { 'destination' => { 'address' => 'city' } },
        ]
    },

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        vehicle_id => 'Int',
        order      => 'Str'
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_routes') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_route = $c->stash->{vehicle_route};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $vehicle_route->$_ }
                  qw/
                  id
                  name
                  days_of_week
                  start_time_gone
                  start_time_back
                  vehicle_route_polyline
                  vehicle_parking_type_id
                  distance
                  /
            ),
            origin => {
                ( map { $_ => $vehicle_route->origin->$_ } qw/id name/ ),

                address => {
                    (
                        map { $_ => $vehicle_route->origin->address->$_ }
                          qw/
                          id
                          address
                          number
                          neighborhood
                          postal_code
                          lat_lng
                          user_id
                          /
                    ),
                },
            },
            destination => {
                ( map { $_ => $vehicle_route->destination->$_ } qw/id name/ ),

                address => {
                    map { $_ => $vehicle_route->origin->address->$_ }
                      qw/
                      id
                      address
                      number
                      neighborhood
                      postal_code
                      lat_lng
                      user_id
                      /
                }
            },
        }
    );
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $vehicle_route = $c->stash->{vehicle_route};

    $vehicle_route->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_route   = $c->stash->{vehicle_route};
    my $params          = $self->_geo_point($c, $c->req->params);

    $vehicle_route->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_route->id ] )->as_string,
        entity => { vehicle_id => $vehicle_route->vehicle_id, id => $vehicle_route->id }
      ),

      $c->detach
      if $vehicle_route;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c )    = @_;
    my $rs;

    if ( $c->req->params->{check_dow} ) {
        $rs = $c->model('DB::ViewDaysOfWeek');

        my $data = $rs->search_rs(
            undef,
            { bind  => [ $c->req->params->{vehicle_id}, $c->req->params->{vehicle_id} ] }
        )->next;

        $self->status_ok(
            $c,
            entity => {
                dow => $data->get_column('dow')
            }
        );

    } elsif( $c->req->params->{gis_polyline} ) {
        $rs         = $c->model('DB::Vehicle');
        my $filters = $c->req->params;

        my $distance    = $c->req->params->{distance} ? $c->req->params->{distance} : 500;
        my @ids         = $self->_get_assoc_by_region($c, $c->req->params->{gis_polyline}, $distance);

        if(scalar @ids > 0) {
            my @conditions;

            push(@conditions, {
                'me.id' => {
                    '-in'       => \@ids,
                    'not in'    => \"(select vehicle_id from campaign_vehicle)"
                },
            });

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
                push( @conditions, {'me.vehicle_brand_id' => $filters->{brand}} );
            }

            my @result = $rs->search(
                { '-and' => \@conditions },
                {
                    join     => 'driver',
                    group_by =>  'me.id',
                }
            )->as_hashref->all;

            $self->status_ok(
                $c,
                entity => {
                    associateds => [
                        map { +{ id => $_->{id} } } @result
                    ]
                }
            );
        } else {
            $self->status_ok(
                $c,
                entity => {
                    associateds => 0
                }
            );
        }

    } else {

        $self->status_ok(
            $c,
            entity => {
                vehicle_routes => [
                    map {
                        my $r = $_;
                        +{
                            (
                                map { $_ => $r->{$_} }
                                qw/
                                id
                                name
                                start_time_gone
                                start_time_back
                                vehicle_id
                                days_of_week
                                vehicle_route_polyline
                                distance
                                vehicle_parking_type_id
                                /
                            ),
                            origin => {
                                ( map { $_ => $r->{origin}{$_} } qw/id name/ ),

                                address => {
                                    (
                                        map { $_ => $r->{origin}{address}{$_} }
                                        qw/
                                        id
                                        address
                                        number
                                        neighborhood
                                        postal_code
                                        lat_lng
                                        user_id
                                        /
                                    ),
                                    city => {
                                        (
                                            map { $_ => $r->{origin}{address}{city}{$_} } qw /id name/
                                        )
                                    },
                                }
                            },
                            destination => {
                                ( map { $_ => $r->{destination}{$_} } qw/id name/ ),

                                address => {
                                    (
                                        map { $_ => $r->{destination}{address}{$_} }
                                        qw/
                                        id
                                        address
                                        number
                                        neighborhood
                                        postal_code
                                        lat_lng
                                        user_id
                                        /
                                    ),
                                    city => {
                                        (
                                            map { $_ => $r->{destination}{address}{city}{$_} } qw /id name/
                                        )
                                    },
                                }
                            },
                        }
                    } $c->stash->{collection}->as_hashref->all
                ]
            }
        );
    }
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $params = $self->_geo_point($c, $c->req->params);

    my $vehicle_route = $c->stash->{collection}->execute( $c, for => 'create', with => $params );

    $self->status_created(
        $c,
        location    => $c->uri_for( $self->action_for('result'), [ $vehicle_route->id ] )->as_string,
        entity      => {
            id => $vehicle_route->id
        }
    );
}

sub distance_sum : Chained('base') : PathPart('distance_sum') : Args(0) {
    my ($self, $c) = @_;

    my $result = $c->stash->{collection}->search(
        { vehicle_id => $c->req->params->{vehicle_id} },
    );

   $self->status_ok($c, entity => { total_distance => $result->get_column('distance')->sum } );
}

sub _geo_point :Private {
    my ( $self, $c, $params ) = @_;

    my $api         = $c->model('API');
    my $geolocation = $c->model('Geolocation');

    my $orig = $c->model('DB::VehicleRouteType')->search(
        { 'me.id'   => $params->{origin_id} },
        {
            select => ['address.lat_lng'],
            as => ['lat_lng'],
            join    => 'address',
        },
    )->next;

    my $dest = $c->model('DB::VehicleRouteType')->search(
        { 'me.id'   => $params->{destination_id} },
        {
            select => ['address.lat_lng'],
            as => ['lat_lng'],
            join    => 'address',
        },
    )->next;

    my $addr_points = {
        origin      => $orig->get_column('lat_lng'),
        destination => $dest->get_column('lat_lng')
    };

    my $points = $geolocation->geo_by_point($addr_points);

    my @dow     = split(',', $params->{days_of_week});
    my $size    = (scalar @dow)*4;

    $params->{vehicle_route_polyline}   = $points->{polyline};

    my $p = decode_json($points->{polyline});

    $params->{distance}     = (delete  $points->{distance})*$size;
    $params->{gis_polyline} = join ',', map { s/,/ /; $_ } @$p;

    return $params;
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