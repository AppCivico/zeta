package PI::Controller::API;
use utf8;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller::REST'; }
__PACKAGE__->config( default => 'application/json', );

use Digest::SHA1 qw(sha1_hex);
use Time::HiRes qw(time);

sub api_key_check : Private {
    my ( $self, $c ) = @_;

    my $api_key = $c->req->param('api_key')
      || ( $c->req->header('X-API-Key') );

    unless ( ref $c->user eq 'PI::TestOnly::Mock::AuthUser' ) {
        $self->status_forbidden( $c, message => "access denied" ), $c->detach
          unless defined $api_key;

        my $user_session = $c->model('DB::UserSession')->search(
            {
                api_key      => $api_key,
                valid_until  => { '>=' => \'now()' },
                valid_for_ip => [$c->req->address, undef]
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

sub login : Chained('root') : PathPart('login') : Args(0) : ActionClass('REST') {
}

sub login_POST {
    my ( $self, $c ) = @_;

    $c->model('DB::User')->execute( $c, for => 'login', with => $c->req->params );

    if ( $c->authenticate( $c->req->params ) ) {
        my $item = $c->user->sessions->create(
            {
                api_key      => sha1_hex( rand(time) ),
                valid_for_ip => $c->req->address,

                valid_until  => \"now() + '1 month'::interval"
            }
        );

        $c->user->discard_changes;

        my %attrs = $c->user->get_inflated_columns;
        $attrs{api_key} = $item->api_key;

        $attrs{roles} = [ map { $_->name } $c->model('DB::User')->search( { id => $c->user->id } )->next->roles ];

        if (grep {/^user$/} @{$attrs{roles}}){
            my $driver = $c->model('DB::Driver')->search({user_id => $attrs{id}})->next;

            $self->status_bad_request( $c, message => 'Login invalid: no driver found!' ),
                $c->detach unless $driver;

            $attrs{driver} = {
                map {$_ => $driver->$_} qw/id name last_name/
            }
        }

        delete $attrs{password};
        $attrs{created_at} = $attrs{created_at}->datetime;

        $self->status_ok( $c, entity => \%attrs );
    }
    else {
        $c->logx( "Falha na tentativa do login de " . $c->req->param('email') . "." );
        $self->status_bad_request( $c, message => 'Login invalid(2)' );
    }

}

sub logout : Chained('base') : PathPart('logout') : Args(0) : ActionClass('REST') {
}

sub logout_GET {
    my ( $self, $c ) = @_;
    $c->logout;
    $self->status_ok( $c, entity => { logout => 'ok' } );
}

sub logged_in : Chained('root') : PathPart('') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
    $c->forward('api_key_check');
}

sub base : Chained('logged_in') : PathPart('') : CaptureArgs(0) {
}

__PACKAGE__->config( default => 'application/json' );

1;

