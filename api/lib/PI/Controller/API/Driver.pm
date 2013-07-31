package PI::Controller::API::Driver;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::Driver',
    result_cond => { 'user.active' => 1 },
    result_attr => { prefetch => 'user' },
    object_key  => 'driver',

    update_roles => [qw/superadmin/],
    create_roles => [qw/superadmin webapi/],
    delete_roles => [qw/superadmin/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('drivers') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $driver = $c->stash->{driver};

    my %attrs = $driver->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            email => $driver->user->email,
            ( map { $_ => ($driver->$_ ? $driver->$_->datetime : undef) }  qw/birth_date first_driver_license cnh_validity/ ),
            map { $_ => $attrs{$_}, } qw(
                id
                name
                last_name

                cpf
                cnh_code
                mobile_provider
                mobile_number
                telephone_number
                marital_state
                address
                neighborhood
                complement
                number

                postal_code
            )
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

    $driver->user->update( { active => 0 } );

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    $self->status_ok(
        $c,
        entity => {
            drivers => [
                map {
                    my $r = $_;
                    +{
                        (map { $_ => $r->{$_} } qw/
                            id
                            name
                            last_name
                            birth_date
                            cpf
                            cnh_code

                            mobile_provider
                            mobile_number
                            telephone_number
                        /),

                        email                => $r->{user}{email},

                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
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
            name => $driver->name,
            id   => $driver->id
        }
    );

}

1;
