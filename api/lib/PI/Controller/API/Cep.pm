package PI::Controller::API::Cep;

use Moose;
use WWW::Correios::CEP;
use Text2URI;
use JSON::XS;
my $url_parser = Text2URI->new;

BEGIN { extends 'Catalyst::Controller::REST' }

__PACKAGE__->config(
    default => 'application/json',

    result => 'DB::CepCache',
);
with 'PI::TraitFor::Controller::AutoBase';

sub base : Chained('/api/base') : PathPart('cep') : CaptureArgs(0) { }

sub object : Chained('base') : PathPart('') : CaptureArgs(0) { }

sub result : Chained('object') : PathPart('') : Args(0) : ActionClass('REST') { }

sub result_GET {
    my ( $self, $c ) = @_;

    my $address = $c->stash->{collection}->search( { postal_code => $c->req->params->{postal_code} } )->next;

    if ( !$address ) {
        my $TIMEOUT_IN_SECONDS = 5;
        eval {
            local $SIG{ALRM} = sub { die "alarm\n" };
            alarm($TIMEOUT_IN_SECONDS);

            eval {
                my $ua = LWP::UserAgent->new;

                my $cepper = new WWW::Correios::CEP(
                    require_tests => 0
                );

                my $new_address = $cepper->find( $c->req->params->{postal_code} );
                alarm(0);

                die {'postal_code.invalid'} unless $new_address;
                die { 'postal_code.invalid: ' . $new_address->{status} } if $new_address->{status};

                my $uf = $c->model('DB::State')->search( { uf => $new_address->{uf} } )->next;

                my $city_url = $url_parser->translate( $new_address->{location} );

                my $city = $c->model('DB::City')->search( { name_url => $city_url, state_id => $uf->id } )->next;

                if ( !$city ) {
                    $city = $c->model('DB::City')->create(
                        {
                            name       => $new_address->{location},
                            name_url   => $city_url,
                            state_id   => $uf->id,
                            country_id => 1
                        }
                    );
                }
                $new_address->{cep} =~ s/[^\d]//g;

                $address = $c->stash->{collection}->create(
                    {
                        address      => $new_address->{street},
                        postal_code  => $new_address->{cep},
                        neighborhood => $new_address->{neighborhood},
                        city_id      => $city->id,
                        state_id     => $uf->id,
                        location     => $new_address->{location},
                    }
                );
            };

            if ( $@ && ref $@ eq 'HASH' ) {

                $self->status_bad_request( $c, message => encode_json($@) ), $c->detach;
            }
            elsif ($@) {
                $self->status_bad_request( $c, message => "$@" ), $c->detach;
            }
        };
        if ($@) {
            $self->status_bad_request( $c, message => 'timeout' ), $c->detach;
        }
    }

    $self->status_ok(
        $c,
        entity => {
            map { $_ => $address->$_, }
              qw(
              address
              postal_code
              neighborhood
              city_id
              state_id
              location
              )
        }
    );
}

1;
