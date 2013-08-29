package PI::Controller::API::CheckEmail;

use Moose;
use WWW::Correios::CEP;
use Text2URI;
use JSON::XS;
my $url_parser = Text2URI->new;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::User',
);
with 'PI::TraitFor::Controller::AutoBase';

sub base : Chained('/api/base') : PathPart('check_email') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(0) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_POST {
    my ( $self, $c ) = @_;

    $c->model('DB::User')->execute( $c, for => 'check_email', with => $c->req->params );

    my $user = $c->stash->{collection}->search( {
        email => $c->req->params->{email}
    }, {
        prefetch => [{ user_roles => 'role' } ],
        result_class => 'DBIx::Class::ResultClass::HashRefInflator'
    })->next;

    $self->status_ok(
        $c,
        entity => {

            user => $user ? {
                name => $user->{name},
                roles => [
                    map { $_->{role}{name} } @{$user->{user_roles}}
                ]
            } : undef
        }
    );
}

1;