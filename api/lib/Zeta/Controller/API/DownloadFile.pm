package Zeta::Controller::API::DownloadFile;

use Moose;
use File::Spec;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::Candidate',
    object_key => 'candidate'
);

with 'Zeta::TraitFor::Controller::AutoBase';
with 'Zeta::TraitFor::Controller::AutoObject';

sub base : Chained('/api/base') : PathPart('download-files') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {}

sub download: Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $response;
    my $local_path = $c->req->params->{path};

    if ( -f $local_path ) {
        open( my $fh, '<:raw', $local_path );
		
        $c->res->body($fh);
        
        $c->detach;
    } else {
        $self->status_gone(
            $c,
            message => "The document have been deleted!",
        );
    }
}

1;