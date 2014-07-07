package Zeta::Controller::API::ElectoralRegionalCourt;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result    => 'DB::ElectoralRegionalCourt',
    result_attr => {
        prefetch =>  'state'
    },
    search_ok => {
        state_id => 'Int',
        order    => 'Str'
    }
);

with 'Zeta::TraitFor::Controller::AutoBase';
with 'Zeta::TraitFor::Controller::Search';

sub base : Chained('/api/base') : PathPart('electoral_regional_courts') : CaptureArgs(0) { }

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            electoral_regional_courts => [
                map {
                    my $r = $_;
                    +{
                        (
                            map { $_ => $r->{$_} }
                              qw/
                              id
                              /
                        ),
                        state => {
							map { $_ => $r->{state}{$_}, }
							qw/
							id
							name
							/
						},
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );

}

1;
