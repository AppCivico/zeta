package WebPI::Controller::User::Dashboard;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('dashboard') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    my $api = $c->model('API');

    if ( @{ $c->stash->{vehicles} } == 0 ) {

        $c->stash->{cadastro_incompleto} = 1;
        $c->stash->{main_view}           = 'parts/new_vehicle.tt';

    }
    elsif ( @{ $c->stash->{vehicle_routes} || [] } == 0 ) {

        $c->stash->{cadastro_incompleto} = 1;
        $c->stash->{main_view}           = 'parts/new_route.tt';

        my $controller = $c->controller('User::Route');

        $controller->add($c);

    }
    elsif ( @{ $c->stash->{vehicle_parking} || [] } == 0 ) {

        $c->stash->{cadastro_incompleto} = 1;
        $c->stash->{main_view}           = 'parts/new_parking.tt';

    }

    $api->stash_result( $c, 'states' );
    $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];
    $api->stash_result(
        $c,
        'vehicle_colors',
        params => {
            order => 'name'
        }
    );
    $c->stash->{select_colors} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_colors} } ];

    $api->stash_result( $c, 'vehicle_body_styles' );
    $c->stash->{select_body_styles} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_body_styles} } ];

    $api->stash_result( $c, 'vehicle_brands' );
    $c->stash->{select_brands} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_brands} } ];

    my $year       = DateTime->now;
    my $first_year = $year->year - 3;
    my @year_range;
    my %vehicle_years;

    $year_range[0] = $first_year;
    $vehicle_years{ $year_range[0] } = $first_year;

    for ( my $i = 1 ; $i < 6 ; $i++ ) {
        $year_range[$i] = $year_range[ $i - 1 ] + 1;
        $vehicle_years{ $year_range[$i] } = $year_range[$i];
    }

    $c->stash->{vehicle_years} = [ map { [ $_, $vehicle_years{$_} ] } sort keys %vehicle_years ];

    $api->stash_result(
        $c,
        'vehicle_parking_types',
        params => {
            order => 'name'
        }
    );
    $c->stash->{select_parking_types} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{vehicle_parking_types} } ];
}

sub index : Chained('object') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

__PACKAGE__->meta->make_immutable;

1;
