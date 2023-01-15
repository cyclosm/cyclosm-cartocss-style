#amenities-poly {
  [feature = 'amenity_bicycle_parking'][zoom >= 16] {
    polygon-fill: #eeeeee;
    line-color: #8d8383;
  }
}

#barriers[zoom>=17][zoom<=20] {
  [barrier = 'block'],
  [barrier = 'bollard'],
  [barrier = 'jersey_barrier'],
  [barrier = 'log'] {
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
  [barrier = 'cycle_barrier'],
  [barrier = 'motorcycle_barrier'] {
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

#oriented-highway-amenities {
  [feature='crossing'][zoom >= 18] {
    marker-ignore-placement: true;
    marker-file: url('symbols/osmfr/crossing.svg');
    marker-transform: 'rotate([angle]) scale(0.9)';
    marker-fill: @transportation-icon;
  }

  [feature = 'traffic_calming'][zoom >= 18] {
    marker-file: url('symbols/amenity/traffic_calming.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
    marker-transform: 'rotate([angle])';
  }

  [feature = 'cycleway_asl'][zoom >= 18] {
    marker-width: 9;
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_asl_11.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
    marker-transform: 'rotate([angle])';
  }
}

#amenities-points,
#amenities-poly {
  [feature = 'amenity_compressed_air'][zoom >= 15] {
    marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
    marker-fill: @bicycle-amenity;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'amenity_fuel'][zoom >= 17],
  [feature = 'shop_gas'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/fuel.svg');
    marker-fill: @shop-icon;
    marker-placement: interior;
    marker-clip: false;

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }

    //Do it yourself repair tools sub icon
    [service_bicycle_diy = 'yes'][zoom >= 16] {
      diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
      diy/marker-fill: @bicycle-amenity;
      diy/marker-placement: interior;
      diy/marker-clip: false;
      diy/marker-ignore-placement: true;
      diy/marker-allow-overlap: true;
      diy/marker-width: 11;
      diy/marker-height: 11;
      diy/marker-geometry-transform: translate(-10, 6);
    }
  }

  [feature = 'tourism_alpine_hut'][zoom >= 13],
  [feature = 'tourism_wilderness_hut'][zoom >= 13],
  [feature = 'amenity_shelter'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/shelter_11.svg');
    marker-fill: @accommodation-icon;
    [feature = 'amenity_shelter'] {
      marker-fill: @man-made-icon;
    }
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'highway_bus_stop'][shelter = 'yes'][zoom >= 17],
  [feature = 'highway_bus_stop'][covered = 'yes'][zoom >= 17] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/shelter_11.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_artwork'][zoom >= 17] {
    [artwork_type != 'statue'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/artwork.svg');
    }
    [artwork_type = 'statue'] {
      marker-file: url('symbols/openstreetmap-carto/historic/statue.svg');
    }
    [artwork_type = 'bust'] {
      marker-file: url('symbols/openstreetmap-carto/historic/bust.svg');
    }
    marker-fill: @memorials;
    marker-placement: interior;
  }

  [feature = 'tourism_camp_site'][zoom >= 14] {
    marker-file: url('symbols/openstreetmap-carto/tourism/camping.svg');
    marker-fill: @accommodation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_caravan_site'][zoom >= 14] {
    marker-file: url('symbols/openstreetmap-carto/tourism/caravan_park.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_chalet'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/chalet.svg');
    marker-fill: @accommodation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_public_bath'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/public_bath.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_fountain'] {
    ::basin {
      [zoom = 17] {
        marker-fill: @water;
        marker-allow-overlap: true;
        marker-line-width: 0;
        marker-width: 10;
        marker-height: 10;
        marker-ignore-placement: true;
      }
    }
    ::nozzle {
      [zoom = 17] {
        nozzle/marker-fill: @marina-text;
        nozzle/marker-line-width: 0;
        nozzle/marker-width: 3;
        nozzle/marker-height: 3;
      }
      [zoom >= 18] {
        nozzle/marker-file: url('symbols/openstreetmap-carto/amenity/fountain.svg');
        nozzle/marker-fill: @marina-text;
        nozzle/marker-placement: interior;
        nozzle/marker-clip: false;
      }
    }
  }

  [feature = 'tourism_guest_house'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/guest_house.svg');
    marker-fill: @accommodation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_apartment'][zoom >= 18] {
    marker-file: url('symbols/openstreetmap-carto/tourism/apartment.svg');
    marker-fill: @accommodation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_repair_station'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
    marker-fill: @bicycle-amenity;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }
  }

  [feature = 'amenity_vending_machine'][vending = 'bicycle_tube'][zoom >= 16] {
    marker-file: url('symbols/amenity/bicycle_tube_vending.svg');
    marker-fill: @bicycle-amenity;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'amenity_charging_station'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/amenity/charging_station.svg');
    marker-fill: @bicycle-amenity;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'man_made_monitoring_station'][zoom >= 18] {
    marker-file: url('symbols/amenity/bicycle_monitoring_station.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_car_wash'][zoom >= 16],
	[feature = 'amenity_fuel'][compressed_air != 'yes'][car_wash = 'yes'][zoom >= 16],
	[feature = 'shop_gas'][compressed_air != 'yes'][car_wash = 'yes'][zoom >= 16],
	[feature = 'shop_convenience;gas'][compressed_air != 'yes'][car_wash = 'yes'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/amenity/car_wash.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
    [automated = 'no'],
    [automated = '0'] {
      marker-file: url('symbols/openstreetmap-carto/amenity/bike_wash.svg');
    }
  }

  [feature = 'tourism_gallery'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/shop/art.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @amenity-common;
  }

  [feature = 'tourism_hostel'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/hostel.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_hotel'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/hotel.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_motel'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/motel.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_information'][zoom >= 19],
  [feature = 'tourism_information']["information"='office'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/information.svg');
    [information = 'audioguide'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/audioguide.svg');
    }
    [information = 'board'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/board.svg');
    }
    [information = 'guidepost'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/guidepost.svg');
      [bicycle = 'yes'], [mtb = 'yes'] {
        marker-fill: @bicycle-rental;
      }
    }
    [information = 'office'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/office.svg');
      marker-fill: @amenity-common;
    }
    [information = 'map'],
    [information = 'tactile_map'],
    [information = 'tactile_model'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/map.svg');
      [bicycle = 'yes'], [mtb = 'yes'] {
        marker-fill: @bicycle-rental;
      }
    }
    [information = 'terminal'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/terminal.svg');
    }
      marker-placement: interior;
      marker-fill: @man-made-icon;
      marker-clip: false;
  }

  [feature = 'amenity_shower'][zoom >= 18] {
    marker-file: url('symbols/openstreetmap-carto/amenity/shower.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'man_made_chimney'] {
    [zoom >= 16][height > 50],
    [zoom >= 17][height > 30],
    [zoom >= 18] {
      marker-file: url('symbols/openstreetmap-carto/man_made/chimney.svg');
      marker-fill: @man-made-icon;
      marker-placement: interior;
      marker-clip: false;
    }
  }

  [feature = 'man_made_crane'] {
    [zoom >= 16][height > 50],
    [zoom >= 17] {
      marker-file: url('symbols/openstreetmap-carto/man_made/crane.svg');
      marker-fill: @man-made-icon;
      marker-placement: interior;
      marker-clip: false;
    }
  }

  [feature = 'historic_city_gate'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/historic/city_gate.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_museum'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/museum.svg');
    marker-fill: @culture;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_cinema'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/cinema.svg');
    marker-fill: @culture;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_theatre'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/theatre.svg');
    marker-fill: @culture;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_bureau_de_change'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/bureau_de_change.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_casino'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/casino.svg');
    marker-fill: @culture;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_library'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/library.svg');
    marker-fill: @culture;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'man_made_cross'][zoom >= 17],
  [feature = 'historic_wayside_cross'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/man_made/cross.svg');
    marker-fill: @religious-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'man_made_storage_tank'][zoom >= 18],
  [feature = 'man_made_silo'][zoom >= 18] {
    marker-file: url('symbols/openstreetmap-carto/man_made/storage_tank.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'historic_wayside_shrine'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/historic/shrine.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_police'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/amenity/police.svg');
    marker-fill: @public-service;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_post_box'][zoom >= 18] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/post_box_11.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'emergency_defibrillator'][zoom >= 19] {
    marker-file: url('symbols/osmfr/aed2.svg');
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }
  [feature = 'emergency_phone'][zoom >= 19] {
    marker-file: url('symbols/openstreetmap-carto/amenity/emergency_phone.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_viewpoint'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/viewpoint.svg');
    marker-placement: interior;
    marker-fill: @amenity-common;
    marker-clip: false;
  }

  [feature = 'man_made_water_tower'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/man_made/water_tower.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'historic_memorial'][memorial = null][zoom >= 17],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= 17],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= 17],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= 19],
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= 19] {
    marker-file: url('symbols/openstreetmap-carto/historic/memorial.svg');
    [memorial = 'bust']{
      marker-file: url('symbols/openstreetmap-carto/historic/bust.svg');
    }
    [memorial = 'blue_plaque'],
    [memorial = 'plaque'] {
      marker-file: url('symbols/openstreetmap-carto/historic/plaque.svg');
    }
    [memorial = 'statue'] {
      marker-file: url('symbols/openstreetmap-carto/historic/statue.svg');
    }
    [memorial = 'stone'] {
      marker-file: url('symbols/openstreetmap-carto/historic/stone.svg');
    }
    marker-fill: @memorials;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'man_made_obelisk'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/historic/obelisk.svg');
    marker-fill: @memorials;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'historic_monument'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/historic/monument.svg');
    marker-fill: @memorials;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'historic_fort'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/historic/fort.svg');
    marker-fill: @memorials;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'historic_castle'][castle_type != 'stately'][castle_type != 'manor'][zoom >= 15],
  [feature = 'historic_castle'][castle_type = 'stately'][zoom >= 16],
  [feature = 'historic_castle'][castle_type = 'manor'][zoom >= 16],
  [feature = 'historic_manor'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/historic/castle.svg');
    marker-fill: @memorials;
    marker-placement: interior;
    marker-clip: false;
    [castle_type = 'palace'],
    [castle_type = 'stately'] {
      marker-file: url('symbols/openstreetmap-carto/historic/palace.svg');
    }
    [castle_type = 'manor'],
    [feature = 'historic_manor'] {
      marker-file: url('symbols/openstreetmap-carto/historic/manor.svg');
    }
    [castle_type = 'fortress'],
    [castle_type = 'defensive'],
    [castle_type = 'castrum'],
    [castle_type = 'shiro'],
    [castle_type = 'kremlin'] {
      marker-file: url('symbols/openstreetmap-carto/historic/fortress.svg');
    }
  }

  [feature = 'historic_archaeological_site'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/historic/archaeological_site.svg');
    marker-fill: @culture;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_picnic_site'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/picnic.svg');
    marker-fill: @leisure-green;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'leisure_picnic_table'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/picnic.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'amenity_bench'][zoom >= 19] {
    marker-file: url('symbols/openstreetmap-carto/amenity/bench.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'aeroway_helipad'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/helipad.16.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_aerodrome']['access' != 'private']['icao' != null]['iata' != null][zoom >= 10],
  [feature = 'aeroway_aerodrome'][zoom >= 11] {
    marker-file: url('symbols/openstreetmap-carto/aerodrome.12.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'amenity_ferry_terminal'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/amenity/ferry.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'man_made_lighthouse'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/man_made/lighthouse.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @man-made-icon;
  }

  [feature = 'natural_peak'][zoom >= 13] {
    marker-file: url('symbols/openstreetmap-carto/natural/peak.svg');
    marker-fill: @landform-color;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'natural_volcano'][zoom >= 13] {
    marker-file: url('symbols/openstreetmap-carto/natural/peak.svg');
    marker-fill: @natural_volcano;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'mountain_pass'][zoom >= 11],
  [feature = 'natural_saddle'][zoom >= 13] {
    marker-file: url('symbols/openstreetmap-carto/natural/saddle.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @man-made-icon;
    [feature = 'natural_saddle']{ marker-fill: @landform-color; }
  }

  [feature = 'natural_cave_entrance'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/natural/cave.svg');
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'natural_spring'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/spring.svg');
    marker-clip: false;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 13][height > 20],
    [zoom >= 14][height > 10],
    [zoom >= 15][name != null],
    [zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/waterfall.svg');
      marker-placement: interior;
      marker-clip: false;
      marker-fill: @water * 0.6;
    }
  }

  [feature = 'military_bunker'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/bunker.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'power_generator']['generator:source' = 'wind'] {
    [zoom >= 15][location != 'rooftop'][location != 'roof'],
    [zoom >= 15][location = null],
    [zoom >= 19] {
      marker-file: url('symbols/openstreetmap-carto/generator_wind.svg');
      marker-placement: interior;
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'man_made_windmill'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/man_made/windmill.svg');
    marker-placement: interior;
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'shop_bicycle'][zoom >= 14] {
    [zoom <=15] { marker-transform: "scale(0.83)"; }
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_11.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @bicycle-amenity;

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }

    //Do it yourself repair tools sub icon
    [service_bicycle_diy = 'yes'][zoom >= 16] {
      diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
      diy/marker-fill: @bicycle-amenity;
      diy/marker-placement: interior;
      diy/marker-clip: false;
      diy/marker-ignore-placement: true;
      diy/marker-allow-overlap: true;
      diy/marker-width: 11;
      diy/marker-height: 11;
      diy/marker-geometry-transform: translate(-10, 6);
    }
  }

  [feature = 'shop_sports'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/shop/sports.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @amenity-common;

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }

    //Do it yourself repair tools sub icon
    [service_bicycle_diy = 'yes'][zoom >= 16] {
      diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
      diy/marker-fill: @bicycle-amenity;
      diy/marker-placement: interior;
      diy/marker-clip: false;
      diy/marker-ignore-placement: true;
      diy/marker-allow-overlap: true;
      diy/marker-width: 11;
      diy/marker-height: 11;
      diy/marker-geometry-transform: translate(-10, 6);
    }

    //Bicycle retail, repair, rental sub icon
    [service_bicycle_retail_repair_rental = 'yes'][zoom >= 16] {
      bicyclererere/marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_11.svg');
      bicyclererere/marker-placement: interior;
      bicyclererere/marker-clip: false;
      bicyclererere/marker-fill: @bicycle-amenity;
      bicyclererere/marker-ignore-placement: true;
      bicyclererere/marker-allow-overlap: true;
      bicyclererere/marker-width: 11;
      bicyclererere/marker-height: 11;
      bicyclererere/marker-geometry-transform: translate(-14, -6);
    }
  }

  [feature = 'amenity_drinking_water'][zoom >= 16],
  [feature = 'amenity_water_point']['drinking_water'='yes'][zoom >= 16],
  [feature = 'man_made_water_tap']['drinking_water'='yes'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/amenity/drinking_water_full.svg');
    marker-fill: @amenity-water;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }
  [feature = 'amenity_toilets'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/toilets_11.svg');
    marker-fill: @health-color;
    [drinking_water = 'yes'] { marker-fill: @amenity-water; }

    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'shop_doityourself'][zoom >= 16] {
    marker-placement: interior;
    marker-clip: false;
    marker-file: url('symbols/openstreetmap-carto/shop/diy.svg');
    marker-fill: @shop-icon;
  }

  [feature = 'leisure_sports_centre'][zoom >= 16] {
    marker-placement: interior;
    marker-clip: false;
    marker-file: url('symbols/openstreetmap-carto/leisure/water_park.svg');
    marker-fill: @amenity-water;
  }

  [feature = 'shop_supermarket'][zoom >= 16] {
    marker-placement: interior;
    marker-clip: false;
		marker-fill: @shop-icon;
		marker-file: url('symbols/openstreetmap-carto/shop/supermarket.svg');

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }

    //Do it yourself repair tools sub icon
    [service_bicycle_diy = 'yes'][zoom >= 16] {
      diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
      diy/marker-fill: @bicycle-amenity;
      diy/marker-placement: interior;
      diy/marker-clip: false;
      diy/marker-ignore-placement: true;
      diy/marker-allow-overlap: true;
      diy/marker-width: 11;
      diy/marker-height: 11;
      diy/marker-geometry-transform: translate(-10, 6);
    }

    //Bicycle retail, repair, rental sub icon
    [service_bicycle_retail_repair_rental = 'yes'][feature != 'shop_bicycle'][zoom >= 16] {
      bicyclererere/marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_11.svg');
      bicyclererere/marker-placement: interior;
      bicyclererere/marker-clip: false;
      bicyclererere/marker-fill: @bicycle-amenity;
      bicyclererere/marker-ignore-placement: true;
      bicyclererere/marker-allow-overlap: true;
      bicyclererere/marker-width: 11;
      bicyclererere/marker-height: 11;
      bicyclererere/marker-geometry-transform: translate(-14, -6);
    }
	}

  [feature = 'amenity_bar'][zoom >= 17],
  [feature = 'amenity_biergarten'][zoom >= 17],
  [feature = 'amenity_cafe'][zoom >= 17],
  [feature = 'amenity_fast_food'][zoom >= 17],
  [feature = 'amenity_food_court'][zoom >= 17],
  [feature = 'amenity_ice_cream'][zoom >= 17],
  [feature = 'amenity_pub'][zoom >= 17],
  [feature = 'amenity_restaurant'][zoom >= 17],
  [feature = 'shop_bakery'][zoom >= 17],
  [feature = 'shop_convenience'][zoom >= 17],
  [feature = 'shop_convenience;gas'][zoom >= 17],
  [feature = 'shop_greengrocer'][zoom >= 17],
  [feature = 'shop_pastry'][zoom >= 16],
  [feature = 'shop_beverages'][zoom >= 17]
  {
    marker-placement: interior;
    marker-clip: false;

		[feature = 'amenity_bar'],
		[feature = 'amenity_biergarten'],
		[feature = 'amenity_cafe'],
		[feature = 'amenity_fast_food'],
		[feature = 'amenity_food_court'],
		[feature = 'amenity_ice_cream'],
		[feature = 'amenity_pub'],
		[feature = 'amenity_restaurant'] {
			marker-fill: @gastronomy-icon;
		}
		[feature = 'shop_bakery'],
		[feature = 'shop_convenience'],
		[feature = 'shop_convenience;gas'],
		[feature = 'shop_greengrocer'],
		[feature = 'shop_pastry'],
		[feature = 'shop_beverages'] {
			marker-fill: @shop-icon;
		}

    [feature = 'amenity_bar'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/amenity/bar.svg');
    }
    [feature = 'amenity_biergarten'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/amenity/biergarten.svg');
    }
    [feature = 'amenity_cafe'][zoom >= 16] {
      marker-file: url('symbols/osm-bright-gl-style/amenities/cafe_11.svg');
    }
    [feature = 'amenity_fast_food'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/amenity/fast_food.svg');
    }
    [feature = 'amenity_food_court'][zoom >= 16],
    [feature = 'amenity_restaurant'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/amenity/restaurant.svg');
    }
    [feature = 'amenity_ice_cream'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/ice_cream.svg');
    }
    [feature = 'amenity_pub'][zoom >= 16] {
      marker-file: url('symbols/osm-bright-gl-style/amenities/pub_11.svg');
    }
    [feature = 'shop_bakery'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/bakery.svg');
    }
    [feature = 'shop_convenience'][zoom >= 16],
    [feature = 'shop_convenience;gas'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/convenience.svg');

      //Pump sub icon
      [service_bicycle_pump = 'yes'][zoom >= 16],
      [compressed_air = 'yes'][zoom >= 16] {
        pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
        pump/marker-fill: @bicycle-amenity;
        pump/marker-placement: interior;
        pump/marker-clip: false;
        pump/marker-ignore-placement: true;
        pump/marker-allow-overlap: true;
        pump/marker-width: 9;
        pump/marker-height: 11;
        pump/marker-geometry-transform: translate(14, 6);
      }

      //Do it yourself repair tools sub icon
      [service_bicycle_diy = 'yes'][zoom >= 16] {
        diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
        diy/marker-fill: @bicycle-amenity;
        diy/marker-placement: interior;
        diy/marker-clip: false;
        diy/marker-ignore-placement: true;
        diy/marker-allow-overlap: true;
        diy/marker-width: 11;
        diy/marker-height: 11;
        diy/marker-geometry-transform: translate(-10, 6);
      }
    }
    [feature = 'shop_greengrocer'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/greengrocer.svg');
    }
    [feature = 'shop_pastry'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/confectionery.svg');
    }
    [feature = 'shop_beverages'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/beverages.svg');
    }
  }

  [feature = 'amenity_internet_cafe'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/internet_cafe.svg');
    marker-fill: @amenity-common;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_rental'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_rental_11.svg');
    marker-fill: @bicycle-rental;
    marker-placement: interior;
    marker-clip: false;

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }

    //Do it yourself repair tools sub icon
    [service_bicycle_diy = 'yes'][zoom >= 16] {
      diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
      diy/marker-fill: @bicycle-amenity;
      diy/marker-placement: interior;
      diy/marker-clip: false;
      diy/marker-ignore-placement: true;
      diy/marker-allow-overlap: true;
      diy/marker-width: 11;
      diy/marker-height: 11;
      diy/marker-geometry-transform: translate(-10, 6);
    }
  }

  [feature = 'highway_elevator'][zoom >= 18] {
    [access = null],
    [access = 'yes'] {
      marker-file: url('symbols/openstreetmap-carto/highway/elevator.12.svg');
			marker-fill: @transportation-icon;
      [bicycle = null],
			[bicycle = 'no'] {
				marker-fill: @nobike-transportation-icon;
			}
      marker-placement: interior;
    }
  }

  [feature = 'highway_traffic_signals'][zoom >= 18] {
    marker-file: url('symbols/openstreetmap-carto/highway/traffic_light.13.svg');
    marker-fill: #545454;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_parking'][zoom >= 16] {
    marker-file: url('symbols/amenity/bicycle_parking.svg');
    marker-width: 8;
    marker-placement: interior;

    [covered = 'yes'] {
      marker-file: url('symbols/amenity/bicycle_parking_covered.svg');
    }

    [bicycle_parking = 'floor'],
    [bicycle_parking = 'ground_slots'] {
      marker-file: url('symbols/amenity/bicycle_parking_notlockable.svg');
    }

    [supervised = 'yes'],
    [bicycle_parking = 'shed'],
    [bicycle_parking = 'lockers'],
    [bicycle_parking = 'building'] {
      marker-file: url('symbols/amenity/bicycle_parking_secured.svg');

      [covered='yes'],
      [bicycle_parking = 'shed'],
      [bicycle_parking = 'lockers'],
      [bicycle_parking = 'building'] {
        marker-file: url('symbols/amenity/bicycle_parking_secured_covered.svg');
      }
    }

    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }

    //Pump sub icon
    [service_bicycle_pump = 'yes'][zoom >= 16],
    [compressed_air = 'yes'][zoom >= 16] {
      pump/marker-file: url('symbols/osmandapp/amenity/compressed_air.svg');
      pump/marker-fill: @bicycle-amenity;
      pump/marker-placement: interior;
      pump/marker-clip: false;
      pump/marker-ignore-placement: true;
      pump/marker-allow-overlap: true;
      pump/marker-width: 9;
      pump/marker-height: 11;
      pump/marker-geometry-transform: translate(14, 6);
    }

    //Do it yourself repair tools sub icon
    [service_bicycle_diy = 'yes'][zoom >= 16] {
      diy/marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
      diy/marker-fill: @bicycle-amenity;
      diy/marker-placement: interior;
      diy/marker-clip: false;
      diy/marker-ignore-placement: true;
      diy/marker-allow-overlap: true;
      diy/marker-width: 11;
      diy/marker-height: 11;
      diy/marker-geometry-transform: translate(-10, 6);
    }
  }

  [feature = 'amenity_motorcycle_parking'][zoom >= 16] {
    marker-file: url('symbols/amenity/motorcycle_parking.svg');
    marker-width: 8;
    marker-placement: interior;

    [covered = 'yes'] {
      marker-file: url('symbols/amenity/motorcycle_parking_covered.svg');
    }

    [supervised = 'yes'],
    [bicycle_parking = 'shed'],
    [bicycle_parking = 'lockers'],
    [bicycle_parking = 'building'] {
      marker-file: url('symbols/amenity/motorcycle_parking_secured.svg');

      [covered='yes'],
      [bicycle_parking = 'shed'],
      [bicycle_parking = 'lockers'],
      [bicycle_parking = 'building'] {
        marker-file: url('symbols/amenity/motorcycle_parking_secured_covered.svg');
      }
    }

    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'amenity_post_office'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/post_office_11.svg');
    marker-fill: @public-service;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_pharmacy'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/amenity/pharmacy.svg');
    marker-fill: @health-color;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_hospital'][zoom >= 15],
  [feature = 'amenity_clinic'][zoom >= 15],
  [feature = 'healthcare_clinic'][zoom >= 15],
  [feature = 'healthcare_hospital'][zoom >= 15] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/hospital_11.svg');
  }

  [feature = 'amenity_doctors'][zoom >= 18] {
    marker-file: url('symbols/openstreetmap-carto/amenity/doctors.svg');
    marker-fill: @health-color;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_place_of_worship'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/amenity/place_of_worship.svg');
    marker-fill: @religious-icon;
    marker-clip: false;
    [religion = 'christian'] {
      marker-file: url('symbols/openstreetmap-carto/religion/christian.svg');
      [denomination = 'jehovahs_witness']{
        marker-file: url('symbols/openstreetmap-carto/amenity/place_of_worship.svg');
      }
    }
    [religion = 'muslim'] {
      marker-file: url('symbols/openstreetmap-carto/religion/muslim.svg');
    }
    [religion = 'sikh'] {
      marker-file: url('symbols/openstreetmap-carto/religion/sikhist.svg');
    }
    [religion = 'jewish'] {
      marker-file: url('symbols/openstreetmap-carto/religion/jewish.svg');
    }
    [religion = 'hindu'] {
      marker-file: url('symbols/openstreetmap-carto/religion/hinduist.svg');
    }
    [religion = 'buddhist'] {
      marker-file: url('symbols/openstreetmap-carto/religion/buddhist.svg');
    }
    [religion = 'shinto'] {
      marker-file: url('symbols/openstreetmap-carto/religion/shintoist.svg');
    }
    [religion = 'taoist'] {
      marker-file: url('symbols/openstreetmap-carto/religion/taoist.svg');
    }
  }

  [feature = 'amenity_bank'][zoom >= 18] {
    marker-file: url('symbols/openstreetmap-carto/amenity/bank.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }
  [feature = 'amenity_atm'][zoom >= 19] {
    marker-file: url('symbols/openstreetmap-carto/amenity/atm.svg');
    marker-fill: @amenity-common;
    marker-clip: false;
  }
  [feature = 'amenity_parking'] {
    #amenities-poly[zoom >= 16][area > 25000],
    #amenities-poly[zoom >= 18][area > 250],
    [zoom >= 19] {
      marker-file: url('symbols/openstreetmap-carto/amenity/parking.svg');
      marker-clip: false;
      marker-fill: @amenity-common;
      marker-placement: interior;
      marker-width: 10;

      [access != ''][access != 'permissive'][access != 'yes'] { marker-opacity: 0.33; }
    }
  }
  [feature = 'amenity_community_centre'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/community_centre.svg');
    marker-fill: @amenity-common;
    marker-clip: false;
  }

  //Only at the end of Decembre.
  [feature = 'xmas_tree'][zoom >= 15] {
    marker-file: url('symbols/amenity/xmas_tree.svg');
    marker-fill: #146b3a;
    marker-clip: false;
  }
  [feature = 'xmas_market'][zoom >= 15] {
      marker-file: url('symbols/openstreetmap-carto/shop/marketplace.svg');
      marker-fill: #bb2528;
      marker-clip: false;
    }
}

#amenities-points,
#amenities-poly,
#amenities-line {
  [feature = 'highway_ford'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/highway/ford.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }
}

