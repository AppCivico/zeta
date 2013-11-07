package PI::Controller::API::VehicleToken;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleToken',
    object_key => 'vehicle_token',

    update_roles => [qw/superadmin user admin-tracker admin/],
    create_roles => [qw/superadmin admin-tracker admin/],
    delete_roles => [qw/superadmin admin-tracker admin/],

    search_ok => {
        vehicle_id => 'Int',
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_tokens') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_token = $c->stash->{vehicle_token};
    my %attrs         = $vehicle_token->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  user_id
                  vehicle_id
                  token
                  /
            ),
            (
                map { $_ => ( $vehicle_token->$_ ? $vehicle_token->$_->datetime : undef ) }
                  qw/created_at used_at alert_sent_at/
            )
        }
    );

}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_token = $c->stash->{vehicle_token};

    $vehicle_token->execute( $c, for => 'update', with => { %{ $c->req->params }, user_id => $c->user->id } );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_token->id ] )->as_string,
        entity => {
            vehicle_id => $vehicle_token->vehicle_id,
            user_id    => $vehicle_token->user_id,
            id         => $vehicle_token->id
        }
      ),
      $c->detach
      if $vehicle_token;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_tokens => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              user_id
                              vehicle_id
                              token
                              created_at
                              used_at
                              alert_sent_at
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

    my $vehicle_token = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, user_id => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_token->id ] )->as_string,
        entity => {
            id    => $vehicle_token->id,
            token => $vehicle_token->token
        }
    );

}

1;
