package PI::Controller::API::Driver;

use Moose;
use PI::EmailQueue;
use MIME::Base64;
use DateTime;
use utf8;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result => 'DB::Driver',

    #     result_cond => { 'user.active' => 1 },
    search_ok => {
        validation_key => 'Str',
        order          => 'Str'
    },
    result_attr => {
        prefetch => ['user', 'address']
    },
    object_key  => 'driver',

    update_roles => [qw/superadmin webapi/],
    create_roles => [qw/superadmin webapi/],
    delete_roles => [qw/superadmin/],

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('drivers') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $driver = $c->stash->{driver};
    my %attrs  = $driver->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            (
              map { $_ => $attrs{$_}, }
                qw/
                id
                name
                cpf
                cnh_code
                mobile_number
                telephone_number
                marital_state
                gender
                documents_validated
                /
            ),
            (
                map { $_ => ( $driver->$_ ? $driver->$_->datetime : undef ) }
                  qw/birth_date first_driver_license cnh_validity/
            ),
            email   => $driver->user->email,
            user_id => $driver->user->id,
            address => {
                (
                    map { $_ => $driver->address->$_ }
                       qw/
                        id
                        address
                        number
                        neighborhood
                        postal_code
                        city_id
                       /
                ),
            }
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $driver = $c->stash->{driver};

    $driver->execute( $c, for => 'update', with => $c->req->params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $driver->id ] )->as_string,
        entity => { name => $driver->name, id => $driver->id }
      ),
      $c->detach
      if $driver;
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $driver = $c->stash->{driver};

    $driver->user->update( { active => 0 } );

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    my $rs = $c->stash->{collection};

    if($c->req->params->{filters}) {
        my $conditions;
        my $now = DateTime->now();

        if($c->req->params->{start} && $c->req->params->{end}) {
            $conditions = {
                'me.created_at' => {
                    '-between' => [
                        $c->req->params->{start},
                        $c->req->params->{end}
                    ],
                }
            };
        } elsif ($c->req->params->{start} && !$c->req->params->{end}) {
            $conditions = {
                'me.created_at' => {
                    '-between' => [
                        $c->req->params->{start},
                        $now->format_cldr('Y-M-d H:m:s')
                    ],
                }
            };
        } else {
            $conditions = {
                'me.created_at' => {
                    '<=' => $c->req->params->{end}
                }
            };
        }

        $rs = $rs->search(
            { %$conditions },
            { order_by => { '-asc' => 'me.created_at' } }
        );
    }

    $self->status_ok(
        $c,
        entity => {
            drivers => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              name
                              birth_date
                              cpf
                              cnh_code
                              mobile_number
                              telephone_number
                              gender
                              created_at
                              /
                        ),
                        address => {
                            (
                                map { $_ => $r->{address}{$_} }
                                   qw/
                                    id
                                    address
                                    number
                                    neighborhood
                                    postal_code
                                    city_id
                                   /
                            ),
                        },
                        email       => $r->{user}{email},
                        user_id     => $r->{user}{id},
                        url         => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
                } $rs->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $config = PI->config;
    my $driver = $c->stash->{collection}->execute( $c, for => 'create', with => $c->req->params );

    my $email_model = $c->model('EmailQueue');

    my $validation_link =
        $config->{domain}{default}
      . '/driver/validate_email?email='
      . $c->req->params->{email} . '&key='
      . encode_base64( $driver->validation_key );

    $email_model->add(
        email     => $c->req->params->{email},
        name      => $driver->name,
        content   => $validation_link,
        subject   => 'Publicidade Inteligente - Validação de cadastro',
        template  => 'register_validation.tt',
        queue_key => 'email'
    );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $driver->id ] )->as_string,
        entity => {
            name    => $driver->name,
            id      => $driver->id,
            user_id => $driver->user_id
        }
    );

}

1;