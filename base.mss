/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Barriers
 * - Buildings
 *
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land-low[zoom>=0][zoom<10],
#land-high[zoom>=10] {
  polygon-fill: @land;
  polygon-gamma: 0.75;
}

#landuse_gen0[zoom>1][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>=13] {
  [type='amenity_grave_yard'],
  [type='landuse_cemetery'] {
    polygon-fill: @cemetery;
    [zoom >= 13] {
      polygon-pattern-file: url('symbols/openstreetmap-carto/grave_yard_generic_many.svg');
      polygon-pattern-opacity: 0.15;
    }
  }
  [type='amenity_college']       { polygon-fill: @school; }
  [type='leisure_common']        { polygon-fill: @park; }
  [type='landuse_forest']        { polygon-fill: @wooded; }
  [type='leisure_golf_course']   { polygon-fill: @grass; }

  [type='landuse_retail'],
  [type='landuse_commercial'] {
    polygon-fill: @industrial;
  }

  [type='leisure_garden'],
  [type='landuse_grass'],
  [type='natural_grassland'] {
    polygon-fill: @grass;
  }

  [type='landuse_landfill'],
  [type='landuse_brownfield'],
  [type='landuse_construction'],
  [type='landuse_industrial'] {
    polygon-fill: @industrial;
  }

  [type='natural_glacier'] {
    polygon-fill: @glacier;
  }
  [type='natural_wetland'] {
    polygon-fill: @grass;
    polygon-pattern-file: url('symbols/openstreetmap-carto/wetland.png');
    polygon-pattern-alignment: global;
  }
  [type='natural_sand'],
  [type='natural_beach'],
  [type='natural_dune'] {
    polygon-fill: @sand;
  }
  [type='natural_bare_rock'] {
    polygon-fill: @bare_ground;
    polygon-pattern-file: url('symbols/openstreetmap-carto/rock_overlay.png');
  }
  [type='natural_scree'],
  [type='natural_shingle'] {
    polygon-fill: @bare_ground;
    polygon-pattern-file: url('symbols/openstreetmap-carto/scree_overlay.png');
  }

  [type='natural_scrub'] {
    polygon-fill: @scrub;
    polygon-pattern-file: url('symbols/openstreetmap-carto/scrub.png');
    polygon-pattern-alignment: global;
  }

  [type='natural_heath']         { polygon-fill: @heath; }
  [type='amenity_hospital']      { polygon-fill: @hospital; }
  [type='landuse_meadow']        { polygon-fill: @meadow; }
  [type='landuse_vineyard'] {
    polygon-fill: @meadow;
    [zoom >= 13] {
      polygon-pattern-file: url('symbols/openstreetmap-carto/vineyard.png');
      polygon-pattern-alignment: global;
    }
  }
  [type='landuse_plant_nursery'] {
    polygon-fill: @meadow;
  }
  [type='landuse_orchard'] {
    polygon-fill: @meadow;
    [zoom >= 13] {
      polygon-pattern-file: url('symbols/openstreetmap-carto/orchard.png');
      polygon-pattern-alignment: global;
    }
  }
  [type='landuse_allotments'] {
    polygon-fill: @grass;
    [zoom >= 13] {
      polygon-pattern-file: url('symbols/openstreetmap-carto/allotments.png');
      polygon-pattern-alignment: global;
    }
  }

  [type='landuse_quarry'] {
    polygon-fill: @quarry;
    polygon-pattern-file: url('symbols/openstreetmap-carto/quarry.svg');
    [zoom >= 13] {
      line-width: 0.5;
      line-color: grey;
    }
  }

  [type='landuse_village_green'],
  [type='leisure_park'] {
    polygon-fill: @park;
  }

  [type='landuse_greenhouse_horticulture'],
  [type='landuse_farmland'] {
    polygon-fill: @farmland;
  }
  [type='amenity_parking']       { polygon-fill: @parking; }
  [type='highway_pedestrian']    { polygon-fill: @pedestrian_area_fill; }
  [type='highway_footway']       { polygon-fill: @footway_area_fill; }
  [type='landuse_religious']     { polygon-fill: @religious; }
  [type='leisure_pitch']         {
    polygon-fill: @sports;
    [zoom >= 13] {
      polygon-fill: @pitch;
      line-width: 0.5;
      line-color: @pitch * 0.95;
    }
  }
  [type='landuse_residential']   { polygon-fill: @residential; }
  [type='amenity_school']        { polygon-fill: @school; }
  [type='leisure_sports_center'] {
    polygon-fill: @sports;
    [zoom >= 14] {
      polygon-fill: @stadium;
    }
  }
  [type='leisure_stadium']       { polygon-fill: @stadium; }
  [type='leisure_track'][zoom >= 13] {
    polygon-fill: @track;
    line-width: 0.5;
    line-color: @track * 0.95;
  }
  [type='amenity_university']    { polygon-fill: @school; }
  [type='natural_wood']          { polygon-fill: @wooded; }
}

