#barriers[zoom>=17][zoom<=20] {
  [barrier = 'block'],
  [barrier = 'bollard'] {
    marker-width: 3;
    marker-line-width: 0;
    marker-fill: #7d7c7c;
    marker-placement: interior;
  }
  [barrier = 'cattle_grid'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/cattle_grid.svg');
  }
  [barrier = 'chain'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/gate.svg');
  }
  [barrier = 'cycle_barrier'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/cycle_barrier.svg');
  }
  [barrier = 'gate'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/gate.svg');
  }
  [barrier = 'kissing_gate'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/kissing_gate.svg');
  }
  [barrier = 'lift_gate'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/lift_gate.svg');
  }
  [barrier = 'stile'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/stile.svg');
  }
  [barrier = 'swing_gate'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/gate.svg');
  }
  [barrier = 'turnstile'] {
    marker-file: url('symbols/openstreetmap-carto/barriers/stile.svg');
  }
}

#pois-points[zoom>=14] {
  [type = 'bicycle_shop'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_11.svg');
  }
}

#pois-points-text[zoom>=14][type='bicycle_shop'] {
  text-name: "[name]";
  text-halo-radius: 1.5;
  text-face-name:@sans;
  text-size: 11;
  text-wrap-width:30;
  text-fill: #888;
  text-halo-fill: #fff;
  text-placement-type: simple;
  text-placements: "S,N,E,W,NE,SE,NW,SW,16,14,12";
  text-dy: 12;
  text-dx: 12;
}


#pois-points[zoom>=16] {
  [type = 'bicycle_parking'] {
    marker-line-color: @bicycle_parking_line;
    marker-fill: @bicycle_parking_fill;
    marker-width: 7;
    marker-line-width: 1;
  }
  [type = 'motorcycle_parking'] {
    marker-line-color: @motorcycle_parking_line;
    marker-fill: @motorcycle_parking_fill;
    marker-width: 7;
    marker-line-width: 1;
  }
  [type = 'bicycle_rental'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_rental_11.svg');
  }
  [type = 'cafe'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/cafe_11.svg');
  }
  [type = 'drinking_water'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/drinking_water_11.svg');
  }
  [type = 'hospital'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/hospital_11.svg');
  }
  [type = 'post_office'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/post_office_11.svg');
  }
  [type = 'post_box'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/post_box_11.svg');
  }
  [type = 'pub'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/pub_11.svg');
  }
  [type = 'shelter'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/shelter_11.svg');
  }
  [type = 'toilets'] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/toilets_11.svg');
  }
}

#pois-points-text[zoom>=16] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    text-placement-type: simple;
    text-placements: "S,N,E,W,NE,SE,NW,SW,16,14,12";
    text-dy: 12;
    text-dx: 12;
}


#pois-points[zoom>=11] {
  [type = 'peak'] {
    marker-fill: @natural_peak;
    marker-file: url('symbols/openstreetmap-carto/natural/peak.svg');
  }
  [type = 'volcano'] {
    marker-fill: @natural_volcano;
    marker-file: url('symbols/openstreetmap-carto/natural/peak.svg');
  }
}

#pois-points-text[zoom>=11] {
  [type = 'peak'],
  [type = 'volcano'] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    text-placement-type: simple;
    text-placements: "S,N,E,W,NE,SE,NW,SW,16,14,12";
    text-dy: 12;
    text-dx: 12;
  }
}

#pois-points[zoom>=15] {
  [type = 'saddle'] {
    marker-fill: @natural_peak;
    marker-file: url('symbols/openstreetmap-carto/natural/saddle.svg');
  }
  [type = 'cave_entrance'] {
    marker-fill: @natural_peak;
    marker-file: url('symbols/openstreetmap-carto/natural/cave.svg');
  }
}

#pois-points-text[zoom>=15] {
  [type = 'saddle'],
  [type = 'cave_entrance'] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    text-placement-type: simple;
    text-placements: "S,N,E,W,NE,SE,NW,SW,16,14,12";
    text-dy: 12;
    text-dx: 12;
  }
}
