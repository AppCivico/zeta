package Test::Further;
use Moose;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Catalyst::Test q(PI);

use HTTP::Request::Common qw(GET POST DELETE HEAD);


*main::ctx_request = *Test::Further::ctx_request;
*main::api_auth_as = *Test::Further::api_auth_as;
*main::db_transaction = *Test::Further::db_transaction;


*main::GET = *Test::Further::GET;
*main::POST = *Test::Further::POST;
*main::DELETE = *Test::Further::DELETE;
*main::HEAD = *Test::Further::HEAD;


my $auth_user = 0;

sub api_auth_as {
    my (%conf) = @_;

    $conf{user_id} ||= 1;
    $conf{roles} ||= ['superadmin'];

    unless ($auth_user){
        require Package::Stash;
        require PI::TestOnly::Mock::AuthUser;

        my $stash = Package::Stash->new('Catalyst::Plugin::Authentication');
        my $auth_user = PI::TestOnly::Mock::AuthUser->new;

        $stash->add_symbol( '&user',  sub { return $auth_user } );
        $stash->add_symbol( '&_user', sub { return $auth_user } );
    }

    $PI::TestOnly::Mock::AuthUser::_id    = $conf{id};
    @PI::TestOnly::Mock::AuthUser::_roles = @{$conf{roles}};
}

sub db_transaction (&) {
    my ( $subref) = @_;

    my $schema = PI->model('DB');

    eval {
        $schema->txn_do(
            sub {
                $subref->($schema);
                die 'rollback';
            }
        );
    };

    die $@ unless $@ =~ /rollback/;

}




1;