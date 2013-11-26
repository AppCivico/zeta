package WebPI::Controller::Admin::Form::Campaign;
use Moose;
use namespace::autoclean;
use DateTime;
use JSON::XS;
use utf8;
BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('campaign') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    my $params =  { %{ $c->req->params } };
#     use DDP; p $params;exit;
    my @fields;

    push(@fields, 'valid_from','valid_to');

    $form->format_date( $params, @fields );

    $api->stash_result(
        $c, ['campaigns'],
        stash   => 'campaign',
        method  => 'POST',
        body    => $params
    );

    if ( $c->stash->{'campaign'}{error} ) {

        $c->stash->{error} = $c->stash->{'campaign'}{error};
        $c->stash->{form_error} = $c->stash->{'campaign'}{form_error};

        $c->detach( '/form/redirect_error', [] );

    } else {

        $c->forward('process_associated', [
                {
                    vehicles    => $c->req->params->{vehicles},
                    campaign_id => $c->stash->{campaign}{id}
                }
            ]
        );

    }
}

sub process_edit : Chained('base') : PathPart('campaign') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api     = $c->model('API');
    my $params  =  { %{ $c->req->params } };
    my $form    = $c->model('Form');

    my @fields;

    push(@fields, 'valid_from','valid_to');

    $form->format_date( $params, @fields );

    $api->stash_result(
        $c, [ 'campaigns', $id ],
        method => 'PUT',
        body   => $params
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    } else {
        $c->detach( '/form/redirect_ok', [ '/admin/campaign/index', {}, 'Alterado com sucesso!' ] );
    }
}

sub process_delete : Chained('base') : PathPart('remove_campaign') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $api = $c->model('API');

    $api->stash_result( $c, [ 'campaigns', $id ], method => 'DELETE' );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok', [ '/admin/campaign/index', {}, 'Removido com sucesso!' ] );
    }
}

sub process_associated : Chained('base') :PathPart('process_associated') : Args(0) {
    my ( $self, $c ) = @_;
    use DDP;
    my $api     = $c->model('API');
    my $params  = $c->req->args;
    my @rows;
#     p $params;exit;
    if ( exists $params->[0]{vehicles} ) {
        $params->[0]{vehicles} = [$params->[0]{vehicles}] if ref $params->[0]{vehicles} ne 'ARRAY';
        my $record;

        foreach my $iten (@ { $params->[0]{vehicles } }) {
           p $iten;
           $record = {
                vehicle_id  => $iten,
                campaign_id => $params->[0]{campaign_id},
            };

            push (@rows, $record);
        }
    }

    $api->stash_result(
        $c, 'campaign_vehicles',
        method  => 'POST',
        params    => {
            json => encode_json(\@rows)
        }
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        my $uri;

        $api->stash_result(
            $c, 'invitations',
            params    => {
                campaign_id => $params->[0]{campaign_id}
            }
        );

        if(! scalar @{ $c->stash->{invitations} || [] } ) {
            $uri = $c->uri_for_action(
                '/admin/invitation/add',
                {
                    'campaign_id' => $params->[0]{campaign_id}
                }
            );
        } else {
            $api->stash_result(
                $c,  'invitations/send',
                stash => 'send_invitation',
                params => {
                    associateds => encode_json(\@{ $params->{vehicles} } ),
                    campaign_id => $params->[0]{campaign_id}
                }
            );

            if($c->stash->{send_invitation}{error}) {
                $c->stash->{error} = $c->stash->{send_invitation}{error};
                $c->detach( '/form/redirect_error', [] );
            }

            $uri = $c->uri_for_action(
                '/admin/campaign/index',
                {
                    'campaign_id' => $params->[0]{campaign_id}
                }
            );
        }

        $c->res->redirect( $uri->as_string );
    }
}

sub process_delete_assoc : Chained('base') : PathPart('remove_associated') : Args(0) {
    my ( $self, $c, $association_id ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, ['campaign_vehicles', $c->req->params->{id}],
        method => 'DELETE'
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        $c->detach( '/form/redirect_ok2', [ '/admin/campaign/list_associated',[$c->req->params->{campaign_id}], {}, 'Removido com sucesso!' ] );
    }
}

sub process_activate : Chained('base') : PathPart('activate') : Args(0) {
    my ( $self, $c ) = @_;

    my $api = $c->model('API');

    $api->stash_result(
        $c, [ 'campaign_vehicles', $c->req->params->{campaign_vehicle} ],
        method => 'PUT',
        body => {
            status => $c->req->params->{status}
        }
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }

    $api->stash_result(
        $c, [ 'vehicle_invitations', $c->req->params->{vehicle_invitation} ],
        method => 'PUT',
        body => {
            status => $c->req->params->{status}
        }
    );

    if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', [] );
    }
    else {
        my $message;

        if($c->req->params->{status} == 5) {

            $api->stash_result(
                $c, 'vehicle_tokens',
                method  => 'POST',
                body    => {
                    vehicle_id  => $c->req->params->{vehicle_id},
                    user_id     => $c->req->params->{user_id}
                }
            );

            if ( $c->stash->{error} ) {
                $c->detach( '/form/redirect_error', [] );
            }

            my $now = DateTime->now();
            $api->stash_result(
                $c, 'instalation_kits',
                method  => 'POST',
                body    => {
                    sent_at         => $now,
                    name            => $c->req->params->{name},
                    email           => $c->req->params->{email},
                    vehicle_id      => $c->req->params->{vehicle_id},
                    campaign_id     => $c->req->params->{campaign_id},
                    campaign_name   => $c->req->params->{campaign_name},
                    token           => $c->stash->{vehicle_tokens}{token},
                }
            );

            $message = 'Participação aprovada.';

        } elsif( $c->req->params->{status} == 7  ) {

            $message = 'Participação recusada.';

        }

        if ( $c->stash->{error} ) {
            $c->detach('/form/redirect_error', []);
        }

        $c->detach('/form/redirect_ok2', [ '/admin/campaign/list_associated',[$c->req->params->{campaign_id}], {}, $message ]);
    }
}

__PACKAGE__->meta->make_immutable;

1;