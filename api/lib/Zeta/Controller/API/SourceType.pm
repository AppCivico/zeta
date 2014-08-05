package Zeta::Controller::API::SourceType;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result    => 'DB::SourceType',
    object_key 	=> 'source_type',
    search_ok => {
        order    => 'Str'
    },
    
    update_roles => [qw/superadmin admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],
);

with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('source_types') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $source_type 	= $c->stash->{source_type};
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $source_type->$_, }
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
    
    my $source_type = $c->stash->{source_type};

    $source_type->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $source_type = $c->stash->{source_type};

    my $params = $c->req->params;

    $source_type->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $source_type->id ] )->as_string,
        entity => { id => $source_type->id }
      ),
      $c->detach
      if $source_type;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            source_types => [
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
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );

}

sub list_POST {
    my ( $self, $c ) = @_;

    my $source_type = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $source_type->id ] )->as_string,
        entity => {
            id => $source_type->id
        }
    );
}

1;