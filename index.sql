-- https://github.com/cquest/osmfr-cartocss/blob/master/additions.sql
create index planet_osm_bicycle_routes on planet_osm_line using gist(way) where route='bicycle' OR route='mtb';

create index planet_osm_line_ferry on planet_osm_line using gist (way) where route = 'ferry';
