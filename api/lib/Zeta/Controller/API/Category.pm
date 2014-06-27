package Zeta::Controller::API::Category;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Category',
    object_key 	=> 'category',

    update_roles => [qw/superadmin user admin webapi/],
    create_roles => [qw/superadmin user webapi admin/],
    delete_roles => [qw/superadmin user webapi admin/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('categories') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $category 	= $c->stash->{category};
    my %attrs    	= $category->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  name
                  /
            ),
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $category 		= $c->stash->{category};

    $category->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $category = $c->stash->{category};

    my $params = $c->req->params;

    $category->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $category->id ] )->as_string,
        entity => { id => $category->id }
      ),
      $c->detach
      if $category;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    $self->status_ok(
        $c,
        entity => {
            categories => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
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

    my $category = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $category->id ] )->as_string,
        entity => {
            id => $category->id
        }
    );
}

1;