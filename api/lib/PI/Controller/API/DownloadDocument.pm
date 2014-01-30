package PI::Controller::API::DownloadDocument;

use Moose;
use File::Spec;
use PI::S3Client;

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

    my $client      = PI::S3Client->new();
    my $bucket_name = 'PI-BKT01';
    my $bucket      = $client->s3->bucket($bucket_name);

    my $response;
    my $local_path;

    eval {
        my($a1, $b2, $c3)   = split('/', $document->private_path);
        $local_path         = '/www/aware/web-pi/etc/s3/'.$c3;

        $response = $bucket->get_key_filename($document->private_path, 'GET', $local_path)
        or die $client->s3->err . ": " . $client->s3->errstr;
    };

    if (-f $local_path) {
        open(my $fh, '<:raw', $local_path);

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
