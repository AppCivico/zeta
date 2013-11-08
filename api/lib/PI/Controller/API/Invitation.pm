package PI::Controller::API::Invitation;

use Moose;
use DateTime;
use JSON::XS;
BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::Invitation',
    object_key  => 'invitation',
    search_ok   => {
        campaign_id => 'Int'
    },
    result_attr => { prefetch =>  { 'campaign' => 'customer' } },

    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('invitations') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $invitation = $c->stash->{invitation};

    my %attrs = $invitation->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw(
                id
                title
                content
                )
             ),
             (
                map { $_ => ( $invitation->$_ ? $invitation->$_->datetime : undef ) }
                qw/created_at/
            ),
            campaign => {
                (
                    map { $_ => $invitation->campaign->$_ }
                        qw/
                        id
                        name
                        /
                ),
                customer => {
                    map { $_ => $invitation->campaign->customer->$_ }
                        qw/
                        id
                        fancy_name
                        corporate_name
                        cnpj
                        /
                }
            },
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $invitation = $c->stash->{invitation};

    $invitation->execute( $c, for => 'update', with => $c->req->params );

    $self->_send_invitation($c, $invitation);

    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $invitation->id ] )->as_string,
        entity => { customer_id => $invitation->campaign->id, id => $invitation->id }
      ),

      $c->detach if $invitation;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $invitation = $c->stash->{invitation};

    $invitation->delete;

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    $self->status_ok(
        $c,
        entity => {
            invitations => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                                qw/
                                 id
                                 title
                                 content
                                 created_at
                                /
                        ),
                        campaign => {
                            (
                                map { $_ => $r->{campaign}{$_} }
                                    qw/
                                     id
                                     name
                                    /
                            ),
                            customer => {
                                map { $_ => $r->{campaign}{customer}{$_} }
                                    qw/
                                     id
                                     fancy_name
                                     corporate_name
                                     cnpj
                                    /
                            },
                        },
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $invitation = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );
    use DDP; p $invitation;
    eval { $self->_send_invitation($c, $invitation); };
    die $@ if $@;

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $invitation->id ] )->as_string,
        entity => {
            customer_id => $invitation->campaign->id,
            name        => $invitation->title,
            id          => $invitation->id
        }
    );

}

sub _send_invitation :Private {
    my ( $self, $c, $invitation, $assoc ) = @_;

    my $api         = $c->model('API');
    my $email_model = $c->model('EmailQueue');
    my $condition;

    if($assoc) {
        $condition = { 'in' => $assoc };
    } else {
        $condition = { 'not in' => \"(select vehicle_id from vehicle_invitation)" };
    }
    use DDP; p $condition;
    my @associateds = $c->model('DB::CampaignVehicle')->search(
            {
                campaign_id     => $invitation->campaign_id,
                'vehicle.id'    => $condition
            },
            {
                join    => ['vehicle', { 'vehicle' => { 'driver' => 'user' } } ],
                columns => [qw/user.name user.email vehicle.id/]
            }
        )->as_hashref->all;
    p @associateds;
    my @vehicle_list;
    my $vehicle_data;
    my $date = DateTime->now();

    foreach my $iten (@associateds) {
        $email_model->add(
            email     => $iten->{user}{email},
            name      => $iten->{user}{name},
            content   => $invitation->content,
            subject   => $invitation->title,
            template  => 'invitation.tt',
            queue_key => 'email'
        );

        $vehicle_data = {
            vehicle_id      => $iten->{vehicle}{id},
            invitation_id   => $invitation->id,
            sent_at         => $date
        };

        push(@vehicle_list,  $vehicle_data);
    }

    my $vehicle_invitations = $c->model('DB::VehicleInvitation')->populate(\@vehicle_list);
    use DDP; p $vehicle_invitations;
    return $vehicle_invitations;
}

sub send_invitation_public : Chained('base') : PathPart('send') : Args(0) {
    my ( $self, $c ) = @_;

    my $api         = $c->model('API');
    my $associateds = decode_json($c->req->params->{associateds});

    my $invitation = $c->model('DB::Invitation')->search(
        {
            campaign_id => $c->req->params->{campaign_id}
        }
    )->next;

    my $entity =  $self->_send_invitation($c, $invitation, $associateds) ;

    my @invitations;
    foreach my $i (@$entity) {
        push(@invitations,  {
                'id'         => $i->id,
                'vehicle_id' => $i->vehicle_id,
                'sent_at'    => $i->sent_at->datetime
            }
        );
    }

    $self->status_ok($c, entity => { rows => \@invitations } );
}

1;