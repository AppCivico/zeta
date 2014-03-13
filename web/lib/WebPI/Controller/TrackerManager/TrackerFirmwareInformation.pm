package WebPI::Controller::TrackerManager::TrackerFirmwareInformation;
use Moose;
use JSON::XS;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/trackermanager/base') : PathPart('tracker_firmware_information') : CaptureArgs(0) { }

sub index : Chained('base') : PathPart('') : Args(0) {
    my ($self, $c ) = @_;

    my $api =  $c->model('API');

    $api->stash_result(
        $c,
        'tracker_firmware_informations',
        params => {
            order => 'version'
        }
    );

}

sub add : Chained('base') : PathPart('new') : Args(0) { }

__PACKAGE__->meta->make_immutable;

1;