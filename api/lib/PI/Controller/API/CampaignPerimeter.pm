package PI::Controller::API::CampaignPerimeter;

use Moose;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::CampaignPerimeter',
    object_key  => 'campaign_perimeter',
    search_ok => {
        campaign_id => 'Int',
    },

    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],
);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('campaign_perimeters') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $campaign_perimeter = $c->stash->{campaign_perimeter};
    my %attrs = $campaign_perimeter->get_inflated_columns;

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw(
                id
                campaign_id
                polyline
                gis_polyline
                )
            ),
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $campaign_perimeter = $c->stash->{campaign_perimeter};

    $campaign_perimeter->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $campaign_perimeter->id ] )->as_string,
        entity => { model => $campaign_perimeter->campaign_id }
    ),
    $c->detach
    if $campaign_perimeter;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $campaign_perimeter = $c->stash->{campaign_perimeter};

    $campaign_perimeter->delete;

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    $self->status_ok(
        $c,
        entity => {
            campaign_perimeters => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                polyline
                                gis_polyline
                                campaign_id
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;
    use DDP;
    my $params = decode_json($c->req->params->{json});

    foreach my $item ( @{ $params } ) {
        my $campaign_perimeter = $c->stash->{collection}->execute( $c, for => 'create', with => $item );
    }

    $self->status_no_content($c);

#     $self->status_created(
#         $c,
#         location    => $c->uri_for( $self->action_for('result'), [ $campaign_perimeter->id ] )->as_string,
#         entity      => {
#             campaign_id => $campaign_perimeter->campaign_id,
#             id          => $campaign_perimeter->id
#         }
#     );
}

1;