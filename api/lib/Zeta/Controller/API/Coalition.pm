package Zeta::Controller::API::Coalition;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Coalition',
    object_key 	=> 'coalition',

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user/],
    delete_roles => [qw/superadmin user/],
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('coalitions') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $coalition 	= $c->stash->{coalition};
    my %attrs    	= $coalition->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
					id
					name
					election_campaign_id
                  /
            ),
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $coalition		= $c->stash->{coalition};

    $coalition->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $coalition = $c->stash->{coalition};

    my $params = $c->req->params;

    $coalition->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location 	=> $c->uri_for( $self->action_for('result'), [ $coalition->id ] )->as_string,
        entity 		=> { id => $coalition->id }
      ),
      $c->detach
      if $coalition;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    $self->status_ok(
        $c,
        entity => {
            coalitions => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								election_campaign_id
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

    my $coalition = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $coalition->id ] )->as_string,
        entity => {
            id => $coalition->id
        }
    );
}

1;