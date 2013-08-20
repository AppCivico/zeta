package WebPI::Model::Form;
use base 'Catalyst::Model';
use Moose;
use utf8;

sub initialize_after_setup {
}

sub format_date {
    my ($self, $ref, @fields) = @_;

    foreach my $f (@fields) {
        my $date = $ref->{$f};
        my ($d,$m,$y) = $date =~ m/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/;
        $ref->{$f} = "$y-$m-$d";
    }

}

sub cut_off_str {
    my ($self, $ref, @fields) = @_;

    foreach my $f (@fields) {
        $ref->{$f} =~ s/[^\d]//g;
    }

}

1;