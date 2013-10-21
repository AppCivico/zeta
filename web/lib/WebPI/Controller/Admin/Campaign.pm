package WebPI::Controller::Admin::Campaign;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('campaign') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result( $c, [ 'campaigns', $id ], stash => 'campaign_obj' );

    $c->detach( '/form/not_found', [] ) if $c->stash->{campaign_obj}{error};
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, ['campaigns'] );
}

sub edit : Chained('object') : PathPart('') : Args(0) {
}

sub add : Chained('base') : PathPart('new') : Args(0) {
}

sub search_customer : Chained('base') : PathPart('search_customer') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    my $params = {
        order => 'fancy_name'
    };

    if ($c->req->params->{search}) {
        $params->{name} = $c->req->params->{search};
    }

    $api->stash_result(
        $c, 'customers',
        params => $params
    );

    $c->stash->{without_wrapper} = 1;
}

sub select_associated : Chained('base') : PathPart('select_associated') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, 'vehicles',
    );

    $c->stash->{campaign_id} = $c->req->params->{campaign_id};
}

sub list_associated : Chained('base') : PathPart('list_associated') : Args(1) {
    my ( $self, $c, $campaign_id) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, 'campaign_vehicles',
        params => {
            campaign_id => $campaign_id
        }
    );

    $c->stash->{campaign_id} = $c->req->params->{campaign_id};
}

__PACKAGE__->meta->make_immutable;

1;