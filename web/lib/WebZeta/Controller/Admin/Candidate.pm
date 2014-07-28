package WebZeta::Controller::Admin::Candidate;
use Moose;
use namespace::autoclean;
use POSIX;
use Cwd qw();

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/admin/base') : PathPart('candidate') : CaptureArgs(0) {
	my ( $self, $c ) = @_;

	my $api = $c->model('API');

	$api->stash_result(
		$c, 'political_parties',
		params => {
			status	=> 1,
			order   => 'acronym',
		}
	);

	$c->stash->{select_parties} = [ map { [ $_->{id}, $_->{acronym} ] } @{ $c->stash->{political_parties} } ];
}

sub object : Chained('base') : PathPart('') : CaptureArgs(1) {
	my ( $self, $c, $id ) = @_;

	my $api = $c->model('API');

	$api->stash_result(
		$c, [ 'candidates', $id ],
		stash => 'candidate_obj'
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
            $c, 'candidates',
            params => {
                name	=> $params->{name} ? $params->{name} : undef,
                page	=> $page,
            }
        );
    } else {
        $api->stash_result(
            $c, 'candidates',
            params => {
                page => $page,
            }
        );
    }
    
    $c->stash->{count_partial} 	= scalar keys $c->stash->{candidates};
	$c->stash->{total}   		= $c->stash->{count};
	$c->stash->{results} 		= $c->stash->{candidates};

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

sub edit: Chained('object') : PathPart('') : Args(0) {
}

sub download: Chained('object') : PathPart('download') : Args(0) {
	my ( $self, $c ) = @_;

	my $api = $c->model('API');

	my $path 		= Cwd::cwd();
    my $full_path 	= $path.'/../etc/uploads/'.$c->stash->{candidate_obj}{id}.'/'.$c->stash->{candidate_obj}{government_program};
    
    my $name = $self->slug_name($self, $c->stash->{candidate}{name});
    
	my $content = $api->stash_result(
		$c, 'download-files',
		params => {
			path	=> $full_path,
			name	=> 'programa_de_governo'
		},
		get_as_content	=> 1
	);
	
	$c->res->header( 'content-type', 'application/octet-stream' );

    $c->res->body($content);
    
    $c->detach();
}

sub slug_name: Private {
	my ( $self, $name ) = @_;
	
	my @name = join '-', lc split /\s/, $name;
	
	use DDP; p @name; exit;
}

__PACKAGE__->meta->make_immutable;

1;