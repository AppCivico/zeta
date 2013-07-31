package PI::Controller::API::VehicleOwner;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default      => 'application/json',

    result       => 'DB::VehicleOwner',
    object_key   => 'vehicle_owner',

    update_roles => [qw/superadmin client/],
    create_roles => [qw/superadmin client/],
    delete_roles => [qw/superadmin client/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('vehicle_owners') : CaptureArgs(0) {}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {}

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') {}

sub result_GET {
    my ( $self, $c ) = @_;

    my $vehicle_owner  = $c->stash->{vehicle_owner};
    my %attrs = $vehicle_owner->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (map { $_ => $attrs{$_}, }
            qw/
                id
                email
                name
                last_name
                birth_date
                cpf
                bank_code
                bank_ag
                bank_cc
                telephone_number
                mobile_provider
                mobile_number
                address
                state
                city
                neighborhood
                complement
                number
                postal_code
                created_at
            /),
            ( map { $_ => $vehicle_owner->$_->datetime }  qw/birth_date created_at/ )

        }
    );

}

sub result_DELETE {
    my ($self, $c) = @_;
    my $vehicle_owner = $c->stash->{vehicle_owner};

    $vehicle_owner->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $vehicle_owner = $c->stash->{vehicle_owner};

    $vehicle_owner->execute( $c, for => 'update', with => {%{$c->req->params}, created_by => $c->user->id});
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_owner->id ] )->as_string,
        entity => { name => $vehicle_owner->name, id => $vehicle_owner->id }
      ),
      $c->detach
      if $vehicle_owner;
}


sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
           vehicle_owners => [
                map {
                    my $r = $_;
                    +{
                        (map { $_ => $r->{$_} } qw/
                            id
                            email
                            name
                            last_name
                            birth_date
                            cpf
                            bank_code
                            bank_ag
                            bank_cc
                            telephone_number
                            mobile_provider
                            mobile_number
                            address
                            state
                            city
                            neighborhood
                            complement
                            number
                            postal_code
                            created_at
                            birth_date
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

    my $vehicle_owner = $c->stash->{collection}->execute( $c, for => 'create', with => {%{$c->req->params}, created_by => $c->user->id});

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle_owner->id ] )->as_string,
        entity => {
            name  => $vehicle_owner->name,
            id    => $vehicle_owner->id,
            email => $vehicle_owner->email
        }
    );

}

1;
