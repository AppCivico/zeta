use utf8;
package PI::Schema::Result::Driver;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::Driver

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<driver>

=cut

__PACKAGE__->table("driver");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'driver_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 last_name

  data_type: 'text'
  is_nullable: 0

=head2 birth_date

  data_type: 'date'
  is_nullable: 0

=head2 cpf

  data_type: 'text'
  is_nullable: 0

=head2 first_driver_license

  data_type: 'date'
  is_nullable: 0

=head2 cnh_code

  data_type: 'text'
  is_nullable: 0

=head2 cnh_validity

  data_type: 'date'
  is_nullable: 0

=head2 mobile_provider

  data_type: 'text'
  is_nullable: 0

=head2 mobile_number

  data_type: 'text'
  is_nullable: 0

=head2 telephone_number

  data_type: 'text'
  is_nullable: 0

=head2 marital_state

  data_type: 'char'
  is_nullable: 0
  size: 1

=head2 address

  data_type: 'text'
  is_nullable: 1

=head2 neighborhood

  data_type: 'text'
  is_nullable: 1

=head2 complement

  data_type: 'text'
  is_nullable: 1

=head2 number

  data_type: 'text'
  is_nullable: 1

=head2 postal_code

  data_type: 'text'
  is_nullable: 1

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 created_by

  data_type: 'integer'
  is_nullable: 0

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "driver_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "last_name",
  { data_type => "text", is_nullable => 0 },
  "birth_date",
  { data_type => "date", is_nullable => 0 },
  "cpf",
  { data_type => "text", is_nullable => 0 },
  "first_driver_license",
  { data_type => "date", is_nullable => 0 },
  "cnh_code",
  { data_type => "text", is_nullable => 0 },
  "cnh_validity",
  { data_type => "date", is_nullable => 0 },
  "mobile_provider",
  { data_type => "text", is_nullable => 0 },
  "mobile_number",
  { data_type => "text", is_nullable => 0 },
  "telephone_number",
  { data_type => "text", is_nullable => 0 },
  "marital_state",
  { data_type => "char", is_nullable => 0, size => 1 },
  "address",
  { data_type => "text", is_nullable => 1 },
  "neighborhood",
  { data_type => "text", is_nullable => 1 },
  "complement",
  { data_type => "text", is_nullable => 1 },
  "number",
  { data_type => "text", is_nullable => 1 },
  "postal_code",
  { data_type => "text", is_nullable => 1 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "created_by",
  { data_type => "integer", is_nullable => 0 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<driver_cpf_key>

=over 4

=item * L</cpf>

=back

=cut

__PACKAGE__->add_unique_constraint("driver_cpf_key", ["cpf"]);

=head1 RELATIONS

=head2 city

Type: belongs_to

Related object: L<PI::Schema::Result::City>

=cut

__PACKAGE__->belongs_to(
  "city",
  "PI::Schema::Result::City",
  { id => "city_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 contracts

Type: has_many

Related object: L<PI::Schema::Result::Contract>

=cut

__PACKAGE__->has_many(
  "contracts",
  "PI::Schema::Result::Contract",
  { "foreign.driver_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user

Type: belongs_to

Related object: L<PI::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "PI::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 vehicles

Type: has_many

Related object: L<PI::Schema::Result::Vehicle>

=cut

__PACKAGE__->has_many(
  "vehicles",
  "PI::Schema::Result::Vehicle",
  { "foreign.driver_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);



# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-08-23 14:17:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:veEOI3snpVKyXXT0j1ml1A

with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use PI::Types qw /DataStr/;

sub verifiers_specs {
    my $self = shift;
    return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                name => {
                    required => 0,
                    type     => 'Str',
                },
                last_name => {
                    required => 0,
                    type     => 'Str',
                },
                birth_date => {
                    required => 0,
                    type     => DataStr,
                },
                cpf => {
                    required => 0,
                    type     => 'Str',
                },
                cnh_code => {
                    required => 0,
                    type     => 'Str',
                },
                cnh_validity => {
                    required => 0,
                    type     => DataStr,
                },
                first_driver_license => {
                    required => 0,
                    type     => DataStr,
                },
                mobile_provider => {
                    required => 0,
                    type     => 'Str',
                },
                mobile_number => {
                    required => 0,
                    type     => 'Str',
                },
                telephone_number => {
                    required => 0,
                    type     => 'Str',
                },
                marital_state   => {
                    required => 0,
                    type     => 'Str',
                },
                address => {
                    required => 0,
                    type     => 'Str',
                },
                neighborhood => {
                    required => 0,
                    type     => 'Str',
                },
                complement => {
                    required => 0,
                    type     => 'Str',
                },
                number  => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code => {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                email => {
                    required   => 0,
                    type       => EmailAddress,
                    post_check => sub {
                        my $r = shift;
                        return 0 if $self->resultset('User')->search( {
                            email => $r->get_value('email'),
                            id => { '!=' => $self->user_id }
                        } )->count;

                        return 1;
                      }
                },
            },
        ),
    };
}

sub action_specs {
    my $self = shift;
    return {
        update => sub {
            my %values = shift->valid_values;

            not defined $values{$_} and delete $values{$_} for keys %values;

            $self->user->update({ email => delete $values{email} } ) if (exists $values{email});

            my $driver = $self->update( \%values );

            return $driver;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
