package Zeta::Controller::API::Organization;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Organization',
    object_key 	=> 'organization',

    update_roles => [qw/superadmin user admin webapi/],
    create_roles => [qw/superadmin user webapi/],
    delete_roles => [qw/superadmin user webapi/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('organizations') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $organization 	= $c->stash->{organization};
    my %attrs    	= $organization->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  name
                  address
                  postal_code
                  city_id
                  description
                  /
            ),
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $organization 		= $c->stash->{organization};

    $organization->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $organization = $c->stash->{organization};

    my $params = $c->req->params;

    $organization->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $organization->id ] )->as_string,
        entity => { id => $organization->id }
      ),
      $c->detach
      if $organization;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    $self->status_ok(
        $c,
        entity => {
            organizations => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								address
								postal_code
								city_id
								description
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

    my $organization = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $organization->id ] )->as_string,
        entity => {
            id => $organization->id
        }
    );
}

1;