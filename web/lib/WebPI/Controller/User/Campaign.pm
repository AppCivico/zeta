package WebPI::Controller::User::Campaign;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('campaign') : CaptureArgs(0) {
}

sub index : Chained('base') : PathPart('') : Args(0) {
}

sub details : Chained('base') : PathPart('details') : Args(2) {
    my ( $self, $c, $campaign_id, $invitation_id ) = @_;

    my $api = $c->model('API');

    $c->stash->{invitation_id} = $invitation_id;

    $api->stash_result( $c, ['campaigns', $campaign_id ], stash => 'campaign' );

    $api->stash_result(
        $c, 'campaign_vehicles',
        params => {
            campaign_id => $campaign_id,
            vehicle_id  => $c->stash->{vehicles}[0]{id}
        }
    );

    $api->stash_result(
        $c, 'documents',
        params => {
            user_id => $c->user->id,
            count   => 1
        }
    );

    my $documents_check = scalar @{$c->stash->{documents}} ;

    if($documents_check != 3) {
        $c->stash->{document_check} = 1;
    } else {
        $c->stash->{document_check} = 0;
    }
}

__PACKAGE__->meta->make_immutable;

1;