#amenities-points-text,
#amenities-poly-text {
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'] {
    [zoom >= 18] {
      text-name: "[capacity]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @bicycle_parking_fill;
      [feature = 'amenity_motorcycle_parking'] {
        text-fill: @motorcycle_parking_fill;
      }
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
      text-placement: interior;
      text-placement-type: simple;
      text-placements: "S,N,E,W,NE,SE,NW,SW";
      text-dy: 6;
      text-dx: 6;
      [access != ''][access != 'permissive'][access != 'yes'] {
        text-opacity: 0.33;
      }
    }
  }

  [feature = 'shop_bicycle'],
  [feature = 'shop_sports'],
  [feature = 'shop_bakery'],
  [feature = 'shop_convenience'],
  [feature = 'shop_convenience;gas'],
  [feature = 'shop_greengrocer'],
  [feature = 'shop_pastry'],
  [feature = 'shop_beverages'] {
    [zoom >= 18] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
      text-placement: interior;
      [feature = 'shop_bicycle'] { text-fill: @bicycle-amenity; }
    }
  }

  [feature = 'shop_supermarket'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 12;
    text-fill: @shop-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: rgba(255, 255, 255, 0.6);
    text-placement: interior;
  }

  [feature = 'leisure_sports_centre'][zoom >= 16] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 12;
    text-fill: @marina-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: rgba(255, 255, 255, 0.6);
    text-placement: interior;
  }

  [feature = 'shop_doityourself'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 12;
    text-fill: @shop-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: rgba(255, 255, 255, 0.6);
    text-placement: interior;
  }

  [feature = 'amenity_pharmacy'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 12;
    text-fill: @health-color;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
  }

  [feature = 'amenity_doctors'][zoom >= 19] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 12;
    text-fill: @health-color;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
  }

  [feature = 'amenity_internet_cafe'][zoom >= 18],
  [feature = 'amenity_bar'][zoom >= 18],
  [feature = 'amenity_biergarten'][zoom >= 18],
  [feature = 'amenity_cafe'][zoom >= 18],
  [feature = 'amenity_fast_food'][zoom >= 18],
  [feature = 'amenity_food_court'][zoom >= 18],
  [feature = 'amenity_ice_cream'][zoom >= 18],
  [feature = 'amenity_pub'][zoom >= 18],
  [feature = 'amenity_restaurant'][zoom >= 18] {
		text-name: "[name]";
		text-fill: @gastronomy-text;
		text-size: @standard-font-size;
		text-wrap-width: @standard-wrap-width;
		text-line-spacing: @standard-line-spacing-size;
		text-dy: 11;
		text-face-name: @standard-font;
		text-halo-radius: @standard-halo-radius;
		text-halo-fill: @standard-halo-fill;
		text-placement: interior;
		[feature = 'amenity_bar'] {
			text-dy: 13;
		}
	}

  [feature = 'amenity_bicycle_rental'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @bicycle-rental;
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
		text-placement: interior;
  }

  [feature = 'amenity_police'][zoom >= 18],
  [feature = 'amenity_post_office'][zoom >= 18] {
		text-name: "[name]";
		text-size: @standard-font-size;
		text-wrap-width: @standard-wrap-width;
		text-line-spacing: @standard-line-spacing-size;
		text-fill: @public-service;
		text-dy: 11;
		text-face-name: @standard-font;
		text-halo-radius: @standard-halo-radius;
		text-halo-fill: @standard-halo-fill;
		text-placement: interior;
  }

  [feature = 'amenity_hospital'][zoom >= 16],
  [feature = 'amenity_clinic'][zoom >= 16],
  [feature = 'healthcare_clinic'][zoom >= 16],
  [feature = 'healthcare_hospital'][zoom >= 16] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-size: @standard-font-size + 1;
    text-wrap-width: @standard-wrap-width;
    text-halo-fill: @standard-halo-fill;
    text-line-spacing: @standard-line-spacing-size;
    text-face-name: @standard-font;
    text-fill: @health-color;
    text-placement-type: simple;
    text-placements: "S,N,E,W,NE,SE,NW,SW,16,14,12";
    text-dy: 12;
    text-dx: 12;
  }

  [feature = 'amenity_place_of_worship'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: #000033;
    text-dy: 12;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'tourism_museum'][way_pixels > 3000][zoom >= 17],
  [feature = 'tourism_museum'][zoom >= 18],
  [feature = 'tourism_information'][zoom >= 19],
  [feature = 'tourism_information']["information"='office'][zoom >= 18],
  [feature = 'tourism_artwork'][zoom >= 19],
  [feature = 'tourism_gallery'][zoom >= 18],
  [feature = 'historic_city_gate'][zoom >= 17],
  [feature = 'historic_wayside_cross'][zoom >= 18],
  [feature = 'historic_monument'][zoom >= 17],
  [feature = 'amenity_theatre'][zoom >= 18],
  [feature = 'amenity_cinema'][zoom >= 18],
  [feature = 'amenity_library'][zoom >= 18],
  [feature = 'amenity_bureau_de_change'][zoom >= 18],
  [feature = 'amenity_casino'][zoom >= 18],
  [feature = 'man_made_cross'][zoom >= 18],
  [feature = 'man_made_lighthouse'][zoom >= 18] {
		text-name: "[name]";
		text-size: @standard-font-size;
		text-wrap-width: @standard-wrap-width;
		text-line-spacing: @standard-line-spacing-size;
		text-fill: @culture;
		text-dy: 11;
		text-face-name: @standard-font;
		text-halo-radius: @standard-halo-radius;
		text-halo-fill: @standard-halo-fill;
		text-placement: interior;
	}

  [feature = 'tourism_camp_site'][zoom >= 17],
  [feature = 'tourism_caravan_site'][zoom >= 17],
  [feature = 'tourism_chalet'][zoom >= 17],
  [feature = 'tourism_guest_house'][zoom >= 17],
  [feature = 'tourism_motel'][zoom >= 17],
  [feature = 'tourism_hostel'][zoom >= 18],
  [feature = 'tourism_hotel'][zoom >= 18] {
		text-name: "[name]";
		text-size: @standard-font-size;
		text-wrap-width: @standard-wrap-width;
		text-line-spacing: @standard-line-spacing-size;
		text-fill: @accommodation-text;
		text-dy: 11;
		text-face-name: @standard-font;
		text-halo-radius: @standard-halo-radius;
		text-halo-fill: @standard-halo-fill;
		text-placement: interior;
  }

  [feature = 'aeroway_aerodrome'][zoom >= 16],
  [feature = 'amenity_ferry_terminal'][zoom >= 15] {
		text-name: "[name]";
		text-size: @standard-font-size;
		text-wrap-width: @standard-wrap-width;
		text-line-spacing: @standard-line-spacing-size;
		text-fill: darken(@airtransport, 15%);
		text-dy: 10;
		text-face-name: @sans_italic;
		text-halo-radius: @standard-halo-radius;
		text-halo-fill: @standard-halo-fill;
		text-placement: interior;
	}

  [feature = 'natural_peak'][zoom >= 14],
  [feature = 'natural_volcano'][zoom >= 14],
  [feature = 'natural_saddle'][zoom >= 14],
  [feature = 'mountain_pass'][zoom >= 14],
  [feature = 'tourism_viewpoint'][zoom >= 16],
  [feature = 'amenity_community_centre'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-common;
    [feature = 'natural_volcano'] { text-fill: #b10000; }
    text-dy: 7;
    [feature = 'tourism_viewpoint'] { text-dy: 12; }
    [feature = 'amenity_community_centre'] { text-dy: 11; text-fill: darken(@amenity-common, 5%); }
    text-face-name: @standard-font;
    text-halo-radius: 1.4;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 14][height > 10],
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @water * 0.6;
      text-dy: 10;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: interior;
    }
  }

  [feature = 'place_island'][zoom >= 14][way_pixels > 3000],
  [feature = 'place_island'][zoom >= 16],
  [feature = 'place_islet'][zoom >= 14][way_pixels > 3000],
  [feature = 'place_islet'][zoom >= 17] {
    text-name: "[name]";
    text-fill: @placenames;
    text-size: 10;
    text-wrap-width: 30;
    text-line-spacing: -1.5;
    [way_pixels > 12000] {
      text-size: 11;
      text-wrap-width: 36;
      text-line-spacing: -1.8;
    }
    [way_pixels > 48000] {
      text-size: 13;
      text-wrap-width: 45;
      text-line-spacing: -2.25;
    }
    text-face-name: @sans_italic;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @place_halo;
  }
}

