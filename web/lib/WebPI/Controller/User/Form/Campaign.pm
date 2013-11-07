package WebPI::Controller::User::Form::Campaign;
use Moose;
use utf8;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('campaign') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api  = $c->model('API');

    $api->stash_result(
        $c, ['campaign_vehicles', $id],
        method  => 'PUT',
        body    => {
            status          => $c->req->params->{status},
            vehicle_id      => $c->stash->{vehicles}[0]{id},
            campaign_id     => $c->req->params->{campaign_id},
            update_status   => 1
        }
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {

        $api->stash_result(
            $c, 'vehicle_invitations',
            params => {
                invitation_id   => $c->req->params->{invitation_id},
                vehicle_id      => $c->stash->{vehicles}[0]{id}
            }
        );

        $api->stash_result(
            $c, ['vehicle_invitations', $c->stash->{vehicle_invitations}[0]{id}],
            method  => 'PUT',
            body    => {
                status => $c->req->params->{status}
            }
        );

        if ( $c->stash->{error} ) {
            $c->detach( '/form/redirect_error', [] );
        }

        my $message;
        if( $c->req->params->{status} != 4  ) {
           $message = 'Campanha aceita com sucesso';
        } else {
            $message = 'Campanha recusada. Você não participará desta campanha.';
        }

        $c->detach( '/form/redirect_ok', [ '/user/invitation/index', {}, $message ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
