#!/usr/bin/env python3
"""Exercise the production cyclosm_ways view with psql (PG* environment).

Only temporary tables/views are used; PostGIS and hstore must be installed.
"""
from pathlib import Path
import subprocess

view = (Path(__file__).resolve().parents[2] / 'views.sql').read_text().split('----------------------------------------------------------------------')[0]
view = view.replace('DROP VIEW IF EXISTS cyclosm_ways;', '').replace('CREATE VIEW cyclosm_ways', 'CREATE TEMP VIEW cyclosm_ways')
subprocess.run(['psql', '-X', '-v', 'ON_ERROR_STOP=1'], input="""
BEGIN;
CREATE TEMP TABLE planet_osm_line (
    way geometry, highway text, railway text, access text, layer text,
    bicycle text, motorcar text, oneway text, junction text, tracktype text,
    surface text, service text, name text, osm_id bigint, z_order integer,
    bridge text, tunnel text, covered text, tags hstore
);
INSERT INTO planet_osm_line (osm_id,highway,tags) VALUES
(1,'residential','"sidewalk:left:bicycle"=>"yes","sidewalk:left:segregated"=>"yes"'),
(2,'residential','"sidewalk:right:bicycle"=>"yes","sidewalk:right:segregated"=>"yes"'),
(3,'residential','"sidewalk:both:bicycle"=>"yes","sidewalk:both:segregated"=>"yes"'),
(4,'residential','"sidewalk:right:bicycle"=>"yes","sidewalk:right:segregated"=>"no","sidewalk:left:segregated"=>"yes"'),
(5,'residential','"sidewalk:both:bicycle"=>"yes","sidewalk:both:segregated"=>"no","sidewalk:left:segregated"=>"yes"'),
(6,'residential','"sidewalk:right:bicycle"=>"yes"'),
(7,'residential','"sidewalk:right:bicycle"=>"no","sidewalk:right:segregated"=>"yes"'),
(8,'residential','"sidewalk:right:bicycle"=>"yes","sidewalk:right:segregated"=>"yes","cycleway:right"=>"lane"');
""" + view + """
DO $$ BEGIN
    IF (SELECT count(*) FROM cyclosm_ways) <> 8 OR EXISTS (
        SELECT osm_id,cycleway_left_render,cycleway_right_render FROM cyclosm_ways
        EXCEPT
        SELECT * FROM (VALUES
            (1::bigint,'track'::text,NULL::text), (2,NULL,'track'),
            (3,'track','track'), (4,NULL,'sidewalk'),
            (5,'sidewalk','sidewalk'), (6,NULL,'sidewalk'),
            (7,NULL,NULL), (8,NULL,'track')
        ) expected(id,l,r)
    ) THEN
        RAISE EXCEPTION 'sidewalk segregation must use the corresponding side key';
    END IF;
END $$;
ROLLBACK;
""", text=True, check=True)
print('Sidewalk segregation, opposite-side isolation and existing precedence pass.')
