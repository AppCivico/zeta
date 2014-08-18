package Zeta::Controller::API::PromiseContent;

use Moose;
use DateTime;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::PromiseContent',
    object_key 	=> 'promise_content',
    result_attr => {
        prefetch =>  [ 'promise', 'created_by' ]
    },
    search_ok => {
		promise_id => 'Int'
    },

    update_roles => [qw/superadmin admin organization/],
    create_roles => [qw/superadmin admin organization/],
    delete_roles => [qw/superadmin admin organization/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('promise_contents') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $promise_content 	= $c->stash->{promise_content};
#     my %attrs    	= $promise_content->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $promise_content->$_, }
                  qw/
					id
					name
					link
                  /
            ),
            ( map { $_ => ( $promise_content->$_ ? $promise_content->$_->datetime : undef ) } qw/created_at/ ),
            promise => {
                (
                    map { $_ => $promise_content->promise->$_, }
                    qw/
                    id
                    name
                    /
                ),
            },
            created_by => {
                (
                    map { $_ => $promise_content->created_by->$_, }
                    qw/
                    id
                    name
                    /
                ),
            },
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $promise_content		= $c->stash->{promise_content};

    $promise_content->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $promise_content = $c->stash->{promise_content};

    my $params = $c->req->params;

    $promise_content->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $promise_content->id ] )->as_string,
        entity 		=> { id => $promise_content->id }
      ),
      $c->detach
      if $promise_content;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    $self->status_ok(
        $c,
        entity => {
            promise_contents => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								link
                              /
                        ),
						promise => {
							(
								map { $_ => $r->{promise}{$_}, }
								qw/
								id
								name
								/
							)
						},
						created_by => {
							(
								map { $_ => $r->{created_by}{$_}, }
								qw/
								id
								name
								/
							),
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

    my $promise_content = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $promise_content->id ] )->as_string,
        entity => {
            id => $promise_content->id
        }
    );
}

1;