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

sub profile : Chained('base') : PathPart('profile') : Args() {
    my ( $self, $c ) = @_;

    my $vehicle_id  = $c->req->params->{vehicle_id};
    my $campaign_id = $c->req->params->{campaign_id};

    my $api = $c->model('API');

    $api->stash_result(
        $c, ['vehicles', $vehicle_id],
        stash => 'vehicle'
    );

    $api->stash_result(
        $c, ['vehicle_routes'],
        params => {
            vehicle_id => $vehicle_id
        }
    );

    $api->stash_result(
        $c, ['vehicle_invitations'],
        params => {
            vehicle_id  => $vehicle_id,
            campaign_id => $campaign_id
        }
    );
    $c->stash->{vehicle_invitation_id} = $c->stash->{vehicle_invitations}[0]{id};

    $api->stash_result(
        $c, ['instalation_kits'],
        params => {
            vehicle_id  => $vehicle_id,
            campaign_id => $campaign_id
        }
    );

    $api->stash_result(
        $c, ['campaign_vehicles'],
        params => {
            vehicle_id  => $vehicle_id,
            campaign_id => $campaign_id
        }
    );
    $c->stash->{campaign_vehicle_id} = $c->stash->{campaign_vehicles}[0]{id};

    if($c->stash->{vehicle}{driver}{documents_validated} && $c->stash->{vehicle_invitations}[0]{status}{id} == 4) {
        $c->stash->{approve} = 1;
    } else {
        $c->stash->{approve} = 0;
    }

    $c->stash->{invitation_status} = $c->stash->{campaign_vehicles}[0]{status}{description};
    $c->stash->{campaign_id} = $campaign_id;
}



__PACKAGE__->meta->make_immutable;

1;