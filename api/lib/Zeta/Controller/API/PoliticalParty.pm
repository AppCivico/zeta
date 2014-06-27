package Zeta::Controller::API::PoliticalParty;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::PoliticalParty',
    object_key 	=> 'political_party',

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user admin/],
    delete_roles => [qw/superadmin user admin/],
    search_ok => {
		status 	=> 'Int',
		order	=> 'Str',
    }
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('political_parties') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $political_party 	= $c->stash->{political_party};
    my %attrs    			= $political_party->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  name
                  acronym
                  party_number
                  status
                  /
            ),
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 		= @_;
    my $political_party		= $c->stash->{political_party};

    $political_party->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $political_party = $c->stash->{political_party};

    my $params = $c->req->params;

    $political_party->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $political_party->id ] )->as_string,
        entity 		=> { id => $political_party->id }
      ),
      $c->detach
      if $political_party;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    
    my $rs = $c->stash->{collection};
    
    my $conditions;
    my $count;
    
    if( $c->req->params->{name} ) {
		$conditions = {
			name => $c->req->params->{name}
		};
    }
    
    if( $c->req->params->{pagination} ) {
		$count = $rs->search( $conditions ? { %$conditions } :  undef )->count;

		$rs = $rs->search(
			$conditions ? { %$conditions } : undef,
			{
				page 	=> $c->req->params->{page},
				rows 	=> 10,
			},
		);
	}

    $self->status_ok(
        $c,
        entity => {
            political_parties => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								acronym
								party_number
								status
                              /
                        ),
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

    my $political_party = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $political_party->id ] )->as_string,
        entity => {
            id => $political_party->id
        }
    );
}

1;