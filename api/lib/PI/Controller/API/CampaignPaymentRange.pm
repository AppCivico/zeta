package PI::Controller::API::CampaignPaymentRange;

use Moose;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::CampaignPaymentRange',
    object_key  => 'campaign_payment_range',
    search_ok => {
        campaign_id => 'Int',
        order       => 'Str'
    },

    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],
);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('campaign_payment_ranges') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $campaign_payment_range  = $c->stash->{campaign_payment_range};
    my %attrs                   = $campaign_payment_range->get_inflated_columns;

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw(
                id
                campaign_id
                range
                value
                )
            ),
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $campaign_payment_range;

    $campaign_payment_range = $c->stash->{campaign_payment_range};

    $campaign_payment_range->execute( $c, for => 'update', with => $c->req->params );

    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $campaign_payment_range->id ] )->as_string,
        entity => { campaign_id => $campaign_payment_range->campaign_id, id => $campaign_payment_range->id }
      ),

      $c->detach if $campaign_payment_range;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $campaign_payment_range = $c->stash->{campaign_payment_range};

    $campaign_payment_range->delete;

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}



sub list_GET {
    my ( $self, $c ) = @_;
    $self->status_ok(
        $c,
        entity => {
            campaign_payment_ranges => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                campaign_id
                                value
                                range
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

    my $pa = $c->req->params;
    use DDP; p $pa; exit;
#     #percorrer array para popular tabela
#     foreach my $iten ( %{ $c->req->params }) {
#
#         my $range = {
#             campaign_id      => $iten->{vehicle}{id},
#             invitation_id   => $invitation->id,
#             sent_at         => $date
#         };
#
#         push(@vehicle_list,  $vehicle_data);
#     }
#
#     my $campaign_payment_range = $c->model('DB::CampaignPaymentRange')->populate(\@ranges);
#
#    use DDP; p $campaign_payment_range;exit;
#
#     $self->status_created(
#         $c,
#         location => $c->uri_for( $self->action_for('result'), [ $campaign_payment_range->id ] )->as_string,
#         entity => {
#             id          => $campaign_payment_range->id,
#             campaign_id => $campaign_payment_range->campaign_id,
#             value       => $campaign_payment_range->value,
#             range       => $campaign_payment_range->range
#         }
#     );

}

1;