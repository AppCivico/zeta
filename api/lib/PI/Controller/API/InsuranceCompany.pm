package PI::Controller::API::InsuranceCompany;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result      => 'DB::InsuranceCompany',
    object_key  => 'insurance_company',

    update_roles => [qw/superadmin webapi/],
    create_roles => [qw/superadmin webapi/],
    delete_roles => [qw/superadmin webapi/],

    search_ok => {
        order => 'Str'
    }

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('insurance_companies') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $insurance_company = $c->stash->{insurance_company};

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $insurance_company->$_ }
                  qw(
                  id
                  name
                  )
            ),
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $insurance_company = $c->stash->{insurance_company};

    $insurance_company->execute( $c, for => 'update', with => $c->req->params );

    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $insurance_company->id ] )->as_string,
        entity => { name => $insurance_company->name, id => $insurance_company->id }
      ),

      $c->detach
      if $insurance_company;
}

sub result_DELETE {
    my ( $self, $c ) = @_;

    my $insurance_company = $c->stash->{insurance_company};

    $insurance_company->delete;
    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            insurance_company => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              name
                              /
                        ),
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      },
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $insurance_company = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $insurance_company->id ] )->as_string,
        entity => {
            name    => $insurance_company->name,
            id      => $insurance_company->id,
        }
    );

}

1;