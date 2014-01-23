use utf8;
package PI::Schema::Result::PreRegistration;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PI::Schema::Result::PreRegistration

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

=head1 TABLE: C<pre_registration>

=cut

__PACKAGE__->table("pre_registration");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'pre_registration_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 gender

  data_type: 'enum'
  extra: {custom_type_name => "gender",list => ["m","f"]}
  is_nullable: 0

=head2 birth_date

  data_type: 'date'
  is_nullable: 0

=head2 marital_state

  data_type: 'char'
  is_nullable: 1
  size: 1

=head2 email

  data_type: 'text'
  is_nullable: 0

=head2 telephone

  data_type: 'text'
  is_nullable: 1

=head2 city_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 zone_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 manufactured_year

  data_type: 'integer'
  is_nullable: 1

=head2 average_mileage

  data_type: 'numeric'
  is_nullable: 1

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=head2 postal_code_job

  data_type: 'integer'
  is_nullable: 1

=head2 postal_code_home

  data_type: 'integer'
  is_nullable: 1

=head2 postal_code_college

  data_type: 'integer'
  is_nullable: 1

=head2 record_origin

  data_type: 'text'
  default_value: 'site'
  is_nullable: 0

=head2 fb_id

  data_type: 'integer'
  is_nullable: 1

=head2 fb_code

  data_type: 'text'
  is_nullable: 1

=head2 fb_timestamp

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "pre_registration_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "gender",
  {
    data_type => "enum",
    extra => { custom_type_name => "gender", list => ["m", "f"] },
    is_nullable => 0,
  },
  "birth_date",
  { data_type => "date", is_nullable => 0 },
  "marital_state",
  { data_type => "char", is_nullable => 1, size => 1 },
  "email",
  { data_type => "text", is_nullable => 0 },
  "telephone",
  { data_type => "text", is_nullable => 1 },
  "city_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "zone_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "manufactured_year",
  { data_type => "integer", is_nullable => 1 },
  "average_mileage",
  { data_type => "numeric", is_nullable => 1 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
  "postal_code_job",
  { data_type => "integer", is_nullable => 1 },
  "postal_code_home",
  { data_type => "integer", is_nullable => 1 },
  "postal_code_college",
  { data_type => "integer", is_nullable => 1 },
  "record_origin",
  { data_type => "text", default_value => "site", is_nullable => 0 },
  "fb_id",
  { data_type => "integer", is_nullable => 1 },
  "fb_code",
  { data_type => "text", is_nullable => 1 },
  "fb_timestamp",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

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

=head2 zone

Type: belongs_to

Related object: L<PI::Schema::Result::Zone>

=cut

__PACKAGE__->belongs_to(
  "zone",
  "PI::Schema::Result::Zone",
  { id => "zone_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2014-01-23 16:46:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LVTvtP4LzKBipV2/nIJcqQ
with 'PI::Role::Verification';
with 'PI::Role::Verification::TransactionalActions::DBIC';
with 'PI::Schema::Role::ResultsetFind';

use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress/;
use MooseX::Types::CPF qw(CPF);
use PI::Types qw /DataStr/;

sub verifiers_specs {
    my $self = shift;
     return {
        update => Data::Verifier->new(
            filters => [qw(trim)],
            profile => {
                email=> {
                    required    => 0,
                    type        => 'Str',
                    post_check  => sub {
                        my $r   = shift;
                        my $ret = 1;

                        eval {
                            $ret = 0
                            if (
                                $self->resultset('User')->find( { email => lc $r->get_value('email') } )
                                || $self->resultset('PreRegistration')->find( { email => lc $r->get_value('email') } )
                            );
                        };
                        return 0 if $@;

                        return $ret;
                    }
                },
                name=> {
                    required => 0,
                    type     => 'Str',
                },
                birth_date=> {
                    required => 0,
                    type     => DataStr,
                },
                telephone=> {
                    required => 0,
                    type     => 'Str',
                },
                city_id => {
                    required => 0,
                    type     => 'Int',
                },
                zone_id => {
                    required => 0,
                    type     => 'Int',
                },
                manufactured_year => {
                    required => 0,
                    type     => 'Int',
                },
                average_mileage => {
                    required => 0,
                    type     => 'Num',
                },
                marital_state => {
                    required => 0,
                    type     => 'Str',
                },
                gender => {
                    required => 0,
                    type     => 'Str',
                },
                postal_code_college => {
                    required => 0,
                    type     => 'Int',
                },
                postal_code_home=> {
                    required => 0,
                    type     => 'Int',
                },
                postal_code_job => {
                    required => 0,
                    type     => 'Int',
                },
                record_origin => {
                    required => 0,
                    type     => 'Str',
                },
                fb_id => {
                    required => 0,
                    type     => 'Int',
                },
                fb_code => {
                    required => 0,
                    type     => 'Str',
                },
                fb_timestamp => {
                    required => 0,
                    type     => 'Str',
                },
            }
        ),
    };
}

sub action_specs {
    my $self = shift;
    return {
        update => sub {
            my %values = shift->valid_values;

            not defined $values{$_} and delete $values{$_} for keys %values;

            my $pre_registration = $self->update( \%values );

            return $pre_registration;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
