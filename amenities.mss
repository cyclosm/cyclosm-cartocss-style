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

#amenities-points,
#amenities-poly {
  [feature = 'tourism_alpine_hut'][zoom >= 13],
  [feature = 'tourism_wilderness_hut'][zoom >= 13],
  [feature = 'amenity_shelter'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/shelter_11.svg');
    [feature = 'tourism_wilderness_hut'] {
      marker-file: url('symbols/osm-bright-gl-style/amenities/shelter_11.svg');
    }
    [feature = 'tourism_alpine_hut'] {
      marker-file: url('symbols/osm-bright-gl-style/amenities/shelter_11.svg');
    }
    [feature = 'amenity_shelter'] {
      marker-fill: @man-made-icon;
    }
    marker-fill: @accommodation-icon;
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

  [feature = 'tourism_camp_site'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/camping.svg');
    marker-fill: @accommodation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_caravan_site'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/caravan_park.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_chalet'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/tourism/chalet.svg');
    marker-fill: @accommodation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_public_bath'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/public_bath.svg');
    marker-fill: @amenity-brown;
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

  [feature = 'amenity_bicycle_repair_station'][zoom >= 19] {
    marker-file: url('symbols/openstreetmap-carto/amenity/bicycle_repair_station.svg');
    marker-fill: @amenity-brown;
    marker-placement: interior;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'tourism_gallery'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/shop/art.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @amenity-brown;
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
    }
    [information = 'office'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/office.svg');
      marker-fill: @amenity-brown;
    }
    [information = 'map'],
    [information = 'tactile_map'],
    [information = 'tactile_model'] {
      marker-file: url('symbols/openstreetmap-carto/tourism/map.svg');
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
    marker-fill: @amenity-brown;
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

  [feature = 'amenity_police'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/amenity/police.svg');
    marker-fill: @public-service;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_post_box'][zoom >= 17] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/post_box_11.svg');
    marker-fill: @amenity-brown;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'emergency_phone'][zoom >= 19] {
    marker-file: url('symbols/openstreetmap-carto/amenity/emergency_phone.svg');
    marker-fill: @amenity-brown;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'tourism_viewpoint'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/tourism/viewpoint.svg');
    marker-placement: interior;
    marker-fill: @amenity-brown;
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

  [feature = 'aeroway_helipad'][zoom >= 16] {
    marker-file: url('symbols/openstreetmap-carto/helipad.16.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_aerodrome']['access' != 'private']['icao' != null]['iata' != null][zoom >= 10][zoom < 14],
  [feature = 'aeroway_aerodrome'][zoom >= 11][zoom < 14] {
    marker-file: url('symbols/openstreetmap-carto/aerodrome.12.svg');
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

  [feature = 'natural_peak'][zoom >= 11] {
    marker-file: url('symbols/openstreetmap-carto/natural/peak.svg');
    marker-fill: @landform-color;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'natural_volcano'][zoom >= 11] {
    marker-file: url('symbols/openstreetmap-carto/natural/peak.svg');
    marker-fill: @natural_volcano;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'natural_saddle'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/natural/saddle.svg');
    marker-fill: @landform-color;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'natural_cave_entrance'][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/natural/cave.svg');
    marker-placement: interior;
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
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_11.svg');
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_drinking_water'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/drinking_water_11.svg');
  }
  [feature = 'amenity_toilets'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/toilets_11.svg');
  }

  [feature = 'shop_supermarket'][zoom >= 16] {
    marker-placement: interior;
    marker-clip: false;
		marker-fill: @shop-icon;
		marker-file: url('symbols/openstreetmap-carto/shop/supermarket.svg');
	}

  [feature = 'amenity_bar'][zoom >= 16],
  [feature = 'amenity_biergarten'][zoom >= 16],
  [feature = 'amenity_cafe'][zoom >= 16],
  [feature = 'amenity_fast_food'][zoom >= 16],
  [feature = 'amenity_food_court'][zoom >= 16],
  [feature = 'amenity_ice_cream'][zoom >= 16],
  [feature = 'amenity_pub'][zoom >= 16],
  [feature = 'amenity_restaurant'][zoom >= 16],
  [feature = 'shop_bakery'][zoom >= 16],
  [feature = 'shop_convenience'][zoom >= 16],
  [feature = 'shop_greengrocer'][zoom >= 16],
  [feature = 'shop_pastry'][zoom >= 16],
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
		[feature = 'shop_greengrocer'],
		[feature = 'shop_pastry'] {
			marker-fill: @shop-icon;
		}

    [feature != 'amenity_food_court'][zoom = 16] {
      marker-width: 4;
      marker-line-width: 0;
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
    [feature = 'shop_convenience'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/convenience.svg');
    }
    [feature = 'shop_greengrocer'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/greengrocer.svg');
    }
    [feature = 'shop_pastry'][zoom >= 16] {
      marker-file: url('symbols/openstreetmap-carto/shop/confectionery.svg');
    }
  }

  [feature = 'amenity_internet_cafe'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/amenity/internet_cafe.svg');
    marker-fill: @amenity-brown;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_rental'][zoom >= 16] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/bicycle_rental_11.svg');
    marker-fill: @transportation-icon;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'highway_elevator'][zoom >= 18] {
    [access = null],
    [access = 'yes'] {
      marker-file: url('symbols/openstreetmap-carto/highway/elevator.12.svg');
      marker-fill: @transportation-icon;
      marker-placement: interior;
    }
  }

  [feature = 'highway_traffic_signals'][zoom >= 17] {
    marker-file: url('symbols/openstreetmap-carto/highway/traffic_light.13.svg');
    marker-fill: #545454;
    marker-placement: interior;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_parking'][zoom >= 16] {
    marker-line-color: @bicycle_parking_line;
    marker-fill: @bicycle_parking_fill;
    marker-width: 7;
    marker-line-width: 1;
  }

  [feature = 'amenity_motorcycle_parking'][zoom >= 16] {
    marker-line-color: @motorcycle_parking_line;
    marker-fill: @motorcycle_parking_fill;
    marker-width: 7;
    marker-line-width: 1;
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
  [feature = 'healthcare_clinic'][zoom >= 15],
  [feature = 'healthcare_hospital'][zoom >= 15] {
    marker-file: url('symbols/osm-bright-gl-style/amenities/hospital_11.svg');
  }
}

#amenities-points-text,
#amenities-poly-text {
  [feature = 'shop_bicycle'][zoom >= 16],
  [feature = 'amenity_hospital'][zoom >= 16],
  [feature = 'healthcare_clinic'][zoom >= 16],
  [feature = 'healthcare_hospital'][zoom >= 16],
  [feature = 'tourism_artwork'][zoom >= 17],
  [feature = 'tourism_camp_site'][zoom >= 17],
  [feature = 'tourism_caravan_site'][zoom >= 17],
  [feature = 'tourism_chalet'][zoom >= 17],
  [feature = 'tourism_guest_house'][zoom >= 17],
  [feature = 'tourism_gallery'][zoom >= 17],
  [feature = 'tourism_motel'][zoom >= 17],
  [feature = 'tourism_hostel'][zoom >= 17],
  [feature = 'tourism_hotel'][zoom >= 17],
  [feature = 'historic_city_gate'][zoom >= 17],
  [feature = 'tourism_museum'][zoom >= 17],
  [feature = 'man_made_cross'][zoom >= 18],
  [feature = 'historic_wayside_cross'][zoom >= 18],
  [feature = 'historic_monument'][zoom >= 17],
  [feature = 'man_made_lighthouse'][zoom >= 17],
  [feature = 'aeroway_aerodrome'][zoom >= 16],
  [feature = 'amenity_pharmacy'][zoom >= 18],
  [feature = 'amenity_internet_cafe'][zoom >= 18],
  [feature = 'amenity_bar'][zoom >= 18],
  [feature = 'amenity_biergarten'][zoom >= 18],
  [feature = 'amenity_cafe'][zoom >= 18],
  [feature = 'amenity_fast_food'][zoom >= 18],
  [feature = 'amenity_food_court'][zoom >= 18],
  [feature = 'amenity_ice_cream'][zoom >= 18],
  [feature = 'amenity_pub'][zoom >= 18],
  [feature = 'amenity_restaurant'][zoom >= 18],
  [feature = 'amenity_bicycle_rental'][zoom >= 18],
  [feature = 'amenity_police'][zoom >= 15],
  [feature = 'amenity_post_office'][zoom >= 16],
  [feature = 'shop_bakery'][zoom >= 18],
  [feature = 'shop_convenience'][zoom >= 18],
  [feature = 'shop_greengrocer'][zoom >= 18],
  [feature = 'shop_supermarket'][zoom >= 17],
  [feature = 'shop_pastry'][zoom >= 18] {
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

  [feature = 'natural_peak'][zoom >= 13],
  [feature = 'natural_volcano'][zoom >= 13],
  [feature = 'natural_saddle'][zoom >= 15],
  [feature = 'tourism_viewpoint'][zoom >= 16] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@landform-color, 30%);
    [feature = 'natural_volcano'] { text-fill: #d40000; }
    text-dy: 7;
    [feature = 'tourism_viewpoint'] { text-dy: 11; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
  }

  [feature = 'tourism_information'][zoom >= 19],
  [feature = 'tourism_information']["information"='office'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(black, 30%);
    [information = 'office'] { text-fill: @amenity-brown; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 13][height > 20],
    [zoom >= 14][height > 10],
    [zoom >= 15][name != null],
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
}
