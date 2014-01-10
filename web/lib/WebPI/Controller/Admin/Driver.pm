package WebPI::Controller::Admin::Driver;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('driver') : CaptureArgs(0) {
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');

    if($c->req->params->{start} || $c->req->params->{end}) {
        my @fields;
        my $params = { %{ $c->req->params } };

        $c->stash->{start}  = $c->req->params->{start};
        $c->stash->{end}    = $c->req->params->{end};

        push(@fields, 'start','end');

        $form->format_date($params, @fields);

        $api->stash_result(
            $c, 'drivers',
            params => {
                end     => $params->{end} ? $params->{end}.' 23:59:59' : undef,
                start   => $params->{start} ? $params->{start}.' 00:00:00' : undef,
                filters => 1,
            }
        );
    } else {
        $api->stash_result(
            $c, 'drivers',
            params => {
                filters => 1
            }
        );
    }

    $c->stash->{count} = scalar keys $c->stash->{drivers};
}

__PACKAGE__->meta->make_immutable;

1;