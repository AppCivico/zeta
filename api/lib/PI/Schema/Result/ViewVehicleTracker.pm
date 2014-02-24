use utf8;

package PI::Schema::Result::ViewVehicleTracker;
use strict;
use warnings;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

# For the time being this is necessary even for virtual views
__PACKAGE__->table('ViewVehicleTracker');

__PACKAGE__->add_columns(
    qw/
      lat
      lng
      track_event
      speed
      tracker_id
      /
);

# do not attempt to deploy() this view
__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(
#     q[
#         SELECT
#             lat,
#             lng,
#             min(track_event) as track_event,
#             max(speed) as speed
#         FROM
#             vehicle_tracker
#         WHERE
#             track_event
#         BETWEEN ? AND ?
#         AND lat <> -91
#         AND lng <> -181
#         AND tracker_id = ?
#         AND vehicle_id = ?
#         AND speed > 0
#         GROUP BY lat,lng
#         ORDER BY track_event
#     ]
    q[
        SELECT
            lat,
            lng,
            tracker_id,
            min(track_event) as track_event,
            max(speed) as speed
        FROM
            vehicle_tracker
        WHERE
        lat <> -91
        AND lng <> -181
        AND tracker_id in (SELECT id FROM tracker where status = '2')
        GROUP BY tracker_id,lat,lng
        ORDER BY track_event
    ]
);

1;