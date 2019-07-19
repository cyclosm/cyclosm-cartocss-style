/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
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

#landuse_gen0[zoom>3][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>12] {
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='golf_course']   { polygon-fill: @grass; }

  [type='garden'],
  [type='grass'],
  [type='grassland'] {
    polygon-fill: @grass;
  }

  [type='heath']         { polygon-fill: @heath; }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='meadow']        { polygon-fill: @meadow; }
  [type='farmland']      { polygon-fill: @farmland; }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_area_fill; }
  [type='religious']     { polygon-fill: @religious; }
  [type='pitch']         {
    polygon-fill: @sports;
    [zoom >= 13] {
      polygon-fill: @pitch;
      line-width: 0.5;
      line-color: @pitch * 0.95;
    }

  }
  [type='residential']   { polygon-fill: @residential; }
  [type='school']        { polygon-fill: @school; }
  [type='sports_center'] {
    polygon-fill: @sports;
    [zoom >= 14] {
      polygon-fill: @stadium;
    }
  }
  [type='stadium']       { polygon-fill: @stadium; }
  [type='track'][zoom >= 13] {
    polygon-fill: @track;
    line-width: 0.5;
    line-color: @track * 0.95;
  }
  [type='university']    { polygon-fill: @school; }
  [type='wood']          { polygon-fill: @wooded; }
}

#hillshade5000, #hillshade1000, #hillshade500 {
  raster-opacity: 0.9;
  raster-scaling: bilinear;
  raster-comp-op: multiply;
}

#hillshade90 {
  raster-opacity: 0.75;
//  raster-scaling: lanczos; //To be used for max quality.
  raster-scaling: bilinear;
  raster-comp-op: multiply;
}

#landuse_overlays[type='nature_reserve'][zoom>=7] {
  line-color: darken(@wooded,25%);
  line-opacity:  0.3;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0.1;
  [zoom=7] { line-width: 0.4; }
  [zoom=8] { line-width: 0.6; }
  [zoom=9] { line-width: 0.8; }
  [zoom=10] { line-width: 1.0; }
  [zoom=11] { line-width: 1.5; }
  [zoom>=12] { line-width: 2.0; }
}

#landuse_overlays[type='wetland'][zoom>11] {
  [zoom>11][zoom<=14] { polygon-pattern-file:url(symbols/landuse/marsh-16.png); }
  [zoom>14] { polygon-pattern-file:url(symbols/landuse/marsh-32.png);}
}

#landuse_overlays[type = 'military'][zoom >= 8][way_pixels > 900],
#landuse_overlays[type = 'military'][zoom >= 13],
#landuse_overlays[type = 'danger_area'][zoom >= 9] {
  polygon-pattern-file: url('symbols/openstreetmap-carto/military_red_hatch.png');
  polygon-pattern-alignment: global;
  line-color: @military;
  line-opacity: 0.24;
  line-width: 1.0;
  line-offset: -0.5;
  [zoom >= 15] {
    [type = 'danger_area'] {
      polygon-pattern-file: url('symbols/openstreetmap-carto/danger_red_hatch.png');
      line-opacity: 0.2;
    }
    line-width: 2;
    line-offset: -1.0;
  }
}

/* ---- BUILDINGS ---- */
#buildings[zoom>=16] {
  polygon-fill:@building;
  opacity: 0.5;
}
// At the highest zoom levels, render buildings in fancy pseudo-3D.
// Ordering polygons by their Y-position is necessary for this effect
// so we use a separate layer that does this for us.
// Not mandatory but brings a good visualization of the building's perimeter
// that might be off due to hill shading.
#buildings[zoom>=17][type != 'hedge'] {
  building-fill:@building;
  building-height:1.25;
}
#buildings[zoom>=17][type = 'hedge'] {
  building-fill:@wooded;
  building-height:1.25;
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: @water; }

#water_gen0[zoom>3][zoom<=9],
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
