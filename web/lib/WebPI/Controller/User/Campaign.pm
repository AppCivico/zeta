package WebPI::Controller::User::Campaign;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/base') : PathPart('campaign') : CaptureArgs(0) {
}

sub index : Chained('base') : PathPart('') : Args(0) {
}

sub details : Chained('base') : PathPart('details') : Args(1) {
    my ( $self, $c, $campaign_id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, ['campaigns', $campaign_id ], stash => 'campaign' );

    my $s = $c->stash->{campaign};
    use DDP; p $s;
}

__PACKAGE__->meta->make_immutable;

1;