package PI::TraitFor::Controller::DefaultCRUD;

use Moose::Role;


with 'PI::TraitFor::Controller::Search';
with 'PI::TraitFor::Controller::AutoBase';
with 'PI::TraitFor::Controller::AutoObject';
with 'PI::TraitFor::Controller::CheckRoleForPUT';
with 'PI::TraitFor::Controller::CheckRoleForPOST';


1;