#trees [zoom >= 16] {
  ::canopy {
    opacity: 0.3;
    [natural = 'tree_row'] {
      line-color: green;
      line-cap: round;
      line-width: 2.5;
      [zoom >= 17] {
        line-width: 5;
      }
      [zoom >= 18] {
        line-width: 10;
      }
      [zoom >= 19] {
        line-width: 15;
      }
      [zoom >= 20] {
        line-width: 30;
      }
    }
    [natural = 'tree'] {
      [zoom >= 18] {
        marker-fill: green;
        marker-allow-overlap: true;
        marker-line-width: 0;
        marker-ignore-placement: true;
        marker-width: 10;
        marker-height: 10;
      }
      [zoom >= 19] {
        marker-width: 15;
        marker-height: 15;
      }
      [zoom >= 20] {
        marker-width: 30;
        marker-height: 30;
      }
    }
  }
  [natural = 'tree']::trunk {
    [zoom >= 18] {
      trunk/marker-fill: #b27f36;
      trunk/marker-allow-overlap: true;
      trunk/marker-line-width: 0;
      trunk/marker-width: 2;
      trunk/marker-height: 2;
      trunk/marker-ignore-placement: true;
    }
    [zoom >= 19] {
      trunk/marker-width: 3;
      trunk/marker-height: 3;
    }
    [zoom >= 20] {
      trunk/marker-width: 6;
      trunk/marker-height: 6;
    }
  }
}

#clpc[zoom >= 19] {
    marker-width: 20;
    marker-file: url('symbols/clpc/right.svg');

    [from_to_angle <= 45],
    [from_to_angle >= 135][from_to_angle <= 225] {
      marker-file: url('symbols/clpc/straight.svg');
    }

    marker-transform: 'rotate([from_azimuth])';
    marker-allow-overlap: true;
}
