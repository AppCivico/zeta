package PI::Controller::API::Driver;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default      => 'application/json',

    result       => 'DB::Driver',
    object_key   => 'driver',

    update_roles => [qw/superadmin/],
    create_roles => [qw/superadmin/],
    delete_roles => [qw/superadmin/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('drivers') : CaptureArgs(0) {}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {}

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') {}

sub result_GET {
    my ( $self, $c ) = @_;

    my $driver  = $c->stash->{driver};
    my %attrs = $driver->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            map { $_ => $attrs{$_}, } qw(id name email)
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $driver = $c->stash->{driver};

    $driver->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $driver->id ] )->as_string,
        entity => { name => $driver->name, id => $driver->id }
      ),
      $c->detach
      if $driver;
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $driver = $c->stash->{driver};
    $self->status_gone( $c, message => 'deleted' ), $c->detach
      unless $driver->active;

    $driver->update( { active => 0 } );

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            users => [
                map {
                    +{
                        name        => $_->{name},
                        last_name   => $_->{last_name},
                        email       => $_->{email},
                        birth_date            =>  $_->{birth_date},
                        cpf                   => $_->{cpf},
                        first_driver_license  => $_->{first_driver_license},
                        cnh_code              => $_->{cnh_code},
                        cnh_validity          => $_->{cnh_validity},
                        mobile_provider       => $_->{mobile_provider},
                        mobile_number         => $_->{mobile_number},
                        telephone_number      => $_->{telephone_number},
                        marital_state         => $_->{marital_state},
                        address               => $_->{address},
                        neighborhood          => $_->{neighborhood},
                        complement            => $_->{complement},
                        number                => $_->{number},
                        postal_code           => $_->{postal_code},
                        url         => $c->uri_for_action( $self->action_for('result'), [ $_->{id} ] )->as_string
                    }
                  } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $driver = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $driver->id ] )->as_string,
        entity => {
            name  => $driver->name,
            id    => $driver->id
        }
    );

}

1;
