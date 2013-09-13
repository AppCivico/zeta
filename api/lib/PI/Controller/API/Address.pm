package PI::Controller::API::Address;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::Address',
    object_key => 'address',
    result_attr => {
        prefetch => ['user']
    },

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user webapi/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        user_id => 'Int',
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('addresses') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $address = $c->stash->{address};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $address->{$_} }
                  qw/
                  id
                  address
                  number
                  neighborhood
                  postal_code
                  lat_lng
                  user_id
                  /
            ),
            user => {
                ( map { $_ => $address->user->$_ } qw/id name/ ),
            },
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $address = $c->stash->{address};

    $address->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $address = $c->stash->{address};

    $address->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $address->id ] )->as_string,
        entity => { user_id => $address->user_id, id => $address->id }
      ),
      $c->detach
      if $address;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            addresss => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                address
                                number
                                neighborhood
                                postal_code
                                lat_lng
                                user_id
                              /
                        ),
                        type => {
                            ( map { $_ => $r->{user}{$_} } qw/id name/ ),
                        },
                    }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $s = $c->req->params;
    my $address = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $address->id ] )->as_string,
        entity => {
            id => $address->id
        }
    );

}

1;