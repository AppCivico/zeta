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

        $api->stash_result( $c, 'cities' );
        $api->stash_result( $c, 'states' );

        $c->stash->{select_cities} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ];
        $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];

        $c->stash->{main_view} = 'parts/new_vehicle.tt';
    }elsif ( @{ $c->stash->{vehicle_routes} ||[] } == 0 ) {

        $c->stash->{cadastro_incompleto} = 1;

        $api->stash_result( $c, 'cities' );
        $api->stash_result( $c, 'states' );

        $c->stash->{select_cities} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ];
        $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];

        $c->stash->{main_view} = 'parts/new_route.tt';
    }elsif ( @{ $c->stash->{vehicle_parking} ||[] } == 0 ) {

        $c->stash->{cadastro_incompleto} = 1;

        $api->stash_result( $c, 'cities' );
        $api->stash_result( $c, 'states' );

        $c->stash->{select_cities} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ];
        $c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];

        $c->stash->{main_view} = 'parts/new_parking.tt';
    }

}

sub index : Chained('object') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

__PACKAGE__->meta->make_immutable;

1;
