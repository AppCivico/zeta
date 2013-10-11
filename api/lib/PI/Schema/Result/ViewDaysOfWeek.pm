use utf8;

package PI::Schema::Result::ViewDaysOfWeek;
use strict;
use warnings;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

# For the time being this is necessary even for virtual views
__PACKAGE__->table('ViewDaysOfWeek');

__PACKAGE__->add_columns(
    qw/
      dow
      /
);

# do not attempt to deploy() this view
__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(
    q[
        select array( select distinct x from (
            SELECT t.id, t.days_of_week[t_idx.idx] as x
            FROM vehicle_route as t,
            (SELECT id, generate_series(1,array_upper(days_of_week, 1)) as idx FROM vehicle_route where vehicle_id = ?) as t_idx
            WHERE t.id = t_idx.id
            and
            vehicle_id = ?
        ) x order by 1 ) as dow
    ]
);

1;