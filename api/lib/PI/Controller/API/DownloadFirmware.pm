package PI::Controller::API::DownloadFirmware;

use Moose;
use File::Spec;
use PI::S3Client;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::TrackerFirmwareInformation',

    object_key => 'tracker_firmware_information'
);
with 'PI::TraitFor::Controller::AutoBase';

sub base : Chained('/api/base') : PathPart('download-firmware') : CaptureArgs(0) { }

sub download: Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $client      = PI::S3Client->new();
    my $bucket_name = 'PI-FMWR';
    my $bucket      = $client->s3->bucket($bucket_name);
    my $file        = $c->req->params->{file};

    my $local_path = '/tmp/'.$file;
    my $response;

    eval {
        $response = $bucket->get_key_filename('documents/'.$file, 'GET', $local_path)
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