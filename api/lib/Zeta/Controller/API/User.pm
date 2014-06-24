package Zeta::Controller::API::User;

use Moose;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::User',
    object_key => 'user',

    update_roles => [qw/superadmin webapi admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],
    search_ok   => {
        email => 'Str',
        order => 'Str',	
        reset_password_key => 'Str',
    }

);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('users') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $user  = $c->stash->{user};
    my %attrs = $user->get_inflated_columns;
    $self->status_ok(
        $c,
        entity => {
            roles 		=> [ map { $_->name } $user->roles ],
            role_ids 	=> [ map {$_->id } $user->roles ],

            map { $_ => $attrs{$_}, }
                qw/
                id
                name
                email
                is_active
                reset_password_key
                organization_id
                /
        }
    );
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $user = $c->stash->{user};

    if( $c->req->params->{change_roles} ) {
 		my $rel 	= $c->model('DB::UserRole')->search( { user_id => $user->id } )->delete;
		my @roles 	= decode_json($c->req->params->{roles});
		
		eval {	$c->model('DB::UserRole')->populate($roles[0]); };
		
		delete $c->req->params->{roles};
    }

    $user->execute( $c, for => 'update', with => $c->req->params );

    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $user->id ] )->as_string,
        entity => {
            name  => $user->name,
            id    => $user->id,
            email => $user->email
        }
    ),
      $c->detach
      if $user;
}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $user = $c->stash->{user};
    $self->status_gone( $c, message => 'deleted' ), $c->detach
      unless $user->is_active;

    $user->update( { is_active => 0 } );

    $self->status_no_content($c);
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;
    
    my $conditions = undef;
    if( $c->req->params->{role} ) {
		$conditions = {
 			'role.id' => $c->req->params->{role} == 99 ? { 'in' => [1,4,5,6,8] } : $c->req->params->{role} #administrative roles, 99 is just to define the undefined
		}
    }

    $self->status_ok(
        $c,
        entity => {
            users => [
                map {
                    my $r = $_;
                    +{
                        ( 
							map { $_ => $r->{$_} } 
							qw/
								id 
								name 
								email 
								is_active 
								reset_password_key 
								created_at
							/ 
						),
                        roles 	=> [ map { $_->{role}{name} } @{ $r->{user_roles} } ],
                        url 	=> $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                      }
				} $c->stash->{collection}->search( $conditions ? {%$conditions} : undef, { prefetch => [ { user_roles => 'role' } ] } )
				->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $params = { %{ $c->req->params } };
    
    my $user = $c->stash->{collection}->execute( $c, for => 'create', with => $params );

    $self->status_created(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $user->id ] )->as_string,
        entity 		=> {
            id => $user->id
        }
    );
}

1;