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
            WHEN highway='busway' THEN 'service'  -- busway as service
            WHEN highway='footway' AND (bicycle='yes' OR bicycle='designated' OR bicycle='permissive') THEN 'path'
            WHEN highway='bridleway' AND (bicycle='yes' OR bicycle='designated' OR bicycle='permissive') THEN 'path'
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
            WHEN COALESCE(motorcar, tags->'motor_vehicle', tags->'vehicle', access, 'yes') NOT IN ('no', 'private', 'destination', 'agricultural', 'forestry') THEN 'yes'
            -- goods and hgv don't need COALESCE chains, because the next step would be motorcar, which is checked above
            WHEN tags->'goods' NOT IN ('no', 'private') THEN 'yes'
            WHEN tags->'hgv' NOT IN ('no', 'private') THEN 'yes'
            -- moped and mofa are not checked, since most countries that have separate access controls for them treat them as quasi-bicycles
            WHEN COALESCE(tags->'motorcycle', tags->'motor_vehicle', tags->'vehicle', access, 'yes') NOT IN ('no', 'private', 'destination', 'agricultural', 'forestry') THEN 'yes'
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
            WHEN junction IN ('roundabout') AND (oneway IS NULL OR oneway NOT IN ('no', 'reversible')) THEN 'yes'
            ELSE 'no'
        END AS oneway,
        CASE
            WHEN tags->'cycleway:left' IN ('track', 'opposite_track') 
              AND COALESCE(tags->'cycleway:left:segregated',tags->'cycleway:both:segregated', tags->'cycleway:segregated') = 'no'
              THEN 'shared_track'
            WHEN tags->'cycleway:left' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:left:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:left' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:left:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:left' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway:both' IN ('track', 'opposite_track') 
              AND COALESCE(tags->'cycleway:left:segregated',tags->'cycleway:both:segregated', tags->'cycleway:segregated') = 'no'
              THEN 'shared_track'
            WHEN tags->'cycleway:both' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:both:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:both' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:both:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:both' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway' IN ('track', 'opposite_track') 
              AND COALESCE(tags->'cycleway:left:segregated',tags->'cycleway:both:segregated', tags->'cycleway:segregated') = 'no'
              THEN 'shared_track'
            WHEN tags->'cycleway' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'cycleway' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'cycleway' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            ELSE NULL
        END AS cycleway_left_render,
        CASE
            WHEN tags->'cycleway:right' IN ('track', 'opposite_track') 
              AND COALESCE(tags->'cycleway:right:segregated',tags->'cycleway:both:segregated', tags->'cycleway:segregated') = 'no'
              THEN 'shared_track'
            WHEN tags->'cycleway:right' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:right:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:right' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:right:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:right' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway:both' IN ('track', 'opposite_track') 
              AND COALESCE(tags->'cycleway:right:segregated',tags->'cycleway:both:segregated', tags->'cycleway:segregated') = 'no'
              THEN 'shared_track'
            WHEN tags->'cycleway:both' IN ('track', 'opposite_track') THEN 'track'
            WHEN tags->'sidewalk:both:bicycle' != 'no' AND tags->'sidewalk:left:segregated' = 'yes' THEN 'track'
            WHEN tags->'cycleway:both' IN ('lane', 'opposite_lane') THEN 'lane'
            WHEN tags->'sidewalk:both:bicycle' IN ('designated', 'yes') THEN 'sidewalk'
            WHEN tags->'cycleway:both' IN ('share_busway', 'opposite_share_busway', 'shoulder', 'shared_lane') THEN 'busway'
            WHEN tags->'cycleway' IN ('track', 'opposite_track') 
              AND COALESCE(tags->'cycleway:right:segregated',tags->'cycleway:both:segregated', tags->'cycleway:segregated') = 'no'
              THEN 'shared_track'
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
            WHEN highway IN ('motorway', 'motorway_link', 'busway') THEN 'no'
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
            WHEN tags->'cycleway' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:both' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:left' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:right' IN ('opposite', 'opposite_lane', 'opposite_track', 'opposite_share_busway')
              OR tags->'cycleway:left:oneway'='-1' OR tags->'cycleway:right:oneway'='-1'
                THEN 'no'
            WHEN oneway IN ('yes', '-1') THEN oneway
            WHEN junction IN ('roundabout') AND (oneway IS NULL OR oneway NOT IN ('no', 'reversible')) THEN 'yes'
            ELSE 'no'
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
            WHEN service in ('parking_aisle', 'drive-through', 'driveway', 'spur', 'siding', 'yard') THEN 'minor'
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
            WHEN highway='cycleway' OR (highway IN ('path', 'footway', 'pedestrian', 'bridleway') AND bicycle IN ('yes', 'designated', 'permissive')) THEN CASE WHEN layer~E'^\\d+$' THEN 100*layer::integer+199 ELSE 199 END
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