/* Display linear leisure_track like an area. */
#leisure_track[zoom >= 11] {
  ::area_ouline {
    line-cap: round;
    line-join: round;
    line-color: @track * 0.95;
    line-width: 1 + @rdz12_track;
    [zoom>=13] { line-width: 1 + @rdz13_track; }
    [zoom>=14] { line-width: 1 + @rdz14_track; }
    [zoom>=15] { line-width: 1 + @rdz15_track; }
    [zoom>=16] { line-width: 1 + @rdz16_track; }
    [zoom>=17] { line-width: 1 + @rdz17_track; }
    [zoom>=18] { line-width: 1 + @rdz18_track; }
  }

  ::area {
    line-cap: round;
    line-join: round;
    line-color: @track;
    line-width: @rdz12_track;
    [zoom>=13] { line-width: @rdz13_track; }
    [zoom>=14] { line-width: @rdz14_track; }
    [zoom>=15] { line-width: @rdz15_track; }
    [zoom>=16] { line-width: @rdz16_track; }
    [zoom>=17] { line-width: @rdz17_track; }
    [zoom>=18] { line-width: @rdz18_track; }
  }

  /* larger because will contain cycleway line */
  [sport='cycling'],
  [sport='bmx'] {
    ::area_ouline {
      [zoom>=15] { line-width: 1 + 4*@rdz15_cycle; }
      [zoom>=16] { line-width: 1 + 4*@rdz16_cycle; }
      [zoom>=17] { line-width: 1 + 4*@rdz17_cycle; }
      [zoom>=18] { line-width: 1 + 4*@rdz18_cycle; }
    }

    ::area {
      [zoom>=15] { line-width: 4*@rdz15_cycle; }
      [zoom>=16] { line-width: 4*@rdz16_cycle; }
      [zoom>=17] { line-width: 4*@rdz17_cycle; }
      [zoom>=18] { line-width: 4*@rdz18_cycle; }
    }
  }
}

#hillshade[zoom>1] {
  raster-scaling: bilinear;
  raster-comp-op: multiply;
  raster-opacity: 0.85;

  [zoom >= 5] {
    raster-opacity: 0.65;
  }
  [zoom >= 7] {
    raster-opacity: 0.55;
  }
  [zoom >= 14] {
    raster-opacity: 0.45;
  }
  [zoom >= 16] {
    raster-opacity: 0.35;
  }
}

#military-overlay[landuse = 'military'][zoom >= 8][way_pixels > 900],
#military-overlay[landuse = 'military'][zoom >= 13],
#military-overlay[military = 'danger_area'][zoom >= 9] {
  polygon-pattern-file: url('symbols/openstreetmap-carto/danger_red_hatch.png');
  polygon-pattern-alignment: global;
  line-color: @military;
  line-opacity: 0.24;
  line-width: 1.0;
  line-offset: -0.5;
  [zoom >= 15] {
    [military = 'danger_area'] {
      line-opacity: 0.2;
    }
    line-width: 2;
    line-offset: -1.0;
  }
}

#landuse-overlay[type = 'wood'][zoom >= 13] {
  polygon-pattern-file: url('symbols/openstreetmap-carto/leaftype_unknown.svg'); // Lch(55,30,135)
  [leaf_type = "broadleaved"] { polygon-pattern-file: url('symbols/openstreetmap-carto/leaftype_broadleaved.svg'); }
  [leaf_type = "needleleaved"] { polygon-pattern-file: url('symbols/openstreetmap-carto/leaftype_needleleaved.svg'); }
  [leaf_type = "mixed"] { polygon-pattern-file: url('symbols/openstreetmap-carto/leaftype_mixed.svg'); }
  [leaf_type = "leafless"] { polygon-pattern-file: url('symbols/openstreetmap-carto/leaftype_leafless.svg'); }
  polygon-pattern-alignment: global;
  opacity: 0.4; // The entire layer has opacity to handle overlapping forests
}


/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: @water; }

#water_gen0[zoom>1][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>12] {
  [intermittent = 'yes'] {
    polygon-pattern-file: url('symbols/openstreetmap-carto/intermittent_water.png');
  }
  [intermittent = 'no'] {
    polygon-fill: @water;
  }
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_low[zoom>=8][zoom<=12] {
  line-color: @water;
  [zoom=8] { line-width: 0.1; }
  [zoom=9] { line-width: 0.2; }
  [zoom=10]{ line-width: 0.4; }
  [zoom=11]{ line-width: 0.6; }
  [zoom=12]{ line-width: 0.8; }
}

#waterway_med[zoom>=13][zoom<=14] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=13]{ line-width: 1; }
    [zoom=14]{ line-width: 1.5; }
  }
  [type='stream'] {
    [zoom=13]{ line-width: 0.2; }
    [zoom=14]{ line-width: 0.4; }
  }
}

