package PI::Controller::API::InstalationKit;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleToken',
    object_key => 'instalation_kit',

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],

    search_ok => {
        vehicle_id => 'driver_id',
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('instalation_kits') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $instalation_kit = $c->stash->{instalation_kit};
    my %attrs         = $instalation_kit->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  driver_id
                  status
                  token
                  /
            ),
            (
                map { $_ => ( $instalation_kit->$_ ? $instalation_kit->$_->datetime : undef ) }
                  qw/created_at sent_at used_at/
            )
        }
    );

}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $instalation_kit = $c->stash->{instalation_kit};

    $instalation_kit->execute( $c, for => 'update', with => { %{ $c->req->params }, user_id => $c->user->id } );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $instalation_kit->id ] )->as_string,
        entity => {
            driver_id => $instalation_kit->driver_id
            id         => $instalation_kit->id
        }
      ),
      $c->detach
      if $instalation_kit;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            instalation_kits => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              driver_id
                              token
                              created_at
                              used_at
                              sent_at
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      },
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $instalation_kit = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, user_id => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $instalation_kit->id ] )->as_string,
        entity => {
            id    => $instalation_kit->id,
            token => $instalation_kit->token
        }
    );

}

1;
