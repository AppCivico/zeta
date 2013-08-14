package PI::Controller::API::Tracker;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::Tracker',
    object_key => 'tracker',

    update_roles => [qw/superadmin admin-tracker/],
    create_roles => [qw/superadmin admin-tracker/],
    delete_roles => [qw/superadmin admin-tracker/],

    search_ok => {
        vehicle_id => 'Int',
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('trackers') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $tracker = $c->stash->{tracker};
    my %attrs   = $tracker->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  code
                  vehicle_id
                  status
                  /
            ),
            ( map { $_ => $tracker->$_->datetime } qw/created_at/ )
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $tracker = $c->stash->{tracker};

    $tracker->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $tracker = $c->stash->{tracker};

    $tracker->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $tracker->id ] )->as_string,
        entity => { vehicle_id => $tracker->vehicle_id, id => $tracker->id }
      ),
      $c->detach
      if $tracker;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    if($c->req->params->{available}) {
        $rs->search({
            status => 'ativo'
        });
    }

    $self->status_ok(
        $c,
        entity => {
            trackers => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              code
                              vehicle_id
                              status
                              created_at
                              /
                        )
                      }
                } $rs->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $tracker = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $tracker->id ] )->as_string,
        entity => {
            id => $tracker->id
        }
    );

}

1;
