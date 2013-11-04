package PI::Controller::API::Customer;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::Customer',
    object_key  => 'customer',
    result_cond => { 'user.active' => 1 },
    result_attr => { prefetch => [ 'user', 'address' ] },

    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('customers') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $customer = $c->stash->{customer};

    my %attrs = $customer->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw(
                id
                fancy_name
                corporate_name
                email
                cnpj
                state_registration
                municipal_registration
                phone
                mobile_phone
                secondary_phone
                address_id
                )
             ),
            address => {
                (
                    map { $_ => $customer->address->$_ }
                        qw/
                        address
                        number
                        neighborhood
                        complement
                        city_id
                        user_id
                        /
                ),
                postal_code => $customer->address->postal_code ? sprintf("%08d", $customer->address->postal_code) : undef
            },
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $customer = $c->stash->{customer};

    $customer->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $customer->id ] )->as_string,
        entity => {
                name => $customer->corporate_name,
                id => $customer->id,
                address_id => $customer->address_id
            }
      ),
      $c->detach
      if $customer;
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $customer = $c->stash->{customer};

    $customer->user->update( { active => 0 } );

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    if($c->req->params->{name}) {
        $rs = $rs->search({'corporate_name' => {'like' => "%${\$c->req->params->{name}}%"} } );
    }

    $self->status_ok(
        $c,
        entity => {
            customers => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              fancy_name
                              corporate_name
                              email
                              cnpj
                              state_registration
                              municipal_registration
                              phone
                              mobile_phone
                              secondary_phone
                              address_id
                              /
                        ),
                        address => {
                            (
                                map { $_ => $r->{customer}{address}{$_} }
                                qw/
                                address
                                number
                                neighborhood
                                complement
                                city_id
                                user_id
                                /
                            ),
                            postal_code => $r->{customer}{address}{postal_code} ? sprintf("%08d", $r->{customer}{address}{postal_code}) : undef
                        },
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $rs->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $customer = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $customer->id ] )->as_string,
        entity => {
            corporate_name => $customer->corporate_name,
            id             => $customer->id
        }
    );

}

1;
