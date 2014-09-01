package Zeta::Controller::API::FederalElectoralProcess;

use Moose;
use DateTime;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::FederalElectoralProcess',
    object_key 	=> 'federal_electoral_process',
    result_attr => {
        prefetch =>  [ 'electoral_superior_court', 'created_by' ]
    },
    searck_ok => {
		electoral_superior_court_id => 'Int'
    },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user admin/],
    delete_roles => [qw/superadmin user admin/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('federal_electoral_processes') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $federal_electoral_process 	= $c->stash->{federal_electoral_process};
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $federal_electoral_process->$_, }
                  qw/
					id
					name
					content
					source
					external_link
                  /
            ),
            ( map { $_ => ( $federal_electoral_process->$_ ? $federal_electoral_process->$_->datetime : undef ) } qw/created_at/ ),
            electoral_superior_court => {
                (
                    map { $_ => $federal_electoral_process->electoral_superior_court->$_, }
                    qw/
                    id
                    country_id
                    /
                ),
            },
            created_by => {
                (
                    map { $_ => $federal_electoral_process->created_by->$_, }
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
    my $federal_electoral_process = $c->stash->{federal_electoral_process};

    $federal_electoral_process->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $federal_electoral_process = $c->stash->{federal_electoral_process};

    my $params = $c->req->params;

    $federal_electoral_process->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $federal_electoral_process->id ] )->as_string,
        entity 		=> { id => $federal_electoral_process->id }
      ),
      $c->detach
      if $federal_electoral_process;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    my $rs = $c->stash->{collection};
    
    my $count;
    if( $c->req->params->{pagination} ) {
		$count = $rs->search( undef )->count;

		$rs = $rs->search(
			undef,
			{
				page 	=> $c->req->params->{page},
				order 	=> 'me.name',
				rows 	=> 10,
			},
		);
	} else {
		$rs = $rs->search(
			undef,
			{ order => 'me.name' },
		);
	}

    $self->status_ok(
        $c,
        entity => {
            federal_electoral_processes => [
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
								external_link
                              /
                        ),
						electoral_superior_court => {
							(
								map { $_ => $r->{electoral_superior_court}{$_}, }
								qw/
								id
								country_id
								/
							)
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
                } $rs->as_hashref->all
            ],
            count => $count
        }
    );
}

sub list_POST {
    my ( $self, $c ) = @_;

    my $federal_electoral_process = $c->stash->{collection}
      ->execute( $c, for => 'create', with => { %{ $c->req->params }, created_by => $c->user->id } );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $federal_electoral_process->id ] )->as_string,
        entity => {
            id => $federal_electoral_process->id
        }
    );
}

1;