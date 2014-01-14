package PI::Controller::API::ResetPassword;

use Moose;
use MIME::Base64;
use utf8;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    update_roles => [qw/superadmin user/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],

);

sub base : Chained('/api/base') : PathPart('reset_password') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub send_email :Chained('base') : PathPart('send_email') : Args(0) {
    my ( $self, $c ) = @_;
    my $p = $c->req->params;
    use DDP; p $p;
    my $config      = PI->config;
    my $email_model = $c->model('EmailQueue');

    my $validation_link =
        $config->{domain}{default}
      . '/forgot_password/change?email='
      . $c->req->params->{email} . '&key='
      . encode_base64( $c->req->params->{validation_key} );

    $email_model->add(
        email     => $c->req->params->{email},
        content   => $validation_link,
        subject   => 'Publicidade Inteligente - Recuperação de senha',
        template  => 'reset_password.tt',
        queue_key => 'email'
    );

    $self->status_ok($c, entity => { email => $c->req->params->{email} } );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $vehicle = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $vehicle->id ] )->as_string,
        entity => {
            model     => $vehicle->vehicle_model_id,
            id        => $vehicle->id,
            car_plate => $vehicle->car_plate
        }
    );

}

1;