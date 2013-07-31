package PI::Types;

use MooseX::Types -declare => [
    qw( DataStr
      )
];
use MooseX::Types::Moose qw(ArrayRef HashRef CodeRef Str ScalarRef);
use Moose::Util::TypeConstraints;

use DateTime::Format::Pg;

subtype DataStr, as Str, where {
    eval { DateTime::Format::Pg->parse_datetime($_)->datetime };
    return $@ eq '';
}, message { "$_ data invalida" };

coerce DataStr, from Str, via {
    DateTime::Format::Pg->parse_datetime($_)->datetime;
};

1;
