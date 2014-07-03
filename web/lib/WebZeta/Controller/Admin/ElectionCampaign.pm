package WebZeta::Controller::Admin::ElectionCampaign;
use Moose;
use namespace::autoclean;
use POSIX;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('election_campaign') : CaptureArgs(0) {
	my ( $self, $c ) = @_;

	my $api = $c->model('API');
	
	$api->stash_result(
		$c, 'political_positions',
		params => {
			order   => 'position',
		}
	);
	$c->stash->{select_positions} = [ map { [ $_->{id}, $_->{position} ] } @{ $c->stash->{political_positions} } ];

	$api->stash_result(
		$c, 'cities',
		params => {
			order   => 'name',
		}
	);
	$c->stash->{select_cities} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{cities} } ];
	
	$api->stash_result(
		$c, 'states',
		params => {
			order   => 'name',
		}
	);
	$c->stash->{select_states} = [ map { [ $_->{id}, $_->{name} ] } @{ $c->stash->{states} } ];
	
	$api->stash_result(
		$c, 'political_parties',
		params => {
			order   => 'name',
		}
	);
	$c->stash->{select_parties} = [ map { [ $_->{id}, $_->{acronym} ] } @{ $c->stash->{political_parties} } ];
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
	my ( $self, $c, $id ) = @_;

	my $api = $c->model('API');

	$api->stash_result(
		$c, [ 'election_campaigns', $id ],
		stash => 'election_campaign_obj'
	);
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    my $api     = $c->model('API');
    my $form    = $c->model('Form');
    
    my $item_per_page 	= 10;
	my $page 			= $c->req->params->{page} || 1;

    if( $c->req->params->{name} ) {
        my @fields;
        my $params = { %{ $c->req->params } };
        
        $c->stash->{name}	= $c->req->params->{name};

        $api->stash_result(
            $c, 'election_campaigns',
            params => {
#                 name		=> $params->{name} ? $params->{name} : undef,
                page		=> $page,
                pagination 	=> 1
            }
        );
    } else {
        $api->stash_result(
            $c, 'election_campaigns',
            params => {
                page		=> $page,
                pagination 	=> 1
            }
        );
    }
    
    $c->stash->{count_partial} 	= scalar keys $c->stash->{election_campaigns};
	$c->stash->{total}   		= $c->stash->{count};
	$c->stash->{results} 		= $c->stash->{election_campaigns};

	$c->stash(
		current_page  => $page,
		item_per_page => $item_per_page
	);

	$c->stash->{pag_req}     = $c->req;
	$c->stash->{total_pages} = int( ceil( $c->stash->{total} / $c->stash->{item_per_page} ) );

	$c->stash->{previous_page} = ( $page > 1 )                         ? $page - 1 : '';
	$c->stash->{next_page}     = ( $page < $c->stash->{total_pages} )  ? $page + 1 : '';
	$c->stash->{first_page}    = ( $page == 1 )                        ? ''        : 1;
	$c->stash->{last_page}     = ( $page >= $c->stash->{total_pages} ) ? ''        : $c->stash->{total_pages};
}

sub add : Chained('base') : PathPart('new') : Args(0) {

}

sub edit : Chained('object') : PathPart('') : Args(0) {

}

sub filter_candidate_by_party : Chained('base') : PathPart('filter_candidate') : Args(1) {
	my ( $self, $c, $party_id ) = @_;
	
	 my $api = $c->model('API');
	
	$api->stash_result(
		$c, 'candidates',
		params => {
			order   			=> 'name',
			political_party_id 	=> $party_id
		}
	);
	
	$c->stash(
        candidates 		=>$c->stash->{candidates},
        template        => 'auto/candidates.tt',
        without_wrapper => 1,
    );
}

__PACKAGE__->meta->make_immutable;

1;