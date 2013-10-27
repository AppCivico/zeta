package PI::Controller::API::VehicleInvitation;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::VehicleInvitation',
    object_key  => 'vehicle_invitation',
    result_attr => {
        prefetch => {
            'invitation' => {
                'campaign' => 'customer'
                }
            }
    },

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        vehicle_id => 'Int',
      }

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_invitations') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_invitation = $c->stash->{vehicle_invitation};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $vehicle_invitation->$_ }
                  qw/
                   id
                   vehicle_id
                  /
            ),
            ( map { $_ => ( $vehicle_invitation->$_ ? $vehicle_invitation->$_->datetime : undef ) } qw/sent_at created_at/ ),
            invitation => {
                (
                    map { $_ => $vehicle_invitation->invitation->$_ } qw/id title/
                ),
                campaign => {
                    (
                        map { $_ => $vehicle_invitation->invitation->campaign->$_ }
                        qw/id name/
                    ),
                    (
                        map { $_ => ( $vehicle_invitation->invitation->campaign ? $vehicle_invitation->invitation->campaign->$_->datetime : undef ) }
                        qw/valid_to valid_from/
                    ),
                    customer => {
                        (
                            map { $_ => $vehicle_invitation->invitation->campaign->customer->$_ }
                                qw/
                                id
                                corporate_name
                                cnpj
                                /
                        )
                    },
                },
            }
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_invitation = $c->stash->{vehicle_invitation};

    $vehicle_invitation->execute( $c, for => 'update', with => { %{ $c->req->params }, created_by => $c->user->id } );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_invitation->id ] )->as_string,
        entity => { model => $vehicle_invitation->vehicle_invitation_model_id, id => $vehicle_invitation->id }
      ),
      $c->detach
      if $vehicle_invitation;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $vehicle_invitation = $c->stash->{vehicle_invitation};

    $vehicle_invitation->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    my $rs = $c->stash->{collection};

    if($c->req->params->{available_user}) {
        $rs = $rs->search({
            'me.id' => {'not in' => \"(select vehicle_invitation_id from campaign_vehicle_invitation)"}
        });
    }

    $self->status_ok(
        $c,
        entity => {
            vehicle_invitations => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              vehicle_id
                              created_at
                              sent_at
                              /
                        ),
                        invitation => {
                            ( map { $_ => $r->{invitation}{$_} } qw/id title/ ),
                            campaign => {
                                (
                                    map { $_ => $r->{invitation}{campaign}{$_} }
                                    qw/
                                    id
                                    name
                                    valid_from
                                    valid_to
                                    /
                                ),
                                customer => {
                                    (
                                        map { $_ => $r->{invitation}{campaign}{customer}{$_} }
                                        qw/
                                            id
                                            corporate_name
                                            cnpj
                                        /
                                    )
                                }
                            }
                        },
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string,
                      }
                } $rs->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle_invitation = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_invitation->id ] )->as_string,
        entity => {
            model     => $vehicle_invitation->vehicle_invitation_model_id,
            id        => $vehicle_invitation->id,
            car_plate => $vehicle_invitation->car_plate
        }
    );
}

1;