#waterway_high[zoom>=15] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=15]{ line-width: 2; }
    [zoom=16]{ line-width: 3; }
    [zoom=17]{ line-width: 4; }
    [zoom=18]{ line-width: 5; }
    [zoom=19]{ line-width: 6; }
    [zoom>19]{ line-width: 7; }
  }
  [type='stream'] {
    [zoom=15]{ line-width: 0.6; }
    [zoom=16]{ line-width: 0.8; }
    [zoom=17]{ line-width: 1; }
    [zoom=18]{ line-width: 1.5; }
    [zoom>18]{ line-width: 2; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=15]{ line-width: 0.1; }
    [zoom=16]{ line-width: 0.3; }
    [zoom=17]{ line-width: 0.5; }
    [zoom=18]{ line-width: 0.7; }
    [zoom=19]{ line-width: 1; }
    [zoom>19]{ line-width: 1.5; }
  }
}

#piers-poly, #piers-line {
  [man_made = 'pier'][zoom >= 12] {
    #piers-poly {
      polygon-fill: @land;
    }
    #piers-line {
      line-width: 0.5;
      line-color: @land;
      line-cap: square;
      [zoom >= 13] { line-width: 1; }
      [zoom >= 15] { line-width: 2; }
      [zoom >= 17] { line-width: 4; }
    }
  }

  [man_made = 'breakwater'][zoom >= 12],
  [man_made = 'groyne'][zoom >= 12] {
    #piers-poly {
      polygon-fill: @land;
    }
    #piers-line {
      line-width: 1;
      line-color: @land;
      [zoom >= 13] { line-width: 2; }
      [zoom >= 16] { line-width: 4; }
    }
  }
}

/* ================================================================== */
/* Contours
/* ================================================================== */
.contours {
  line-color: @contours-stroke;

  /* 100 m */
  #contours100 {
    [zoom >= 11] { line-width: 0.2; }
    [zoom >= 12] { line-width: 0.4; }
    [zoom >= 13] { line-width: 0.5; }
    [zoom >= 14] { line-width: 0.6; line-smooth: 0.5; }
    [zoom >= 16] { line-width: 1; }
  }

  /* 50 m */
  #contours50 {
    [zoom >= 11] { line-width: 0.2; }
    [zoom >= 13] { line-width: 0.3; }
    [zoom >= 14] { line-width: 0.4; line-smooth: 0.5; }
    [zoom >= 16] { line-width: 0.8; line-smooth: 0.5; }

    [zoom = 14] {
      text-face-name: @sans_bold;
      text-size: @contours-font-size;
      text-fill: @contours-fill;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @contours-halo-fill;
      text-placement: line;
      text-label-position-tolerance: @contours-position-tolerance;
      text-spacing: @contours-small-spacing;
      text-min-path-length: @contours-small-min-path-length;
      text-max-char-angle-delta: @contours-max-char-angle-delta;
      text-name: "[ele]";
    }
  }

  /* 20 m */
  #contours20 {
    [zoom >= 12] { line-width: 0.2; line-smooth: 0.5; }
    [zoom >= 16] { line-width: 0.4; }
  }

  /* 10m */
  #contours10 {
    [zoom >= 13] { line-width: 0.2; line-smooth: 0.5; }
    [zoom >= 15] {
      text-face-name: @standard-font;
      text-size: @contours-font-size;
      text-fill: @contours-fill;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @contours-halo-fill;
      text-placement: line;
      text-label-position-tolerance: @contours-position-tolerance;
      text-spacing: @contours-spacing;
      text-min-path-length: @contours-min-path-length;
      text-max-char-angle-delta: @contours-max-char-angle-delta;
      text-name: "[ele]";
    }
    [zoom >= 16] { line-width: 0.4; }
  }

  /* All labels */
  #contours100, #contours50, #contours10 {
    [zoom >= 16] {
      text-face-name: @standard-font;
      text-size: @contours-larger-font-size;
      text-fill: @contours-fill;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @contours-halo-fill;
      text-placement: line;
      text-label-position-tolerance: @contours-position-tolerance;
      text-spacing: @contours-spacing;
      text-min-path-length: @contours-min-path-length;
      text-max-char-angle-delta: @contours-max-char-angle-delta;
      text-name: "[ele]";
    }
  }
}

/* ---- CLIFFS ---- */
#cliffs {
  [natural = 'cliff'][zoom >= 13] {
    line-pattern-file: url('symbols/openstreetmap-carto/cliff.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/openstreetmap-carto/cliff2.svg');
    }
  }
  [man_made = 'embankment'][zoom >= 15]::man_made {
    line-pattern-file: url('symbols/openstreetmap-carto/embankment.svg');
  }
}

#barriers_line {
  [zoom >= 16] {
    line-width: 0.4;
    line-color: #444;
  }
  [feature = 'barrier_hedge'][zoom >= 16] {
    line-width: 1.5;
    line-color: @hedge;
    [zoom >= 17] {
      line-width: 2;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
  [feature = 'historic_citywalls'],
  [feature = 'barrier_city_wall'] {
    [zoom >= 15] {
      line-width: 1;
      line-color: lighten(#444, 50%);
    }
    [zoom >= 16] {
      line-width: 1.5;
    }
    [zoom >= 17] {
      line-width: 2;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
}

/* ---- BUILDINGS ---- */
#buildings[zoom>=16] {
  polygon-fill: @building;

  /* Render perimeter of buildings in high zooms */
  [zoom>=18] {
    line-color: #b6b2af;
    line-width: 0.75;
  }
}