----------------------------------------------------------------------

DROP VIEW IF EXISTS cyclosm_amenities_point;
CREATE VIEW cyclosm_amenities_point AS
    SELECT
          access,
          bicycle,
          tags->'mtb' AS mtb,
          covered,
          tags->'shelter' AS shelter,
          way,
          name,
          COALESCE( -- order is important here
            'aeroway_' || CASE WHEN aeroway IN ('helipad', 'aerodrome') THEN aeroway ELSE NULL END,
            'tourism_' || CASE WHEN tourism IN ('artwork', 'alpine_hut', 'camp_site', 'caravan_site', 'chalet', 'wilderness_hut', 'guest_house', 'apartment', 'hostel', 'hotel', 'motel', 'information', 'museum', 'viewpoint', 'picnic_site', 'gallery') THEN tourism ELSE NULL END,
            'shop_' ||  CASE WHEN shop IN ('bicycle', 'bakery', 'beverage', 'convenience', 'convenience;gas', 'doityourself', 'gas', 'greengrocer', 'supermarket', 'pastry', 'sports') THEN shop ELSE NULL END,
            'amenity_' || CASE WHEN amenity IN ('atm', 'bank', 'bar', 'bench', 'bicycle_rental', 'bicycle_parking', 'bicycle_repair_station', 'biergarten', 'cafe', 'car_wash', 'compressed_air', 'community_centre', 'clinic', 'doctors', 'drinking_water', 'fast_food', 'ferry_terminal', 'food_court', 'fountain', 'fuel', 'hospital', 'ice_cream', 'internet_cafe', 'parking', 'pharmacy', 'place_of_worship', 'police', 'post_office', 'post_box', 'pub', 'public_bath', 'restaurant', 'shelter', 'shower', 'toilets', 'water_point', 'cinema', 'theatre', 'bureau_de_change', 'casino', 'library', 'motorcycle_parking', 'charging_station', 'vending_machine') THEN amenity ELSE NULL END,
            'shop_' || CASE WHEN tags->'service:bicycle:retail'='yes' OR tags->'service:bicycle:repair'='yes' OR tags->'service:bicycle:rental'='yes' THEN 'bicycle' ELSE NULL END,
            'emergency_' || CASE WHEN tags->'emergency' IS NOT NULL THEN tags->'emergency' ELSE NULL END,
            'healthcare_' || CASE WHEN tags->'healthcare' IN ('clinic', 'hospital') THEN tags->'healthcare' ELSE NULL END,
            'leisure_' || CASE WHEN leisure IN ('picnic_table', 'sports_centre') THEN leisure ELSE NULL END,
            'man_made_' || CASE WHEN man_made IN ('mast', 'tower', 'water_tower', 'lighthouse', 'windmill', 'cross', 'obelisk', 'communications_tower', 'telescope', 'chimney', 'crane', 'storage_tank', 'silo', 'water_tap', 'monitoring_station') THEN man_made ELSE NULL END,
            CASE WHEN tags->'mountain_pass' = 'yes' THEN 'mountain_pass' ELSE NULL END,
            'natural_' || CASE WHEN "natural" IN ('peak', 'volcano', 'saddle', 'spring', 'cave_entrance') THEN "natural" ELSE NULL END,
            'place_' || CASE WHEN place IN ('island', 'islet') THEN place END,
            'waterway_' || CASE WHEN waterway IN ('waterfall') THEN waterway ELSE NULL END,
            'historic_' || CASE WHEN historic IN ('memorial', 'monument', 'archaeological_site', 'wayside_cross', 'fort', 'wayside_shrine', 'castle', 'manor', 'city_gate') THEN historic ELSE NULL END,
            'military_'|| CASE WHEN military IN ('bunker') THEN military ELSE NULL END,
            'highway_'|| CASE WHEN highway IN ('bus_stop', 'elevator', 'traffic_signals') THEN highway ELSE NULL END,
            'highway_' || CASE WHEN tags @> 'ford=>yes' OR tags @> 'ford=>stepping_stones' THEN 'ford' END,
            'power_' || power,
            'xmas_' || CASE WHEN tags->'xmas:feature' IN ('tree', 'market') AND (EXTRACT(MONTH FROM CURRENT_DATE) = '12') AND (EXTRACT(DAY FROM CURRENT_DATE) >= '1') THEN tags->'xmas:feature' ELSE NULL END
          ) AS feature,
          CASE
            WHEN tags->'capacity'~E'^\\d+$' THEN (tags->'capacity')::integer
            ELSE NULL
          END AS capacity,
          religion,
          tags->'denomination' AS denomination,
          tags->'compressed_air' AS compressed_air,
          tags->'service:bicycle:pump' AS service_bicycle_pump,
          tags->'service:bicycle:diy' AS service_bicycle_diy,
          CASE
            WHEN tags->'service:bicycle:retail'='yes' OR tags->'service:bicycle:repair'='yes' OR tags->'service:bicycle:rental'='yes' THEN 'yes' ELSE NULL
          END AS service_bicycle_retail_repair_rental,
          tags->'car_wash' as car_wash,
          tags->'drinking_water' AS drinking_water,
          tags->'location' AS location,
          tags->'memorial' AS memorial,
          tags->'castle_type' AS castle_type,
          tags->'information' AS information,
          tags->'artwork_type' as artwork_type,
          tags->'icao' as icao,
          tags->'iata' as iata,
          "generator:source",
          tags->'supervised' as supervised,
          tags->'bicycle_parking' as bicycle_parking,
          tags->'vending' as vending,
          tags->'automated' as automated,
          CASE
            WHEN "natural" IN ('peak', 'volcano', 'saddle')
              OR tags->'mountain_pass' = 'yes' THEN
              CASE
                WHEN ele ~ '^-?\d{1,4}(\.\d+)?$' THEN ele::NUMERIC
                ELSE NULL
              END
            WHEN "waterway" IN ('waterfall') THEN
              CASE
                WHEN tags->'height' ~ '^\d{1,3}(\.\d+)?( m)?$' THEN (SUBSTRING(tags->'height', '^(\d{1,3}(\.\d+)?)( m)?$'))::NUMERIC
              ELSE NULL
              END
            WHEN tags->'capacity'~E'^\\d+$' THEN (tags->'capacity')::integer
            ELSE NULL
          END AS score,
          CASE
            WHEN "natural" IN ('peak', 'volcano', 'saddle')
              OR tourism = 'alpine_hut' OR (tourism = 'information' AND tags->'information' = 'guidepost')
              OR amenity = 'shelter'
              OR tags->'mountain_pass' = 'yes'
              THEN
              CASE
                WHEN ele ~ '^-?\d{1,4}(\.\d+)?$' THEN ele::NUMERIC
                ELSE NULL
              END
            ELSE NULL
          END AS elevation,
          CASE
            WHEN (man_made IN ('mast', 'tower', 'chimney', 'crane') AND (tags->'location' NOT IN ('roof', 'rooftop') OR (tags->'location') IS NULL)) OR waterway IN ('waterfall') THEN
              CASE
                WHEN tags->'height' ~ '^\d{1,3}(\.\d+)?( m)?$' THEN (SUBSTRING(tags->'height', '^(\d{1,3}(\.\d+)?)( m)?$'))::NUMERIC
              ELSE NULL
            END
            ELSE NULL
          END AS height
        FROM planet_osm_point
        WHERE aeroway IN ('helipad', 'aerodrome')
          OR tourism IN ('artwork', 'alpine_hut', 'camp_site', 'caravan_site', 'chalet', 'wilderness_hut', 'guest_house', 'apartment', 'hostel',
              'hotel', 'motel', 'information', 'museum', 'viewpoint', 'picnic_site', 'gallery')
          OR amenity IN ('atm', 'bank', 'bar', 'bench', 'bicycle_rental', 'bicycle_parking', 'bicycle_repair_station',
                         'biergarten', 'cafe', 'car_wash', 'compressed_air', 'community_centre', 'clinic', 'doctors', 'drinking_water', 'fast_food',
                         'ferry_terminal', 'food_court', 'fountain', 'fuel', 'hospital', 'ice_cream', 'internet_cafe',
                         'parking', 'pharmacy', 'place_of_worship', 'police', 'post_office', 'post_box', 'pub', 'public_bath',
                         'restaurant', 'shelter', 'shower', 'toilets', 'water_point', 'cinema', 'theatre',
                         'bureau_de_change', 'casino', 'library')
          OR tags->'car_wash'='yes'
          OR (amenity='motorcycle_parking' AND (bicycle='yes' OR bicycle='designated'))
          OR (amenity='charging_station' AND (bicycle='yes' OR bicycle='designated'))
          OR (amenity='vending_machine' AND tags->'vending'='bicycle_tube')
          OR shop IN ('bicycle', 'bakery', 'beverage', 'convenience', 'convenience;gas', 'doityourself', 'gas', 'greengrocer', 'supermarket', 'pastry', 'sports')
          OR tags->'healthcare' IN ('clinic', 'hospital')
          OR leisure='picnic_table'
          OR (leisure='sports_centre' AND sport='swimming')
          OR (
            man_made IN ('mast', 'tower', 'water_tower', 'lighthouse', 'windmill', 'cross', 'obelisk', 'communications_tower', 'telescope', 'chimney', 'crane', 'storage_tank', 'silo')
            AND (tags->'location' NOT IN ('roof', 'rooftop') OR (tags->'location') IS NULL)
          )
          OR man_made IN ('water_tap')
          OR man_made IN ('monitoring_station') AND tags->'monitoring:bicycle'='yes'
          OR "natural" IN ('peak', 'volcano', 'saddle', 'spring', 'cave_entrance')
          OR place IN ('island', 'islet')
          OR tags->'mountain_pass' = 'yes'
          OR waterway IN ('waterfall')
          OR historic IN ('memorial', 'monument', 'archaeological_site', 'wayside_cross', 'fort', 'wayside_shrine', 'castle', 'manor', 'city_gate')
          OR military IN ('bunker')
          OR tags->'emergency' IN ('defibrillator', 'phone')
          OR highway IN ('elevator', 'traffic_signals')
          OR ((highway='bus_stop' OR public_transport='platform') AND (tags->'shelter'='yes' OR covered='yes'))
          OR (power = 'generator' AND "generator:source"='wind')
          OR tags->'ford' IS NOT NULL
          OR tags->'xmas:feature' IN ('tree', 'market')
          OR tags->'service:bicycle:retail'='yes' OR tags->'service:bicycle:repair'='yes' OR tags->'service:bicycle:rental'='yes'
        ORDER BY
            CASE
                -- Bike amenities
                WHEN shop IN ('bicycle', 'sports') THEN 0
                WHEN amenity IN ('bicycle_rental') Then 10
                -- Emergency
                WHEN tags->'healthcare' IS NOT NULL OR tags->'emergency' IN ('defibrillator', 'phone') OR amenity IN ('hospital', 'clinic', 'doctors', 'pharmacy') THEN 20
                -- Other emergency-related amenities
                WHEN amenity IN ('bicycle_repair_station', 'compressed_air', 'drinking_water', 'police', 'toilets',
                  'water_point', 'charging_station') THEN 21
                WHEN tags->'compressed_air'='yes' THEN 22
                --- Parkings
                WHEN amenity IN ('bicycle_parking', 'motorcycle_parking') THEN 32
                -- Supermarkets
                WHEN shop='supermarket' THEN 40
                -- Convenience
                WHEN shop='convenience' OR shop='convenience;gas' THEN 50
                -- Food
                WHEN shop IS NOT NULL OR amenity IN ('bar', 'biergarten', 'cafe', 'fast_food', 'food_court', 'pub', 'restaurant') THEN 60
                -- Everything else
                ELSE NULL
            END ASC NULLS LAST,
            feature,
            score DESC NULLS LAST;

