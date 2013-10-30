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

=head2 validation_key

  data_type: 'text'
  is_nullable: 1

=head2 gender

  data_type: 'enum'
  extra: {custom_type_name => "gender",list => ["m","f"]}
  is_nullable: 1

=head2 documents_validated

  data_type: 'boolean'
  default_value: false
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
  "validation_key",
  { data_type => "text", is_nullable => 1 },
  "gender",
  {
    data_type => "enum",
    extra => { custom_type_name => "gender", list => ["m", "f"] },
    is_nullable => 1,
  },
  "documents_validated",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
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

=head2 C<driver_validation_key_key>

=over 4

=item * L</validation_key>

=back

=cut

__PACKAGE__->add_unique_constraint("driver_validation_key_key", ["validation_key"]);

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

=head2 instalation_kits

Type: has_many

Related object: L<PI::Schema::Result::InstalationKit>

=cut

__PACKAGE__->has_many(
  "instalation_kits",
  "PI::Schema::Result::InstalationKit",
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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-30 18:12:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c+jRYxXk6B5n5UCBwoxqhw

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
                name => {
                    required => 0,
                    type     => 'Str',
                    post_check => sub {
                        my $r       = shift;
                        my $name    = $r->get_value('name');

                        return 0 if $name !~ /^[^\d]+$/ ;
                        return 0 if length($name) <= 1;

                        return 1;
                    }
                },
                birth_date => {
                    required => 0,
                    type     => DataStr,
                    post_check => sub {
                        my $r   = shift;
                        my $now = DateTime->now();
                        my $date     = eval { DateTime::Format::Pg->parse_datetime($r->get_value('birth_date')) };
                        my $interval = eval{$now->subtract_datetime( $date )};

                        return 1 if $interval->years >= 18 && $interval->years < 120;

                        return 0;
                    }
                },
                cpf => {
                    required => 0,
                    type     => CPF,
                    filters => [$PI::Types::ONLY_DIGITY],
                    post_check => sub {
                        my $r = shift;
                        my $str = $r->get_value('cpf');
                        return 0 if $str =~ /^(\d)\1*$/ ;
                        return 1 if $self->cpf eq $str;
                        return 0 if $self->resultset_find( { cpf => $str } );
                        return 1;
                    }
                },
                cnh_code => {
                    required => 0,
                    type     => 'Str',
                    post_check => sub {
                        my $r   = shift;
                        my $cnh = $r->get_value('cnh_code');

                        return 0 if $cnh !~ /^[\d]+$/ ;
                        return 0 if length($cnh) != 11;

                        return 1;
                    }
                },
                cnh_validity => {
                    required => 0,
                    type     => DataStr,
                    post_check => sub {
                        my $r       = shift;
                        my $now     = DateTime->now();
                        my $date    = eval { DateTime::Format::Pg->parse_datetime($r->get_value('cnh_validity')) };
                        my $cmp     = DateTime->compare($now, $date);

                        return 1 if $cmp <= 0;

                        return 0;
                    }
                },
                first_driver_license => {
                    required => 0,
                    type     => DataStr,
                    post_check => sub {
                        my $r   = shift;

                        if ($r->get_value('birth_date')) {
                            my $birth_date      = eval { DateTime::Format::Pg->parse_datetime($r->get_value('birth_date')) };
                            my $first_license   = eval { DateTime::Format::Pg->parse_datetime($r->get_value('first_driver_license')) };

                            if(DateTime->compare($first_license, $birth_date) > 0) {
                                my $interval = eval{$first_license->subtract_datetime( $birth_date )};
                                return 1 if $interval->years >= 18;
                            }
                        }

                        return 0;
                    }
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
                gender => {
                    required    => 0,
                    type        => 'Str'
                },
                email => {
                    required   => 0,
                    type       => EmailAddress,
                    dependent => {
                        email_confirm => {
                            required => 1,
                            type     => EmailAddress,
                        },
                    },
                    post_check => sub {
                        my $r = shift;
                        return 0 if ( $self->resultset('User')->find( { email => lc $r->get_value('email') } )
                        || $r->get_value('email') ne $r->get_value('email_confirm'));

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
            delete $values{email_confirm};
            $self->user->update({ email => delete $values{email} } ) if (exists $values{email});

            my $driver = $self->update( \%values );

            return $driver;
        },

    };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
