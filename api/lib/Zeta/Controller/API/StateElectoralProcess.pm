package Zeta::Controller::API::StateElectoralProcess;

use Moose;
use DateTime;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::StateElectoralProcess',
    object_key 	=> 'state_electoral_process',
    search_ok => {
		electoral_regional_court_id => 'Int'
	},
	result_attr => {
		prefetch =>  [ 
			{ 'electoral_regional_court' => 'state' },
			'created_by' 
       ]
    },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user admin/],
    delete_roles => [qw/superadmin user admin/],
);

with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('state_electoral_processes') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $state_electoral_process = $c->stash->{state_electoral_process};
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $state_electoral_process->$_, }
                  qw/
					id
					name
					content
					source
                  /
            ),
            ( map { $_ => ( $state_electoral_process->$_ ? $state_electoral_process->$_->datetime : undef ) } qw/created_at/ ),
            electoral_regional_court => {
                (
                    map { $_ => $state_electoral_process->electoral_regional_court->$_, }
                    qw/
                    id
                    state_id
                    /
                ),
                state => {
					map { $_ => $state_electoral_process->electoral_regional_court->state->$_, }
                    qw/
                    id
                    name
                    /
                }
            },
            created_by => {
                (
                    map { $_ => $state_electoral_process->created_by->$_, }
                    qw/
                    id
                    name
                    /
                ),
            },
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $state_electoral_process = $c->stash->{state_electoral_process};

    $state_electoral_process->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $state_electoral_process = $c->stash->{state_electoral_process};

    my $params = $c->req->params;

    $state_electoral_process->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $state_electoral_process->id ] )->as_string,
        entity 		=> { id => $state_electoral_process->id }
      ),
      $c->detach
      if $state_electoral_process;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    my $rs = $c->stash->{collection};

    $self->status_ok(
        $c,
        entity => {
            state_electoral_processes => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								content
								source
								created_at
                              /
                        ),
						electoral_regional_court => {
							(
								map { $_ => $r->{electoral_regional_court}{$_}, }
								qw/
								id
								state_id
								/
							),
							state => {
								map { $_ => $r->{electoral_regional_court}{state}{$_}, }
								qw/
								id
								name
								/
							}	
						},
						created_by => {
							(
								map { $_ => $r->{created_by}{$_}, }
								qw/
								id
								name
								/
							),
						},
                        url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string
                     }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $state_electoral_process = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $state_electoral_process->id ] )->as_string,
        entity => {
            id => $state_electoral_process->id
        }
    );
}

1;