----------------------------------------------------------------------

DROP VIEW IF EXISTS cyclosm_amenities_poly;
CREATE VIEW cyclosm_amenities_poly AS
    SELECT
          access,
          bicycle,
          tags->'mtb' AS mtb,
          covered,
          tags->'shelter' AS shelter,
          way,
          way_area AS area,
          name,
          COALESCE( -- order is important here
            'aeroway_' || CASE WHEN aeroway IN ('helipad', 'aerodrome') THEN aeroway ELSE NULL END,
            'tourism_' || CASE WHEN tourism IN ('artwork', 'alpine_hut', 'camp_site', 'caravan_site', 'chalet', 'wilderness_hut', 'guest_house', 'apartment', 'hostel', 'hotel', 'motel', 'information', 'museum', 'viewpoint', 'picnic_site', 'gallery') THEN tourism ELSE NULL END,
            'shop_' ||  CASE WHEN shop IN ('bicycle', 'bakery', 'beverage', 'convenience', 'convenience;gas', 'doityourself', 'gas', 'greengrocer', 'supermarket', 'pastry', 'sports') THEN shop ELSE NULL END,
            'amenity_' || CASE WHEN amenity IN ('atm', 'bank', 'bar', 'bench', 'bicycle_rental', 'bicycle_parking', 'bicycle_repair_station', 'biergarten', 'cafe', 'car_wash', 'compressed_air', 'community_centre', 'clinic', 'doctors', 'drinking_water', 'fast_food', 'ferry_terminal', 'food_court', 'fountain', 'fuel', 'hospital', 'ice_cream', 'internet_cafe', 'parking', 'pharmacy', 'place_of_worship', 'police', 'post_office', 'post_box', 'pub', 'public_bath', 'restaurant', 'shelter', 'shower', 'toilets', 'water_point', 'cinema', 'theatre', 'bureau_de_change', 'casino', 'library', 'motorcycle_parking', 'charging_station', 'vending_machine') THEN amenity ELSE NULL END,
            'shop_' || CASE WHEN tags->'service:bicycle:retail'='yes' OR tags->'service:bicycle:repair'='yes' OR tags->'service:bicycle:rental'='yes' THEN 'bicycle' ELSE NULL END,
            'emergency_' || CASE WHEN tags->'emergency' IS NOT NULL THEN tags->'emergency' ELSE NULL END,
            'healthcare_' || CASE WHEN tags->'healthcare' IN ('clinic', 'hospital') THEN tags->'healthcare' ELSE NULL END,
            'leisure_' || CASE WHEN leisure IN ('picnic_table', 'sports_centre') THEN leisure ELSE NULL END,
            'man_made_' || CASE WHEN man_made IN ('mast', 'tower', 'water_tower', 'lighthouse', 'windmill', 'cross', 'obelisk', 'communications_tower', 'telescope', 'chimney', 'crane', 'storage_tank', 'silo', 'water_tap', 'monitoring_station') THEN man_made ELSE NULL END,
            CASE WHEN tags->'mountain_pass' = 'yes' THEN 'mountain_pass' ELSE NULL END,
            'natural_' || CASE WHEN "natural" IN ('peak', 'volcano', 'saddle', 'spring', 'cave_entrance') THEN "natural" ELSE NULL END,
            'place_' || CASE WHEN place IN ('island', 'islet') THEN place END,
            'waterway_' || CASE WHEN waterway IN ('waterfall') THEN waterway ELSE NULL END,
            'historic_' || CASE WHEN historic IN ('memorial', 'monument', 'archaeological_site', 'wayside_cross', 'fort', 'wayside_shrine', 'castle', 'manor', 'city_gate') THEN historic ELSE NULL END,
            'military_'|| CASE WHEN military IN ('bunker') THEN military ELSE NULL END,
            'highway_'|| CASE WHEN highway IN ('bus_stop', 'elevator', 'traffic_signals') THEN highway ELSE NULL END,
            'power_' || power,
            'xmas_' || CASE WHEN tags->'xmas:feature' IN ('tree', 'market') AND (EXTRACT(MONTH FROM CURRENT_DATE) = '12') AND (EXTRACT(DAY FROM CURRENT_DATE) >= '1') THEN tags->'xmas:feature' ELSE NULL END
          ) AS feature,
          CASE
            WHEN tags->'capacity'~E'^\\d+$' THEN (tags->'capacity')::integer
            ELSE NULL
          END AS capacity,
          religion,
          tags->'denomination' AS denomination,
          tags->'compressed_air' AS compressed_air,
          tags->'service:bicycle:pump' AS service_bicycle_pump,
          tags->'service:bicycle:diy' AS service_bicycle_diy,
          CASE
            WHEN tags->'service:bicycle:retail'='yes' OR tags->'service:bicycle:repair'='yes' OR tags->'service:bicycle:rental'='yes' THEN 'yes' ELSE NULL
          END AS service_bicycle_retail_repair_rental,
          tags->'car_wash' as car_wash,
          tags->'drinking_water' AS drinking_water,
          tags->'location' AS location,
          tags->'memorial' AS memorial,
          tags->'castle_type' AS castle_type,
          tags->'information' AS information,
          tags->'artwork_type' as artwork_type,
          tags->'icao' as icao,
          tags->'iata' as iata,
          "generator:source",
          tags->'supervised' as supervised,
          tags->'bicycle_parking' as bicycle_parking,
          tags->'vending' as vending,
          tags->'automated' as automated,
          CASE
            WHEN "natural" IN ('peak', 'volcano', 'saddle') THEN NULL
            WHEN "waterway" IN ('waterfall') THEN
              CASE
                WHEN tags->'height' ~ '^\d{1,3}(\.\d+)?( m)?$' THEN (SUBSTRING(tags->'height', '^(\d{1,3}(\.\d+)?)( m)?$'))::NUMERIC
              ELSE NULL
              END
            WHEN tags->'capacity'~E'^\\d+$' THEN (tags->'capacity')::integer
            ELSE NULL
          END AS score,
          CASE
            WHEN (man_made IN ('mast', 'tower', 'chimney', 'crane') AND (tags->'location' NOT IN ('roof', 'rooftop') OR (tags->'location') IS NULL)) OR waterway IN ('waterfall') THEN
              CASE
                WHEN tags->'height' ~ '^\d{1,3}(\.\d+)?( m)?$' THEN (SUBSTRING(tags->'height', '^(\d{1,3}(\.\d+)?)( m)?$'))::NUMERIC
              ELSE NULL
            END
            ELSE NULL
          END AS height,
          way_area
        FROM planet_osm_polygon
        WHERE aeroway IN ('helipad', 'aerodrome')
          OR tourism IN ('artwork', 'alpine_hut', 'camp_site', 'caravan_site', 'chalet', 'wilderness_hut', 'guest_house', 'apartment', 'hostel',
              'hotel', 'motel', 'information', 'museum', 'viewpoint', 'picnic_site', 'gallery')
          OR amenity IN ('atm', 'bank', 'bar', 'bench', 'bicycle_rental', 'bicycle_parking', 'bicycle_repair_station',
                         'biergarten', 'cafe', 'car_wash', 'compressed_air', 'community_centre', 'clinic', 'doctors', 'drinking_water', 'fast_food',
                         'ferry_terminal', 'food_court', 'fountain', 'fuel', 'hospital', 'ice_cream', 'internet_cafe',
                         'parking', 'pharmacy', 'place_of_worship', 'police', 'post_office', 'post_box', 'pub', 'public_bath',
                         'restaurant', 'shelter', 'shower', 'toilets', 'water_point', 'cinema', 'theatre',
                         'bureau_de_change', 'casino', 'library')
          OR tags->'car_wash'='yes'
          OR (amenity='motorcycle_parking' AND (bicycle='yes' OR bicycle='designated'))
          OR (amenity='charging_station' AND (bicycle='yes' OR bicycle='designated'))
          OR (amenity='vending_machine' AND tags->'vending'='bicycle_tube')
          OR shop IN ('bicycle', 'bakery', 'beverage', 'convenience', 'convenience;gas', 'doityourself', 'gas', 'greengrocer', 'supermarket', 'pastry', 'sports')
          OR tags->'healthcare' IN ('clinic', 'hospital')
          OR leisure='picnic_table'
          OR (leisure='sports_centre' AND sport='swimming')
          OR (
            man_made IN ('mast', 'tower', 'water_tower', 'lighthouse', 'windmill', 'cross', 'obelisk', 'communications_tower', 'telescope', 'chimney', 'crane', 'storage_tank', 'silo')
            AND (tags->'location' NOT IN ('roof', 'rooftop') OR (tags->'location') IS NULL)
          )
          OR man_made IN ('water_tap')
          OR man_made IN ('monitoring_station') AND tags->'monitoring:bicycle'='yes'
          OR "natural" IN ('peak', 'volcano', 'saddle', 'spring', 'cave_entrance')
		  OR place IN ('island', 'islet')
          OR tags->'mountain_pass' = 'yes'
          OR waterway IN ('waterfall')
          OR historic IN ('memorial', 'monument', 'archaeological_site', 'wayside_cross', 'fort', 'wayside_shrine', 'castle', 'manor', 'city_gate')
          OR military IN ('bunker')
          OR tags->'emergency' IN ('defibrillator', 'phone')
          OR highway IN ('elevator', 'traffic_signals')
          OR ((highway='bus_stop' OR public_transport='platform') AND (tags->'shelter'='yes' OR covered='yes'))
          OR (power = 'generator' AND "generator:source"='wind')
          OR tags->'xmas:feature' IN ('tree', 'market')
          OR tags->'service:bicycle:retail'='yes' OR tags->'service:bicycle:repair'='yes' OR tags->'service:bicycle:rental'='yes'
        ORDER BY
            CASE
                -- Bike amenities
                WHEN shop IN ('bicycle', 'sports') THEN 0
                WHEN amenity IN ('bicycle_rental') Then 10
                -- Emergency
                WHEN tags->'healthcare' IS NOT NULL OR tags->'emergency'IN ('defibrillator', 'phone') OR amenity IN ('hospital', 'clinic', 'doctors', 'pharmacy') THEN 20
                -- Other emergency-related amenities
                WHEN amenity IN ('bicycle_repair_station', 'compressed_air', 'drinking_water', 'police', 'toilets',
                  'water_point', 'charging_station') THEN 21
                WHEN tags->'compressed_air'='yes' THEN 22
                --- Parkings
                WHEN amenity IN ('bicycle_parking', 'motorcycle_parking') THEN 32
                -- Supermarkets
                WHEN shop='supermarket' THEN 40
                -- Convenience
                WHEN shop='convenience' OR shop='convenience;gas' THEN 50
                -- Food
                WHEN shop IS NOT NULL OR amenity IN ('bar', 'biergarten', 'cafe', 'fast_food', 'food_court', 'pub', 'restaurant') THEN 60
                -- Everything else
                ELSE NULL
            END ASC NULLS LAST,
            feature,
            score DESC NULLS LAST

