package PI::Controller::API::DownloadDocument;

use Moose;
use File::Spec;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::Document',

    object_key => 'document'
);
with 'PI::TraitFor::Controller::AutoBase';
with 'PI::TraitFor::Controller::AutoObject';

sub base : Chained('/api/base') : PathPart('download-document') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {}

sub download: Chained('object') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $document = $c->stash->{document};

    if (-f $document->private_path){
        open(my $fh, '<:raw', $document->private_path);

        $c->res->body($fh);
        $c->detach;
    }else{
        $self->status_gone( $c,
            message => "The document have been deleted!",
        );
    }
}

1;
