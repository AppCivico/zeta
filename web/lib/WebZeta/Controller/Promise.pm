package WebZeta::Controller::Promise;
use Moose;
use namespace::autoclean;
use MIME::Base64;
use URI;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/root') : PathPart('') : CaptureArgs(0) {
	my ( $self, $c ) = @_;
    
	my $api = $c->model('API');
	
	$api->stash_result(
		$c, 'categories',
		params => {
			order   => 'name',
		}
	);
	$c->stash->{select_categories} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{categories} } ];
	
	$api->stash_result(
		$c, 'candidates',
		params => {
			order   => 'name',
		}
	);
	$c->stash->{select_candidates} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{candidates} } ];
	
	$api->stash_result(
		$c, 'states',
		params => {
			order   => 'name',
		}
	);
	$c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];
}

sub index : Chained('base') : PathPart('promises') : Args(0) {
	my ( $self, $c ) = @_;

	my $api = $c->model('API');

	$api->stash_result(
	$c, 'promises',
		params => {
			state_id 		=> $c->req->params->{state_id} ? $c->req->params->{state_id} : undef,
			category_id 	=> $c->req->params->{category_id} ? $c->req->params->{category_id} : undef,
			candidate_id 	=> $c->req->params->{candidate_id} ? $c->req->params->{candidate_id} : undef,
		}
	);

	my %candidates;
	my $candidate_id = 0;
	my @info;
	my $i = 0;
     
	foreach my $promise ( @{ $c->stash->{promises} } ) {
	
		if( $candidate_id != $promise->{candidate}{id} ) {
		
			$candidates{$promise->{candidate}{name}} 				= $promise->{candidate};
			$candidates{$promise->{candidate}{name}}{campaign_year} = $promise->{election_campaign}{year},
				
			$candidates{$promise->{candidate}{name}}{political_position}
				= $promise->{election_campaign}{political_position}{position};
				
			$candidate_id = $promise->{candidate}{id};

			$candidates{$promise->{candidate}{name}}{promises} = [];
			
		}
		
		push($candidates{$promise->{candidate}{name}}{promises}, {
			id 					=> $promise->{id},
			name 				=> $promise->{name},
			source 				=> $promise->{source},
			description 		=> $promise->{description},
			category_name		=> $promise->{category}{name},
		});
		
	}
	
	if ( $c->stash->{error} ) {
        $c->detach( '/form/redirect_error', ['/root/index'], 'Ocorreu um erro ao acessar as promessas.' );
    } else {
		$c->stash->{promises} = \%candidates;
    }
    
}

__PACKAGE__->meta->make_immutable;

1;