package PI::TraitFor::Controller::Search;

use Moose::Role;
use Moose::Util::TypeConstraints;

around list_GET => sub {
    my $orig = shift;
    my $self = shift;

    my ($c) = @_;

    my %may_search;
    my %order;

    if ( exists $self->config->{search_ok} ) {
        foreach my $key_ok ( keys %{ $self->config->{search_ok} } ) {
            if($key_ok eq 'order') {
                $order{order_by} = $c->req->params->{$key_ok} ;
                $may_search{$key_ok} = $c->req->params->{$key_ok} if exists $c->req->params->{$key_ok};
            } else {
                $may_search{$key_ok} = $c->req->params->{$key_ok} if exists $c->req->params->{$key_ok};
            }

        }
    }

    foreach my $key ( keys %may_search ) {

        my $type = $self->config->{search_ok}{$key};
        my $val  = $may_search{$key};

        my $cons = Moose::Util::TypeConstraints::find_or_parse_type_constraint($type);

        $self->status_bad_request( $c, message => "Unknown type constraint '$type'" ), $c->detach
          unless defined($cons);

        if ( !$cons->check($val) ) {
            $self->status_bad_request( $c, message => "invalid param $key" ), $c->detach;
        }
    }

    if(exists($may_search{order})) {
        delete $may_search{order};
    }

    foreach my $k (keys %may_search) {
        if($k !~ /\./) {
            $may_search{"me.$k"} = delete $may_search{$k};
        }
    }
    $c->stash->{collection} = $c->stash->{collection}->search( {%may_search}, {%order} )
      if %may_search;

    $self->$orig(@_);
};

1;

