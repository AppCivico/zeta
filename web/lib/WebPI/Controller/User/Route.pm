package WebPI::Controller::User::Route;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('route') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result( $c, [ 'vehicle_routes', $id ], stash => 'vehicle_route_obj' );

    $c->detach( '/form/not_found', [] ) if $c->stash->{vehicle_route_obj}{error};

    for my $field (qw /start_time_gone start_time_back/) {
        $c->stash->{vehicle_route_obj}{$field} =
          substr( $c->stash->{vehicle_route_obj}{$field}, 0, -3 );    # tira os segundos
    }

    my @dow = @{ $c->stash->{vehicle_route_obj}{days_of_week} || [] };
    $c->stash->{dow}{$_} = 'active' for @dow;

}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

}

sub edit : Chained('object') : PathPart('') : Args(0) {
}

sub add : Chained('base') : PathPart('new') : Args(0) {
    my ( $self, $c ) = @_;

    if (exists $c->req->params->{dest_time} && $c->req->params->{dest_time} =~ /^[0-9]{4}$/){
        $c->stash->{orig_time} = $c->req->params->{dest_time};
        substr($c->stash->{orig_time}, 2, 0) = ':';

        $c->stash->{orig_id} = $c->req->params->{destino};
    }

    $c->stash->{step} = $c->stash->{orig_id} ? 2 : 1;

    if (exists $c->req->params->{finalizado}) {
        my $api = $c->model('API');

        my @routes;
        my %chosen = map { $_ => 1 } split /-/, $c->req->params->{rotas};
        foreach my $r (@{$c->stash->{vehicle_routes}}) {
            push @routes, $r if exists $chosen{$r->{id}};
        }
        $c->stash->{routes} = \@routes;

        $api->stash_result(
            $c, [ 'vehicle_routes',  ],
            stash => 'vehicle_route_list'
        );

        $c->stash->{step} = 3;
        $c->stash->{finalizado} = 1;

    } elsif ($c->stash->{step} == 2) {
        $c->stash->{cadastro_incompleto} = 1;
    }

}

__PACKAGE__->meta->make_immutable;

1;
