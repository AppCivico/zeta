package PI::Controller::API::Document;

use Moose;
use File::Spec;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::Document',
    object_key => 'document',
    result_attr => {
        prefetch => [
            'status',
            'validated_by'
        ]
    },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

    search_ok => {
        vehicle_id => 'Int',
        user_id    => 'Int'
    }
);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('documents') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c ) = @_;

    $c->stash->{disable_check_owner} = 1;
}

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $document = $c->stash->{document};
    my %attrs    = $document->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            ( map { $_ => ( $document->$_ ? $document->$_->datetime : undef ) } qw/created_at validated_at/ ),
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  class_name
                  private_path
                  vehicle_id
                  user_id
                  /
            ),
            status => {
                (
                    map { $_ => $attrs{$_}, }
                    qw/
                    id
                    description
                    /
                )
            },
            validated_by => {
                (
                    map { $_ => $attrs{$_}, }
                    qw/
                    id
                    name
                    /
                )
            }
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $document = $c->stash->{document};

    $document->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $document = $c->stash->{document};

    my $params = $c->req->params;

    if ( $c->check_any_user_role( 'admin' ) && $c->req->params->{document_valid}) {
        $params->{validated_by} = $c->user->id;
        $params->{status}       = 1;
    }else{
        delete $params->{validated_by};
    }

    $document->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $document->id ] )->as_string,
        entity => { id => $document->id }
      ),
      $c->detach
      if $document;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    $self->status_ok(
        $c,
        entity => {
            documents => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              class_name
                              private_path
                              validated_by
                              vehicle_id
                              user_id
                              created_at
                              validated_at
                              /
                        ),
                        status => {
                            (
                                map { $_ => $r->{status}{$_}, }
                                qw/
                                id
                                description
                                /
                            )
                        },
                        validated_by => {
                            (
                                map { $_ => $r->{validated_by}{$_}, }
                                qw/
                                id
                                name
                                /
                            )
                        },
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    # TODO verificar tipo do arquivo

    my $document = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, user_id => $c->user->id } );

    if ( $c->req->upload('file') ) {
        $self->_upload_file( $c, $document );
    }

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $document->id ] )->as_string,
        entity => {
            id => $document->id
        }
    );
}

sub _upload_file {
    my ( $self, $c, $document ) = @_;

    my $upload     = $c->req->upload('file');
    my $path       = $c->config->{private_path};
    my $user_id    = $c->user->id;
    my $class_name = $document->class_name;

    my $dir_path =
      $path =~ /^\//o
      ? dir($path)->resolve . '/' . $user_id
      : PI->path_to( $path . '/' . $user_id )->stringify;
    mkdir($dir_path);

    my $filename = sprintf( '%i_%i_%s', $document->id, $user_id, $class_name );
    my $private_path =
      $path =~ /^\//o
      ? dir($path)->resolve . '/' . $user_id . '/' . $filename
      : PI->path_to( $path . '/' . $user_id, $filename )->stringify;

    unless ( $upload->copy_to($private_path) ) {

        $self->status_bad_request( $c, message => "Copy failed: $!" ), $c->detach;
    }
    chmod 0644, $private_path;

    $document->update( { private_path => File::Spec->rel2abs($private_path) } );

    return 1;
}

1;
