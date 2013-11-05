package WebPI::Controller::Admin::Form::Campaign;
use Moose;
use namespace::autoclean;
use DateTime;
use JSON::XS;
BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/form/base') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub process : Chained('base') : PathPart('campaign') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    my $params =  { %{ $c->req->params } };

    my @fields;

    push(@fields, 'valid_from','valid_to');

    $form->format_date( $params, @fields );

    $api->stash_result(
            $c, ['campaigns'],
            stash => 'campaign',
            method => 'POST',
            body   => $params
    );

    if ( $c->stash->{'campaign'}{error} ) {

        $c->stash->{error} = $c->stash->{'campaign'}{error};
        $c->stash->{form_error} = $c->stash->{'campaign'}{form_error};

        $c->detach( '/form/redirect_error', [] );

    } else {

        my $uri = $c->uri_for_action(
            '/admin/campaign/select_associated',
            {
                'campaign_id' => $c->stash->{campaign}{id}
            }
        );

        $c->res->redirect( $uri->as_string );
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

    my $api     = $c->model('API');
    my $params  = $c->req->params;
    my @rows;

    if ( exists $params->{vehicles} ) {
        $params->{vehicles} = [$params->{vehicles}] if ref $params->{vehicles} ne 'ARRAY';
        my $record;

        foreach my $iten (@ { $params->{vehicles } }) {
           $record = {
                vehicle_id  => $iten,
                campaign_id => $params->{campaign_id},
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
        $api->stash_result(
            $c, 'invitations',
            stash => 'invitations',
            params    => {
                campaign_id => $params->{campaign_id}
            }
        );

        my $uri;
        if(!$c->stash->{invitations}) {
            $uri = $c->uri_for_action(
                '/admin/invitation/add',
                {
                    'campaign_id' => $params->{campaign_id}
                }
            );
        } else {
            $api->stash_result(
                $c,  'invitations/send',
                stash => 'send_invitation',
                params => {
                    associateds => encode_json(\@{ $params->{vehicles} } ),
                    campaign_id => $params->{campaign_id}
                }
            );

            if($c->stash->{send_invitation}{error}) {
                $c->stash->{error} = $c->stash->{send_invitation}{error};
                $c->detach( '/form/redirect_error', [] );
            }

            $uri = $c->uri_for_action(
                '/admin/campaign/index',
                {
                    'campaign_id' => $params->{campaign_id}
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

__PACKAGE__->meta->make_immutable;

1;