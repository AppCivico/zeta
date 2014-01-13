package PI::Controller::API::Zone;

use Moose;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result    => 'DB::Zone',
);
with 'PI::TraitFor::Controller::AutoBase';
with 'PI::TraitFor::Controller::Search';

sub base : Chained('/api/base') : PathPart('zones') : CaptureArgs(0) { }

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') {
}

sub list_GET {
    my ( $self, $c ) = @_;

    $self->status_ok(
        $c,
        entity => {
            zones => [
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
                      }
                } $c->stash->{collection}->as_hashref->all
            ]
        }
    );

}

1;
