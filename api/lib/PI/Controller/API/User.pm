package PI::Controller::API::User;

use Data::Printer;
use Moose;
use JSON qw(encode_json);
BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config( default => 'application/json', log_key => 'user_id' );

sub base : Chained('/api/base') : PathPart('user') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    $c->stash->{collection} = $c->model('DB::User')->search_rs( { active => 1 } )
      or $self->status_forbidden( $c, message => "access denied" ), $c->detach;

}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;
    my $me = $c->stash->{collection}->current_source_alias;
    $c->stash->{object} = $c->stash->{user} = $c->stash->{collection}->search_rs( { "$me.id" => $id } );

    $c->stash->{object}->count > 0 or $c->detach('/error_404');



}

sub user : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') {
    my ( $self, $c ) = @_;

}

sub user_GET {
    my ( $self, $c ) = @_;
    my $user  = $c->stash->{object}->next;
    my %attrs = $user->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            roles           => [ map { $_->name } $user->roles ],
            can_create_list => [ $user->can_create_list ],
            $user->active_partner_info ? ( partner_key => $user->active_partner_info->key )
            : (),
            $user->organization
            ? (
                organization => $c->uri_for( $c->controller('API::Organization')->action_for('organization'),
                    [ $attrs{organization_id} ] )->as_string
              )
            : (),
            $user->organizations->count ? (
                organizations => [
                    map {
                        +{
                            id   => $_->id,
                            name => $_->name,
                            url  => $c->uri_for(
                                $c->controller('API::Organization')->action_for('organization'), [ $_->id ]
                            )->as_string
                          }
                    } $user->organizations->all
                ]
              )
            : (),

            map { $_ => $attrs{$_}, } qw(name email identity_num can_upload demo address phone_number)
        }
    );
}

sub user_PUT {
    my ( $self, $c ) = @_;

    my $user = $c->stash->{object}->next;

    $c->stash->{object}->reset;

    $self->status_bad_request( $c, message => 'Unauthorized' ), $c->detach
      unless $c->user->obj->id == $user->id;

    my $dm = $c->stash->{object}->check( for => 'update', with => $c->req->params );
    $user = $dm->apply;
    $self->status_bad_request( $c, message => encode_json( $dm->errors ) ), $c->detach
      unless $dm->success;

    $c->model('Logger')->(
        'info',
        "O usuário ${\$user->email} foi atualizado por ${\$c->user->obj->email}",
        update => { type => 'user', id => $user->id, email => $user->email }
    );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('user'), [ $user->id ] )->as_string,
        entity => { name => $user->name, id => $user->id }
      ),
      $c->detach
      if $user;
}

sub user_DELETE {
    my ( $self, $c ) = @_;
    my $user = $c->stash->{object}->next;
    $self->status_gone( $c, message => 'deleted' ), $c->detach
      unless $user->active;

    $c->model('Logger')->(
        'info',
        "O usuário ${\$user->email} foi apagado por ${\$c->user->obj->email}",
        delete => {
            type    => 'user',
            id      => $user->id,
            'email' => $user->email
        }
    );

    $user->update( { active => 0 } );

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
                        name         => $_->{name},
                        email        => $_->{email},
                        address      => $_->{address},
                        phone_number => $_->{phone_number},
                        roles        => [ map { $_->{role}{name} } @{ $_->{user_roles} } ],
                        $_->{organization}
                        ? (
                            organization => {
                                name   => $_->{organization}->{name},
                                status => $_->{organization}->{status},
                                id     => $_->{organization}->{id}
                            }
                          )
                        : (),
                        url => $c->uri_for_action( $self->action_for('user'), [ $_->{id} ] )->as_string
                      }
                  } $c->stash->{collection}
                  ->search_rs( undef, { prefetch => [ 'organization', { user_roles => 'role' } ] } )->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    $self->status_forbidden( $c, message => encode_json( { 'role.invalid' => 1 } ) ), $c->detach
      unless $c->user->obj->can_create( $c->req->params->{role} );

    my $dm = $c->stash->{collection}->check( for => 'create', with => $c->req->params );

    my $user = $dm->apply;
    $self->status_bad_request( $c, message => encode_json( $dm->errors ) ), $c->detach
      unless $dm->success;


    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('user'), [ $user->id ] )->as_string,
        entity => {
            name  => $user->name,
            id    => $user->id,
            roles => [ map { $_->name } $user->roles ],
        }
    );

}

with 'PI::TraitFor::Controller::Search';

1;
