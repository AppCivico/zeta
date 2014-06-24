package Zeta::TraitFor::Controller::DefaultCRUD;

use Moose::Role;

with 'Zeta::TraitFor::Controller::Search';
with 'Zeta::TraitFor::Controller::AutoBase';
with 'Zeta::TraitFor::Controller::AutoObject';
with 'Zeta::TraitFor::Controller::CheckRoleForPUT';
with 'Zeta::TraitFor::Controller::CheckRoleForPOST';

1;

