package WebZeta::Controller::Candidate;
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('') : CaptureArgs(0) { }

sub candidate_profile : Chained('base') : PathPart('perfil-candidato') : Args(1) {
	my ( $self, $c, $candidate_id ) = @_;
	
	my $api = $c->model('API');
	
	$api->stash_result(
		$c, [ 'candidates', $candidate_id ],
		stash => 'candidate_obj'
	);
	
	$api->stash_result(
		$c, [ 'election_campaigns', $c->stash->{candidate_obj}{election_campaigns}[0] ],
		stash => 'election_campaign_obj',
	);
	
	$api->stash_result(
		$c, [ 'election_campaigns/get_candidates_runoff', $c->stash->{election_campaign_obj}{id} ],
		stash => 'election_campaign_runoff_obj',
	);

	my @ids = ( map { $_->{id} } @{ $c->stash->{election_campaign_runoff_obj}{candidates} } );
	
	my $runoff = 0;
	
	for my $id (@ids) {
		if($candidate_id == $id) {
			$runoff = 1; 
		}
	}
	
	$c->stash->{runoff} = $runoff;
	
	$c->stash->{without_wrapper} = 1;
}

sub download: Chained('base') : PathPart('programa-de-governo') : Args(1) {
	my ( $self, $c, $id ) = @_;

	my $api = $c->model('API');
	
	$api->stash_result(
		$c, [ 'candidates', $id ],
		stash => 'candidate_obj'
	);

	my $path 		= Cwd::cwd();
    my $full_path 	= $path.'/../etc/uploads/'.$c->stash->{candidate_obj}{id}.'/'.$c->stash->{candidate_obj}{government_program};
    
    my $name = $self->slug_name($c->stash->{candidate_obj}{name});
    
    $c->detach() unless $name;
    
    $name = $name.'_'.$c->stash->{candidate_obj}{government_program};
    
	my $content = $api->stash_result(
		$c, 'download-files',
		params => {
			path	=> $full_path,
		},
		get_as_content	=> 1
	);
	
	$c->res->header( 'content-type', 'application/octet-stream' );
	$c->res->header('Content-Disposition', qq[attachment; filename=$name]);
		
    $c->res->body($content);
    
    $c->detach();
}

sub slug_name: Private {
	my ( $self, $name ) = @_;
	
	return 0 unless $name;
	
	my $slug_name = lc join '_', split /\s/, $name;
	
	return $slug_name;
}

__PACKAGE__->meta->make_immutable;

1;