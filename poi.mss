#amenities[zoom>=14][zoom<=20] {
  [amenity = 'bicycle_shop'] { 
    marker-file: url('img/amenities/bicycle_11.svg');
  }
}

#amenities[zoom>=15][zoom<=20] {
  [amenity = 'bicycle_parking'] {
    marker-line-color: @bicycle_parking_line;
    marker-fill: @bicycle_parking_fill;
    marker-width: 7;
    marker-line-width: 1;
  }
  [amenity = 'motorcycle_parking'] {
    marker-line-color: @motorcycle_parking_line;
    marker-fill: @motorcycle_parking_fill;
    marker-width: 7;
    marker-line-width: 1;
  }
}

#amenities[zoom>=16][zoom<=20] {
  [amenity = 'bicycle_rental'] { 
    marker-file: url('img/amenities/bicycle_rental_11.svg');
  }
  [amenity = 'cafe'] { 
    marker-file: url('img/amenities/cafe_11.svg');
  }
  [amenity = 'drinking_water'] { 
    marker-file: url('img/amenities/drinking_water_11.svg');
  }
  [amenity = 'hospital'] { 
    marker-file: url('img/amenities/hospital_11.svg');
  }
  [amenity = 'post_office'] { 
    marker-file: url('img/amenities/post_office_11.svg');
  }
  [amenity = 'post_box'] { 
    marker-file: url('img/amenities/post_box_11.svg');
  }
  [amenity = 'pub'] { 
    marker-file: url('img/amenities/pub_11.svg');
  }
  [amenity = 'shelter'] { 
    marker-file: url('img/amenities/shelter_11.svg');
  }
  [amenity = 'toilets'] { 
    marker-file: url('img/amenities/toilets_11.svg');
  }
}
