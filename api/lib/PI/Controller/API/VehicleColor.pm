package PI::Controller::API::VehicleColor;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleColor',
    object_key => 'vehicle_color',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        order => 'Str'
    }

);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_colors') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_color = $c->stash->{vehicle_color};
    my %attrs         = $vehicle_color->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw(
                  id
                  name
                  )
            ),
            ( map { $_ => ( $attrs{$_} ? $attrs{$_}->datetime : undef ) } qw/created_at/ ),

        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_color = $c->stash->{vehicle_color};

    $vehicle_color->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_color->id ] )->as_string,
        entity => { model => $vehicle_color->name, id => $vehicle_color->id }
      ),
      $c->detach
      if $vehicle_color;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $vehicle_color = $c->stash->{vehicle_color};

    $vehicle_color->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_colors => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              name
                              created_at
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

    my $vehicle_color = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_color->id ] )->as_string,
        entity => {
            name => $vehicle_color->name,
            id   => $vehicle_color->id
        }
    );

}

1;
