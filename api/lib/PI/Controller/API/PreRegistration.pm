package PI::Controller::API::PreRegistration;

use Moose;
use utf8;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::PreRegistration',
    object_key => 'pre_registration',

    update_roles => [qw/superadmin webapi/],
    create_roles => [qw/superadmin webapi/],
    delete_roles => [qw/superadmin webapi/],

    search_ok => {
        email   => 'Str',
        order   => 'Str'
    },
    result_attr => {
        prefetch => ['city', 'zone']
    },

);

with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('pre_registrations') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $pre_registration    = $c->stash->{pre_registration};
    my %attrs               = $pre_registration->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                qw/
                    id
                    name
                    gender
                    marital_state
                    email
                    telephone
                    manufactured_year
                    average_mileage
                    postal_code_college
                    postal_code_home
                    postal_code_job
                    record_origin
                    fb_id
                /
            ),
            city => {
                map {$_ => $attrs{$_}, }
                 qw /id name/
            },
            zone => {
                map {$_ => $attrs{$_}, }
                 qw /id name/
            },
            ( map { $_ => ( $attrs{$_} ? $attrs{$_}->datetime : undef ) } qw/birth_date created_at/ ),

        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $pre_registration = $c->stash->{pre_registration};

    $pre_registration->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location    => $c->uri_for( $self->action_for('result'), [ $pre_registration->id ] )->as_string,
        entity      => { name => $pre_registration->name, id => $pre_registration->id }
      ),
      $c->detach
      if $pre_registration;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $pre_registration = $c->stash->{pre_registration};

    $pre_registration->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            pre_registrations => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                                id
                                name
                                gender
                                marital_state
                                email
                                telephone
                                manufactured_year
                                average_mileage
                                postal_code_college
                                postal_code_home
                                postal_code_job
                                record_origin
                                fb_id
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $pre_registration = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    my $config      = PI->config;
    my $signup_link = $config->{domain}{default}.'/cadastro?pre_id='.$pre_registration->id;
    my $email_model = $c->model('EmailQueue');
    my $email       = lc $c->req->params->{email};

    $email_model->add(
        email     => $email,
        name      => $pre_registration->name,
        content   => $signup_link,
        subject   => 'Publicidade Inteligente - Pré-cadastro',
        template  => 'pre_registration.tt',
        queue_key => 'email'
    );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $pre_registration->id ] )->as_string,
        entity => {
            name => $pre_registration->name,
            id   => $pre_registration->id
        }
    );
}

1;