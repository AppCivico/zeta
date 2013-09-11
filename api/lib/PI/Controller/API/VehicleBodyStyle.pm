package PI::Controller::API::VehicleBodyStyle;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleBodyStyle',
    object_key => 'vehicle_body_style',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_body_styles') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_body_style = $c->stash->{vehicle_body_style};
    my %attrs              = $vehicle_body_style->get_inflated_columns;
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

    my $vehicle_body_style = $c->stash->{vehicle_body_style};

    $vehicle_body_style->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_body_style->id ] )->as_string,
        entity => { model => $vehicle_body_style->name, id => $vehicle_body_style->id }
      ),
      $c->detach
      if $vehicle_body_style;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $vehicle_body_style = $c->stash->{vehicle_body_style};

    $vehicle_body_style->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_body_styles => [
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

    my $vehicle_body_style = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_body_style->id ] )->as_string,
        entity => {
            name => $vehicle_body_style->name,
            id   => $vehicle_body_style->id
        }
    );

}

1;
