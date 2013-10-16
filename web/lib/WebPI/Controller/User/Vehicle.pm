package WebPI::Controller::User::Vehicle;
use Moose;
use namespace::autoclean;
use DateTime;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('vehicle') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, 'states' );
    $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];

    $api->stash_result( $c, 'vehicle_colors' );
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

}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'vehicles', $id ], stash => 'vehicle_obj' );

    $c->detach( '/form/not_found', [] ) if $c->stash->{vehicle_obj}{error};
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;
}

sub edit : Chained('object') : PathPart('') : Args(0) {
}

__PACKAGE__->meta->make_immutable;

1;
