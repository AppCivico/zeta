package Zeta::Schema::ResultSet::Zone;
use namespace::autoclean;

use utf8;
use Moose;
extends 'DBIx::Class::ResultSet';
with 'Zeta::Schema::Role::InflateAsHashRef';

1;