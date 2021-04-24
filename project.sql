DROP VIEW IF EXISTS cyclosm_ways;
CREATE VIEW cyclosm_ways AS
    SELECT
        way,
        COALESCE(
        CASE
            WHEN highway='raceway' THEN 'track'  -- render raceways as tracks
            WHEN highway='road' THEN 'residential'  -- render "road" as residential
            WHEN highway='trunk' THEN 'motorway'  -- trunk as motorway, check can_bicycle if cyclable
            WHEN highway='trunk_link' THEN 'motorway_link'  -- trunk as motorway
            WHEN highway='footway' AND (bicycle='yes' OR bicycle='designated') THEN 'path'
            WHEN highway='bridleway' AND (bicycle='yes' OR bicycle='designated') THEN 'path'
            WHEN highway!='bus_guideway' THEN highway
            ELSE NULL
        END,
        CASE
            WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
            ELSE NULL
        END
        ) AS type,
        access,
        layer,
        CASE
            WHEN tags->'maxspeed'~E'^\\d+$' THEN (tags->'maxspeed')::integer
            WHEN tags->'maxspeed'~E'^\\d+ mph$' THEN REPLACE(tags->'maxspeed', ' mph', '')::integer * 1.609344
            WHEN tags->'maxspeed'~E'^\\d+ knots$' THEN REPLACE(tags->'maxspeed', ' knots', '')::integer * 1.852
            WHEN tags->'maxspeed'='walk' THEN 5
            ELSE NULL
        END AS maxspeed_kmh,
        bicycle,
        CASE
            WHEN COALESCE(motorcar, tags->'motor_vehicle', tags->'vehicle', access, 'yes') NOT IN ('no', 'private') THEN 'yes'
            -- goods and hgv don't need COALESCE chains, because the next step would be motorcar, which is checked above
            WHEN tags->'goods' NOT IN ('no', 'private') THEN 'yes'
            WHEN tags->'hgv' NOT IN ('no', 'private') THEN 'yes'
            -- moped and mofa are not checked, since most countries that have separate access controls for them treat them as quasi-bicycles
            WHEN COALESCE(tags->'motorcycle', tags->'motor_vehicle', tags->'vehicle', access, 'yes') NOT IN ('no', 'private') THEN 'yes'
            -- TODO: style psv-only roads slightly differently
            -- bus only needs to have its COALESCE chain go up to psv, because the next step would be motorcar, which is checked above
            WHEN COALESCE(tags->'bus', tags->'psv') NOT IN ('no', 'private') THEN 'psv'
            WHEN tags->'taxi' NOT IN ('no', 'private') THEN 'psv'
            ELSE 'no'
        END AS motor_vehicle,
        CASE
            WHEN tags->'cyclestreet' IN ('yes') THEN 'yes'
            WHEN tags->'bicycle_road' IN ('yes') THEN 'yes'
            ELSE 'no'
        END AS cyclestreet,
        CASE
            WHEN oneway IN ('yes', '-1') THEN oneway
            WHEN junction IN ('roundabout') AND (oneway IS NULL OR NOT oneway IN ('no', 'reversible')) THEN 'yes'
            ELSE 'no'
        END AS oneway,
        CASE
            WHEN tags->'cycleway:left' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:left:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:left' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:left:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:left' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway:both' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:both:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:both' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:both:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:both' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'cycleway' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'cycleway' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            ELSE NULL
        END AS cycleway_left_render,
        CASE
            WHEN tags->'cycleway:right' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:right:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:right' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:right:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:right' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway:both' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:both:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:both' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:both:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:both' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'cycleway' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'cycleway' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            ELSE NULL
        END AS cycleway_right_render,
        CASE
            WHEN tags->'cycleway:left:oneway' IS NOT NULL THEN tags->'cycleway:left:oneway'
            WHEN tags->'cycleway:left' IN ('opposite_lane', 'opposite_track', 'opposite_share_busway') THEN '-1'
            WHEN tags->'cycleway' IN ('opposite_lane', 'opposite_track', 'opposite_share_busway') THEN '-1'
            ELSE NULL
        END AS cycleway_left_oneway,
        CASE
            WHEN tags->'cycleway:right:oneway' IS NOT NULL THEN tags->'cycleway:right:oneway'
            WHEN tags->'cycleway:right' IN ('opposite_lane', 'opposite_track', 'opposite_share_busway') THEN '-1'
            WHEN tags->'cycleway' IN ('opposite_lane', 'opposite_track', 'opposite_share_busway') THEN '-1'
            ELSE NULL
        END AS cycleway_right_oneway,
        CASE
            WHEN bicycle IN ('no', 'private', 'use_sidepath') THEN 'no'
            WHEN bicycle IS NOT NULL THEN bicycle
            WHEN tags->'motorroad' IN ('yes') THEN 'no'
            WHEN highway IN ('motorway', 'motorway_link') THEN 'no'
            WHEN tags->'vehicle' IN ('no', 'private') THEN 'no'
            WHEN tags->'vehicle' IS NOT NULL THEN tags->'vehicle'
            WHEN access IN ('no', 'private') THEN 'no'
            WHEN access IS NOT NULL THEN access
            ELSE NULL
        END AS can_bicycle,
        CASE
            WHEN tags->'segregated' IN ('yes') THEN 'yes'
            ELSE 'no'
        END AS segregated,
        CASE
            WHEN tags->'oneway:bicycle' IS NOT NULL THEN tags->'oneway:bicycle'
            WHEN highway='cycleway' AND oneway IS NOT NULL THEN oneway
            WHEN tags->'cycleway' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:both' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:left' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:right' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
                THEN 'no'
            ELSE NULL
        END AS oneway_bicycle,
        COALESCE(
            tags->'ramp:bicycle',
            tags->'ramp:stroller',
            tags->'ramp:wheelchair',
            tags->'ramp:luggage'
        ) AS has_ramp,
        CASE
            -- From best tag to less precise quality surface tag (smoothness > track > surface).
            WHEN tags->'smoothness' IS NULL AND tracktype IS NULL AND surface IS NULL
                THEN 'unknown'
            WHEN tags->'smoothness' IN ('horrible', 'very_horrible', 'impassable')
                THEN 'mtb'
            WHEN tags->'smoothness' IN ('bad', 'very_bad')
                THEN 'cyclocross'
            WHEN tags->'smoothness' IN ('excellent', 'good', 'intermediate')
                THEN 'road'
            WHEN tracktype IN ('grade4', 'grade5')
                THEN 'mtb'
            WHEN tracktype IN ('grade2', 'grade3')
                THEN 'cyclocross'
            WHEN tracktype IN ('grade1')
                THEN 'road'
            WHEN surface IN ('pebblestone', 'dirt', 'earth', 'grass', 'grass_paver', 'gravel_turf', 'ground', 'mud', 'sand')
                THEN 'mtb'
            WHEN surface IN ('concrete:lanes', 'concrete:plates', 'gravel', 'sett', 'unhewn_cobblestone', 'cobblestone', 'wood', 'compacted', 'fine_gravel', 'woodchips')
                THEN 'cyclocross'
            WHEN surface IN ('paved', 'asphalt', 'concrete', 'paving_stones')
                THEN 'road'
            ELSE 'unknown'
        END AS surface_type,
        CASE
            WHEN service in ('parking_aisle', 'drive-through', 'driveway') THEN 'minor'
            ELSE service
        END AS service,
        CASE
            WHEN tags->'mtb:scale'~E'^\\d+[+-]?$' THEN REPLACE(REPLACE(tags->'mtb:scale', '+', ''), '-', '')::integer
            ELSE NULL
        END AS mtb_scale,
        CASE
            WHEN tags->'mtb:scale:imba'~E'^\\d+$' THEN (tags->'mtb:scale:imba')::integer
            ELSE NULL
        END AS mtb_scale_imba,
        name,
        osm_id,
        CASE
            WHEN highway='cycleway' OR (highway IN ('path', 'footway', 'pedestrian', 'bridleway') AND bicycle IN ('yes', 'designated')) THEN CASE WHEN layer~E'^\\d+$' THEN 100*layer::integer+199 ELSE 199 END
            WHEN highway IN ('path', 'footway', 'pedestrian', 'bridleway') THEN CASE WHEN layer~E'^\\d+$' THEN 100*layer::integer+198 ELSE 198 END
            ELSE z_order
        END AS z_order,
        bridge,
        COALESCE(
            tunnel,
            covered,
            tags->'indoor'
        ) AS tunnel
    FROM planet_osm_line
    WHERE railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram')
        OR highway IS NOT NULL
    ORDER BY z_order ASC;


