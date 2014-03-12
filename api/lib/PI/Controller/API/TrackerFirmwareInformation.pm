package PI::Controller::API::TrackerFirmwareInformation;

use Moose;
use File::Spec;
use Archive::Extract;
use PI::TrackingManager::Cache;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result     => 'DB::TrackerFirmwareInformation',
    object_key => 'tracker_firmware_information',

    update_roles => [qw/superadmin admin-tracker/],
    create_roles => [qw/superadmin admin-tracker/],
    delete_roles => [qw/superadmin admin-tracker/],

    search_ok => {
        version => 'Num',
        order   => 'Str'
    },

    result_attr => {
        prefetch => 'status'
    },

);
with 'PI::TraitFor::Controller::DefaultCRUD';

sub base : Chained('/api/base') : PathPart('tracker_firmware_informations') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(1) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $tracker_firmware_information    = $c->stash->{tracker_firmware_information};
    my %attrs                           = $tracker_firmware_information->get_inflated_columns;

    $self->status_ok(
        $c,
        entity => {
            (
                map { $_ => $attrs{$_}, }
                  qw/
                  id
                  version
                  private_path
                  public_path
                  version_hash
                  /
            ),
            status => {
                ( map { $_ => $tracker_firmware_information->status->{$_} } qw/ description / )
            },
            map { $_ => ( $tracker_firmware_information->$_ ? $tracker_firmware_information->$_->datetime : undef ) }
                qw/created_at/
        }
    );

}

sub result_DELETE {
    my ( $self, $c ) = @_;
    my $tracker_firmware_information = $c->stash->{tracker_firmware_information};

    $tracker_firmware_information->delete;

    $self->status_no_content($c);
}

sub result_PUT {
    my ( $self, $c ) = @_;

    my $tracker_firmware_information = $c->stash->{tracker_firmware_information};

    $tracker_firmware_information->execute( $c, for => 'update', with => $c->req->params );

    $self->status_accepted(
        $c,
        location    => $c->uri_for( $self->action_for('result'), [ $tracker_firmware_information->id ] )->as_string,
        entity      => { id => $tracker_firmware_information->id }
      ),
      $c->detach if $tracker_firmware_information;
}

sub list : Chained('base') : PathPart('') : Args(0) : ActionClass('REST') { }

sub list_GET {
    my ( $self, $c ) = @_;

        $self->status_ok(
            $c,
            entity => {
                tracker_firmware_informations => [
                    map {
                        my $r = $_;
                        +{
                            (
                                map { $_ => $r->{$_} }
                                qw/
                                id
                                version
                                private_path
                                public_path
                                version_hash
                                created_at
                                /
                            ),
                            url => $c->uri_for_action( $self->action_for('result'), [ $r->{id} ] )->as_string,
                            status => {
                                (
                                    map { $_ => $r->{status}{$_} } qw/description/
                                ),
                            },
                        },
                    } $c->stash->{collection}->as_hashref->all
                ]
            }
        );

}

sub list_POST {
    my ( $self, $c ) = @_;

    my $rs = $c->stash->{collection};

    if($c->req->params->{status} == 1) {
        $rs->update_all( { status => 2 } );
    }

    my $tracker_cache = PI::TrackingManager::Cache->new();

    my $tracker_firmware_information = $rs->execute( $c, for => 'create', with => $c->req->params );

    if (  $c->req->upload('file') ) {
        my $updated_entity = $self->_upload_file( $c, $tracker_firmware_information );

        $tracker_cache->update_firmware_version($updated_entity->version);
    }


    $self->status_created(
        $c,
        location => $c->uri_for( $self->action_for('result'), [ $tracker_firmware_information->id ] )->as_string,
        entity => {
            id => $tracker_firmware_information->id
        }
    );
}

sub _upload_file {
    my ( $self, $c, $tracker_firmware_information ) = @_;
    use DDP;

    my $client      = PI::S3Client->new();
    my $bucket_name = 'PI-FMWR';
    my $bucket      = $client->s3->bucket($bucket_name);
    my $clientObj   = Net::Amazon::S3::Client->new( s3 => $client->s3 );
    my $bucketObj   = $clientObj->bucket(name => 'PI-FMWR');

    my $upload          = $c->req->upload('file');
    my $filename        = sprintf( '%i_%s', $tracker_firmware_information->id, $tracker_firmware_information->version);
    my $private_path    = "backup/$filename";

    my $files = $self->_unzip_file($c, $upload->tempname);

    eval {
        my $keys    = $bucket->list;
        my $size    = scalar keys $keys->{'keys'};
        my @objs;

        for(my $i; $i < $size; $i++) {
            if( $keys->{'keys'}[$i]{'key'} && $keys->{'keys'}[$i]{'key'} =~ m/^(documents)/ ) {
                push(@objs, $bucketObj->object( key => $keys->{'keys'}[$i]{'key'} ));
            }
        }

        $bucketObj->delete_multi_object(@objs);

        $bucket->add_key_filename(
            $private_path,
            $upload->tempname,
            { content_type => $upload->type },
        ) or die $client->s3->err . ": " . $$client->s3->errstr;

        foreach my $fl ( @{ $files } ) {

            my @part    = split '/', $fl;
            my $obj     = 'documents/'.$part[scalar @part-1];

            if(scalar @part > 1) {
                $bucket->add_key_filename(
                    $obj,
                    File::Spec->catfile('/tmp', $fl),
                    { content_type => $upload->type },
                ) or die $client->s3->err . ": " . $$client->s3->errstr;
            }

        }

    };

    unless ( !$@ ) {
        $self->status_bad_request( $c, message => "Copy failed: $@" ), $c->detach;
    }

    $tracker_firmware_information->update( { private_path => $private_path } );

    return $tracker_firmware_information;
}

sub _unzip_file {
    my ($self, $c, $file) = @_;

    my $ufile   = Archive::Extract->new( archive => $file );

    $ufile->extract( to => '/tmp' );

    return $ufile->files;
}

1;
