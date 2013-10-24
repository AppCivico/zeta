package PI::Controller::API::Campaign;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::Campaign',
    object_key  => 'campaign',
    result_attr => { prefetch =>  'customer' },

    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('campaigns') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $campaign = $c->stash->{campaign};

    my %attrs = $campaign->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw(
                id
                name
                status
                customer_id
                )
             ),
             (
                map { $_ => ( $campaign->$_ ? $campaign->$_->datetime : undef ) }
                qw/created_at activated_at valid_to valid_from/
            ),
            customer => {
                (
                    map { $_ => $campaign->customer->$_ }
                        qw/
                        id
                        fancy_name
                        corporate_name
                        email
                        cnpj
                        /
                ),
            },
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $campaign = $c->stash->{campaign};

    $campaign->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $campaign->id ] )->as_string,
        entity => { customer_id => $campaign->customer_id, id => $campaign->id }
      ),

      $c->detach if $campaign;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $campaign = $c->stash->{campaign};

    my $vehicles = $c->model('DB::CampaignVehicle')->search({campaign_id => $campaign->id});
    $vehicles->delete;
    $campaign->update( { status => 3 } );

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    $self->status_ok(
        $c,
        entity => {
            campaigns => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                name
                                status
                                customer_id
                                created_at activated_at
                                valid_to
                                valid_from
                              /
                        ),
                        customer => {
                            (
                                map { $_ => $r->{customer}{$_}  }
                                    qw/
                                    id
                                    fancy_name
                                    corporate_name
                                    email
                                    cnpj
                                    /
                            ),
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

    my $campaign = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $campaign->id ] )->as_string,
        entity => {
            customer_id => $campaign->customer_id,
            name        => $campaign->name,
            id          => $campaign->id
        }
    );

}

1;