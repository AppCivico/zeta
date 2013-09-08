package PI::Controller::API::VehicleBrand;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::VehicleBrand',
    object_key => 'vehicle_brand',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_brands') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_brand = $c->stash->{vehicle_brand};
    my %attrs         = $vehicle_brand->get_inflated_columns;
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

    my $vehicle_brand = $c->stash->{vehicle_brand};

    $vehicle_brand->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_brand->id ] )->as_string,
        entity => { model => $vehicle_brand->name, id => $vehicle_brand->id }
      ),
      $c->detach
      if $vehicle_brand;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $vehicle_brand = $c->stash->{vehicle_brand};

    $vehicle_brand->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            vehicle_brands => [
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

    my $vehicle_brand = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_brand->id ] )->as_string,
        entity => {
            name => $vehicle_brand->name,
            id   => $vehicle_brand->id
        }
    );

}

1;
