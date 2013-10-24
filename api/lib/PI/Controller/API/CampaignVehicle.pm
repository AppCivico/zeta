package PI::Controller::API::CampaignVehicle;

use Moose;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::CampaignVehicle',
    object_key  => 'campaign_vehicle',
    search_ok => {
        campaign_id => 'Int',
        order       => 'Str'
    },
    result_attr => {
        prefetch =>
            {
                'vehicle' =>  { 'driver' => 'user' }
            }
    },
    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],
);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('campaign_vehicles') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $campaign_vehicle = $c->stash->{campaign_vehicle};
    my %attrs = $campaign_vehicle->get_inflated_columns;

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw(
                id
                vehicle_id
                campaign_id
                status
                )
             ),
            vehicle => {
                ( map { $_ => $campaign_vehicle->vehicle->$_ } qw/id/ ),

                driver => {
                    (
                        map { $_ => $campaign_vehicle->vehicle->driver->$_ }
                          qw/
                          id
                          name
                          /
                    ),
                    user => {
                        ( map { $_ => $campaign_vehicle->vehicle->driver->user->$_ } qw/id email/ ),
                    }
                },
            },
             (
                map { $_ => ( $campaign_vehicle->$_ ? $campaign_vehicle->$_->datetime : undef ) }
                qw/created_at/
            ),
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $campaign_vehicle = $c->stash->{campaign_vehicle};

    $campaign_vehicle->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $campaign_vehicle->id ] )->as_string,
        entity => { vehicle_id_id => $campaign_vehicle->vehicle_id, id => $campaign_vehicle->id }
      ),

      $c->detach if $campaign_vehicle;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $campaign_vehicle = $c->stash->{campaign_vehicle};

    $campaign_vehicle->delete;

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}



sub list_GET {
    my ( $self, $c ) = @_;
    $self->status_ok(
        $c,
        entity => {
            campaign_vehicles => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                vehicle_id
                                campaign_id
                                status
                              /
                        ),
                        vehicle => {
                            ( map { $_ => $r->{vehicle}{$_} } qw/id/ ),
                            driver => {
                                (
                                    map { $_ => $r->{vehicle}{driver}{$_} }
                                    qw/
                                    id
                                    name
                                    /
                                ),
                                user => {
                                    ( map { $_ => $r->{vehicle}{driver}{user}{$_} } qw/id email/ ),
                                }
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

    my $campaign_vehicle    = $c->stash->{collection};
    my $params              = decode_json($c->req->params->{json});

    $campaign_vehicle->populate($params);

#   todo: trocar por status 200 ok
    $self->status_no_content($c);
}

1;