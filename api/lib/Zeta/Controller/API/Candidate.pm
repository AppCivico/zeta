package Zeta::Controller::API::Candidate;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::Candidate',
    object_key 	=> 'candidate',
    result_attr => {
        prefetch => 'political_party'
    },

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin admin/],
    delete_roles => [qw/superadmin admin/],

    search_ok => {
        political_party_id => 'Int'
    }
);
with 'Zeta::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('candidates') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $candidate 	= $c->stash->{candidate};
#     my %attrs    	= $candidate->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $candidate->$_, }
                  qw/
                  id
                  name
                  email
                  phone
                  img_profile
                  vice
                  /
            ),
            political_party => {
                (
                    map { $_ => $candidate->political_party->$_, }
                    qw/
                    id
                    name
					acronym
					party_number
                    /
                )
            },
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) 	= @_;
    my $candidate 		= $c->stash->{candidate};

    $candidate->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $candidate = $c->stash->{candidate};

    my $params = $c->req->params;

    $candidate->execute( $c, for => 'update', with => $params );
    $self->status_accepted(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $candidate->id ] )->as_string,
        entity => { id => $candidate->id }
      ),
      $c->detach
      if $candidate;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;
    my $rs = $c->stash->{collection};

    $self->status_ok(
        $c,
        entity => {
            candidates => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								name
								email
								phone
								img_profile
								vice
                              /
                        ),
                        political_party => {
                            (
                                map { $_ => $r->{political_party}{$_}, }
                                qw/
                                id
								name
								acronym
								party_number
                                /
                            )
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

    my $candidate = $c->stash->{collection}
      ->execute( $c, for => 'create', with => $c->req->params );

    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $candidate->id ] )->as_string,
        entity => {
            id => $candidate->id
        }
    );
}

1;