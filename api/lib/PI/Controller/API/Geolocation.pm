package PI::Controller::API::Geolocation;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user webapi admin/],
    delete_roles => [qw/superadmin user admin/],
);

sub base : Chained('/api/base') : PathPart('geolocation') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub find_postal_code : Chained('base') : PathPart('find_postal_code') : Args(0) {
    my ( $self, $c ) = @_;

    my $geolocation = $c->model('Geolocation');
    $geolocation->find_postal_code($c->req->params->{address});

}

1;