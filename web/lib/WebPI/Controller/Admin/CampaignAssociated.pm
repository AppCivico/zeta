package WebPI::Controller::Admin::CampaignAssociated;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('campaign_associated') : CaptureArgs(0) {
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');
    $api->stash_result( $c, [ 'campaign_associateds', $id ], stash => 'campaign_associated_obj' );

    $c->detach( '/form/not_found', [] ) if $c->stash->{campaign_associated_obj}{error};
}

sub profile : Chained('base') : PathPart('profile') : Args(1) {
    my ( $self, $c, $vehicle_id ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, ['vehicles', $vehicle_id],
        stash => 'vehicle'
    );

    my $vehicle = $c->stash->{vehicle};
    use DDP; p $vehicle;

}



__PACKAGE__->meta->make_immutable;

1;