package WebPI::Controller::User::Form::Campaign;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/user/form/base') : PathPart('campaign') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api  = $c->model('API');

    $api->stash_result(
        $c, ['campaign_vehicles'],
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
        my $message;
        if( $c->req->params->{status} == 1 ) {
           $message = 'Campanha aceita com sucesso';
        } else {
            $message = 'Campanha recusada. Você não participará desta campanha.';
        }

        $c->detach( '/form/redirect_ok', [ '/user/invitation', {}, $message ] );
    }
}

__PACKAGE__->meta->make_immutable;

1;
