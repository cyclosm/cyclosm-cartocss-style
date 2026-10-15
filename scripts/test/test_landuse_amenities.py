#!/usr/bin/env python3
"""Check amenity polygon types using psql (PG* environment) and PyYAML.

Only temporary objects are created. Run from any directory:
    python3 scripts/test/test_landuse_amenities.py
"""
from pathlib import Path
import subprocess

import yaml

project = yaml.safe_load((Path(__file__).resolve().parents[2] / 'project.mml').read_text())
layer = next(layer for layer in project['Layer'] if layer['id'] == 'landuse_gen1')
query = layer['Datasource']['table']
# Large supported polygons survive the area threshold at each tested zoom.
for zoom in (10, 11, 12):
    pixel = 40075016.68557849 / (256 * 2 ** zoom)
    table = query.replace('!pixel_width!', str(pixel)).replace('!pixel_height!', str(pixel))
    subprocess.run(['psql', '-X', '-v', 'ON_ERROR_STOP=1'], input="""
BEGIN;
CREATE TEMP TABLE planet_osm_polygon (
    way geometry, way_area real, landuse text, "natural" text,
    leisure text, amenity text, highway text, sport text
);
INSERT INTO planet_osm_polygon (way_area, amenity) VALUES
    (100000000, 'hospital'), (100000000, 'college'), (100000000, 'grave_yard');
INSERT INTO planet_osm_polygon (way_area, landuse, amenity)
    VALUES (100000000, 'forest', 'hospital');
CREATE TEMP VIEW actual_types AS SELECT type FROM """ + table + """;
DO $$ BEGIN
    IF (SELECT array_agg(type ORDER BY type) FROM actual_types) IS DISTINCT FROM
       ARRAY['amenity_college','amenity_grave_yard','amenity_hospital','landuse_forest'] THEN
        RAISE EXCEPTION 'amenity types do not match base.mss at zoom """ + str(zoom) + """';
    END IF;
END $$;
ROLLBACK;
""", text=True, check=True)
print('Amenity polygon types match base.mss at z10, z11 and z12.')
