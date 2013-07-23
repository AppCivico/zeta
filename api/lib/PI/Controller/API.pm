package PI::Controller::API;
use utf8;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller::REST'; }

sub api_key_check : Private {
    my ( $self, $c ) = @_;

    my $api_key = $c->req->param('api_key')
      || ( $c->req->data ? $c->req->data->{api_key} : undef );

    unless ( ref $c->user eq 'PI::TestOnly::Mock::AuthUser' ) {
        $self->status_forbidden( $c, message => "access denied" ), $c->detach
          unless defined $api_key;

        my $user_session = $c->model('DB::UserSession')->search(
            {
                api_key      => $api_key,
                valid_until  => { '>=' => \'now()' },
                valid_for_ip => $c->req->address
            }
        )->first;
        my $user = $user_session ? $c->find_user( { id => $user_session->user_id } ) : undef;

        $self->status_forbidden( $c, message => "access denied", ),

          #$c->logx(
          #'sys', "API_KEY invalida chave " . ( $api_key ? $api_key : '' )
          #),
          $c->detach
          unless defined $api_key && $user;

        $c->set_authenticated($user);

    }
}

sub root : Chained('/') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->response->headers->header( 'charset' => 'utf-8' );
}

sub logged_in : Chained('root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->forward('api_key_check');
}

sub base : Chained('logged_in') : PathPart('') : CaptureArgs(0) {
}

__PACKAGE__->config( default => 'application/json' );

1;

