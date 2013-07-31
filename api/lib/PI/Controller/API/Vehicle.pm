package PI::Controller::API::Vehicle;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default      => 'application/json',

    result       => 'DB::Vehicle',
    object_key   => 'vehicle',

    update_roles => [qw/superadmin client/],
    create_roles => [qw/superadmin client/],
    delete_roles => [qw/superadmin client/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicles') : CaptureArgs(0) {}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {}

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') {}

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle  = $c->stash->{vehicle};
    my %attrs = $vehicle->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            map { $_ => $attrs{$_}, } qw(id model car_plate)
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{vehicle};

    $vehicle->execute( $c, for => 'update', with => {%{$c->req->params}, created_by => $c->user->id} );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle->id ] )->as_string,
        entity => { name => $vehicle->name, id => $vehicle->id }
      ),
      $c->detach
      if $vehicle;
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $vehicle = $c->stash->{vehicle};
    $self->status_gone( $c, message => 'deleted' ), $c->detach
      unless $vehicle->id;

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
           vehicles => [
                map {
                    my $r = $_;
                    +{
                        (map { $_ => $r->{$_} } qw/
                            id
                            name
                            renavam
                            cpf
                            car_plate
                            doors_number
                            manufacture_year
                            model
                            model_year
                            brand_name
                            car_type
                            km
                            color
                            fuel_type
                            chassi
                            crv
                            observations
                            created_at
                        /),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{collection}->execute( $c, for => 'create', with => {%{$c->req->params}, created_by => $c->user->id});

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle->id ] )->as_string,
        entity => {
            name  => $vehicle->name,
            id    => $vehicle->id
        }
    );

}

1;
