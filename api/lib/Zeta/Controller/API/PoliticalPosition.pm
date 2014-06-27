package Zeta::Controller::API::PoliticalPosition;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     	=> 'DB::PoliticalPosition',
    object_key 	=> 'political_position',

    update_roles => [qw/superadmin user admin/],
    create_roles => [qw/superadmin user admin/],
    delete_roles => [qw/superadmin user admin/],
    search_ok => {
		order	=> 'Str',
    }
);

with 'Zeta::TraitFor::Controller::AutoBase';
with 'Zeta::TraitFor::Controller::Search';

sub base : Chained('/api/base') : PathPart('political_positions') : CaptureArgs(0) { }

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub result_GET {
    my ( $self, $c ) = @_;

    my $political_position 	= $c->stash->{political_position};
    my %attrs    			= $political_position->get_inflated_columns;
    
    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  position
                  /
            ),
        }
    );

}

sub list_GET {
    my ( $self, $c ) = @_;
    
    $self->status_ok(
        $c,
        entity => {
            political_positions => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
								id
								position
                              /
                        ),
                     }
                } $c->stash->{collection}->as_hashref->all
            ],
        }
    );
}

1;