package PI::Types;
our $ONLY_DIGITY = sub { my ($val) = @_; $val =~ s/[^0-9]//g; $val };

use MooseX::Types -declare => [
    qw(
      DataStr
      TimeStr
      RenavamStr
      )
];
use MooseX::Types::Moose qw(ArrayRef HashRef CodeRef Str ScalarRef);
use Moose::Util::TypeConstraints;

use DateTime::Format::Pg;
use PI::Data::Renavam;

subtype DataStr, as Str, where {
    eval { DateTime::Format::Pg->parse_datetime($_)->datetime };
    return $@ eq '';
}, message { "$_ data invalida" };

coerce DataStr, from Str, via {
    DateTime::Format::Pg->parse_datetime($_)->datetime;
};

subtype TimeStr, as Str, where {
    eval { DateTime::Format::Pg->parse_time($_)->hms };
    return $@ eq '';
}, message { "$_ data invalida" };

coerce TimeStr, from Str, via {
    DateTime::Format::Pg->parse_time($_)->hms;
};

subtype RenavamStr, as Str, where {
    eval { PI::Data::Renavam::new $_ };
    return $@ eq '';
}, message { "$_ documento inválido   " };

coerce RenavamStr, from Str, via {
    PI::Data::Renavam->new($_); return $_;
};

1;