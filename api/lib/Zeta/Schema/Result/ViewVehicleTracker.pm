use utf8;

package Zeta::Schema::Result::ViewVehicleTracker;
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
      /
);

# do not attempt to deploy() this view
__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(
     q[
		SELECT
			lat,
			lng,
			track_event as track_event,
			speed as speed
		FROM
			vehicle_tracker
		WHERE 
			id
		IN
		(
			SELECT
				min(id)
			FROM
				vehicle_tracker
			WHERE
				tracker_id = ?
			AND
				track_event
				BETWEEN ? AND ?
				AND lat <> -91
				AND lng <> -181
				AND lat <> 0
				AND lng <> 0
				AND speed >= 0
			GROUP BY 
				date_trunc('hour', track_event) + date_part('minute', track_event)::int / 2 * interval '2 minutes'
		)
    ]
     
     
# SELECT
# lat,
# lng,
# min(track_event) - interval '3 hours' as track_event,
# max(speed) as speed
# FROM
# vehicle_tracker
# WHERE
# track_event
# BETWEEN ? AND ?
# AND lat <> -91
# AND lng <> -181
# AND lat <> 0
# AND lng <> 0
# AND tracker_id = ?
# AND speed >= 0
# GROUP BY lat,lng
# ORDER BY track_event
     
     
#     q[
#         SELECT
#             lat,
#             lng,
#             tracker_id,
#             min(track_event) as track_event,
#             max(speed) as speed
#         FROM
#             vehicle_tracker
#         WHERE
#         lat <> -91
#         AND lng <> -181
#         AND tracker_id in (SELECT id FROM tracker where status = '2')
#         GROUP BY tracker_id,lat,lng
#         ORDER BY track_event
#     ]

);

1;