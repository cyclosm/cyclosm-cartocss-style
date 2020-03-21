/* ==================================================================
                    ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom>=5][zoom<=8] {
  [type='railway'] {
    line-color: @rail-line;
  }

  [type='motorway'] {
    line-color: @motorway-trunk-line;
    [bicycle='yes'] {
      line-color: @motorway-trunk-cycle-fill;
    }
  }
  [type='trunk'] {
    line-color: @motorway-trunk-cycle-fill;
    [bicycle='no'] {
      line-color: @motorway-trunk-line;
    }
  }

  [zoom >= 5] {
    line-width: 0.3;
  }
  [zoom >= 6] {
    line-width: 0.4;
  }
  [zoom >= 7] {
    line-width: 0.6;
  }
  [zoom >= 8] {
    line-width: 0.8;
  }
}

/* At mid-level scales start to show primary and secondary routes
as well. */

#roads_med[zoom >= 9] {

  [type='railway'] {
    line-width: 1;
    line-color: @rail-line;
  }

  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway-trunk-fill;
    [can_bicycle='yes'] {
      line-color: @motorway-trunk-cycle-fill;
    }
  }
  [type='trunk'],
  [type='trunk_link'] {
      line-color: @motorway-trunk-cycle-fill;
      [can_bicycle='no'] {
        line-color: @motorway-trunk-fill;
      }
  }
  [type='primary'] {
    line-color: @primary-case;
  }
  [type='secondary'],
  [type='tertiary'] {
    line-color: @standard-case;
  }

  [type='motorway'],
  [type='trunk'],
  [type='primary'],
  [type='motorway_link'],
  [type='trunk_link'] {
    line-width: 1;
  }
  [type='secondary'],
  [type='tertiary']
  {
    line-width: 0.6;
  }


  [zoom >= 10] {
    [type='motorway'],
    [type='trunk'],
    [type='primary'],
    [type='motorway_link'],
    [type='trunk_link'],
    [type='secondary'],
    [type='tertiary'] {
      line-width: 1;
    }
  }
}

/* At higher levels the roads become more complex. We're now showing
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* ---------------------------------------------------------- */
/* ---------------- Variables ------------------------------- */
/* ---------------------------------------------------------- */
/*
 * Road width variables that are used in road & bridge styles.
 *
 * Roads are drawn in two steps. First, a line if the width of the road + the
 * two borders is drawn and then a line of the width of the road is drawn on
 * top, to make a road with borders. Here, the width of the ways is the width
 * of the fill of the road and the border width is the width of a single
 * border, on one side (first line is drawn with a width of way with + 2 *
 * border_width).
 */

/* -- Zoom 11 -- */
/* Width of ways */
@rdz11_motorway_trunk: 1.2;
@rdz11_primary: 0.8;
@rdz11_secondary: 0.8;
@rdz11_motorway_link: 0;
@rdz11_trunk_link: 0;
@rdz11_primary_link: 0;
@rdz11_secondary_link: 0;
@rdz11_tertiary: 0;
@rdz11_tertiary_link: 0;
@rdz11_unclassified: 0;
@rdz11_residential: 0;
@rdz11_road: 0;
@rdz11_living_street: 0;
@rdz11_service: 0;
@rdz11_track: 0.25;
@rdz11_pedestrian: 0;
@rdz11_path: 0.30;
@rdz11_cycle: 0.5;
@rdz11_railway: 0.5;
/* Border width (one side of the road only) */
@rdz11_motorway_trunk_outline: 1;
@rdz11_primary_outline: 0.8;
@rdz11_secondary_outline: 0.8;
@rdz11_motorway_link_outline: 0.15;
@rdz11_trunk_link_outline: 0.15;
@rdz11_primary_link_outline: 0.15;
@rdz11_secondary_link_outline: 0.15;
@rdz11_tertiary_outline: 0.2;
@rdz11_tertiary_link_outline: 0.15;
@rdz11_unclassified_outline: 0.2;
@rdz11_residential_outline: 0.15;
@rdz11_road_outline: 0.15;
@rdz11_living_street_outline: 0.15;
@rdz11_service_outline: 0.15;
@rdz11_pedestrian_outline: 0.15;

/* -- Zoom 12 -- */
@rdz12_motorway_trunk: 2;
@rdz12_primary: 1.2;
@rdz12_secondary: 1.2;
@rdz12_motorway_link: 0.5;
@rdz12_trunk_link: 0.5;
@rdz12_primary_link: 0.5;
@rdz12_secondary_link: 0.5;
@rdz12_tertiary: 1;
@rdz12_tertiary_link: 0.5;
@rdz12_unclassified: 1;
@rdz12_residential: 0.5;
@rdz12_road: 0.5;
@rdz12_living_street: 0.5;
@rdz12_service: 0;
@rdz12_track: 0.5;
@rdz12_pedestrian: 0.5;
@rdz12_path: 0.5;
@rdz12_cycle: 1;
@rdz12_railway: 0.5;
/* Border width (one side of the road only) */
@rdz12_motorway_trunk_outline: 1;
@rdz12_primary_outline: 1;
@rdz12_secondary_outline: 1;
@rdz12_motorway_link_outline: 0.25;
@rdz12_trunk_link_outline: 0.25;
@rdz12_primary_link_outline: 0.25;
@rdz12_secondary_link_outline: 0.25;
@rdz12_tertiary_outline: 1;
@rdz12_tertiary_link_outline: 0.25;
@rdz12_unclassified_outline: 1;
@rdz12_residential_outline: 0.25;
@rdz12_road_outline: 0.25;
@rdz12_living_street_outline: 0.25;
@rdz12_service_outline: 0.25;
@rdz12_pedestrian_outline: 0.25;

/* -- Zoom 13 -- */
@rdz13_motorway_trunk: 3;
@rdz13_primary: 2;
@rdz13_secondary: 2;
@rdz13_motorway_link: 0.6;
@rdz13_trunk_link: 0.6;
@rdz13_primary_link: 0.6;
@rdz13_secondary_link: 0.6;
@rdz13_tertiary: 2;
@rdz13_tertiary_link: 0.6;
@rdz13_unclassified: 1.5;
@rdz13_residential: 1;
@rdz13_road: 1;
@rdz13_living_street: 0.6;
@rdz13_service: 1;
@rdz13_track: 1;
@rdz13_pedestrian: 0.6;
@rdz13_bridleway: 0.20;
@rdz13_path: 0.65;
@rdz13_footway: 0.20;
@rdz13_steps: 0.3;
@rdz13_cycle: 1;
@rdz13_railway: 0.5;
/* Border width (one side of the road only) */
@rdz13_motorway_trunk_outline: 1;
@rdz13_primary_outline: 1;
@rdz13_secondary_outline: 1;
@rdz13_motorway_link_outline: 0.6;
@rdz13_trunk_link_outline: 0.6;
@rdz13_primary_link_outline: 0.6;
@rdz13_secondary_link_outline: 0.6;
@rdz13_tertiary_outline: 1;
@rdz13_tertiary_link_outline: 0.6;
@rdz13_unclassified_outline: 0.8;
@rdz13_residential_outline: 0.6;
@rdz13_road_outline: 0.6;
@rdz13_living_street_outline: 0.6;
@rdz13_service_outline: 0.3;
@rdz13_pedestrian_outline: 0.6;
@rdz13_steps_outline: 0;

/* -- Zoom 14 -- */
@rdz14_motorway_trunk: 4;
@rdz14_primary: 2.8;
@rdz14_secondary: 2.8;
@rdz14_motorway_link: 1;
@rdz14_trunk_link: 1;
@rdz14_primary_link: 1;
@rdz14_secondary_link: 1;
@rdz14_tertiary: 2;
@rdz14_tertiary_link: 1;
@rdz14_unclassified: 2;
@rdz14_residential: 1;
@rdz14_road: 1;
@rdz14_living_street: 1;
@rdz14_service: 1;
@rdz14_track: 1;
@rdz14_pedestrian: 1;
@rdz14_bridleway: 0.25;
@rdz14_path: 1;
@rdz14_footway: 0.25;
@rdz14_steps: 0.5;
@rdz14_cycle: 2;
@rdz14_railway: 0.6;
@rdz14_turning_circle_marker: 1.1;
/* Border width */
/* Border width (one side of the road only) */
@rdz14_motorway_trunk_outline: 1;
@rdz14_primary_outline: 1;
@rdz14_secondary_outline: 1;
@rdz14_motorway_link_outline: 1;
@rdz14_trunk_link_outline: 1;
@rdz14_primary_link_outline: 1;
@rdz14_secondary_link_outline: 1;
@rdz14_tertiary_outline: 1;
@rdz14_tertiary_link_outline: 1;
@rdz14_unclassified_outline: 1;
@rdz14_residential_outline: 1;
@rdz14_road_outline: 1;
@rdz14_living_street_outline: 1;
@rdz14_service_outline: 0.5;
@rdz14_pedestrian_outline: 1;
@rdz14_steps_outline: 0;

/* -- Zoom 15 -- */
@rdz15_motorway_trunk: 6;
@rdz15_primary: 4;
@rdz15_secondary: 4;
@rdz15_motorway_link: 1.5;
@rdz15_trunk_link: 1.5;
@rdz15_primary_link: 1.5;
@rdz15_secondary_link: 1.5;
@rdz15_tertiary: 3;
@rdz15_tertiary_link: 1.5;
@rdz15_unclassified: 3;
@rdz15_residential: 2;
@rdz15_road: 2;
@rdz15_living_street: 1.5;
@rdz15_service: 2;
@rdz15_track: 2;
@rdz15_pedestrian: 1;
@rdz15_bridleway: 0.5;
@rdz15_path: 1.25;
@rdz15_footway: 0.5;
@rdz15_steps: 0.8;
@rdz15_cycle: 2;
@rdz15_railway: 0.8;
@rdz15_turning_circle_marker: 1.65;
/* Border width (one side of the road only) */
@rdz15_motorway_trunk_outline: 1.25;
@rdz15_primary_outline: 1;
@rdz15_secondary_outline: 1;
@rdz15_motorway_link_outline: 1;
@rdz15_trunk_link_outline: 1;
@rdz15_primary_link_outline: 1;
@rdz15_secondary_link_outline: 1;
@rdz15_tertiary_outline: 1;
@rdz15_tertiary_link_outline: 1;
@rdz15_unclassified_outline: 1;
@rdz15_residential_outline: 1;
@rdz15_road_outline: 1;
@rdz15_living_street_outline: 1;
@rdz15_service_outline: 1;
@rdz15_pedestrian_outline: 1;
@rdz15_steps_outline: 1;

/* -- Zoom 16 -- */
@rdz16_motorway_trunk: 10;
@rdz16_primary: 8;
@rdz16_secondary: 8;
@rdz16_motorway_link: 4;
@rdz16_trunk_link: 4;
@rdz16_primary_link: 4;
@rdz16_secondary_link: 4;
@rdz16_tertiary: 6;
@rdz16_tertiary_link: 4;
@rdz16_unclassified: 6;
@rdz16_residential: 4;
@rdz16_road: 4;
@rdz16_living_street: 3;
@rdz16_service: 3.5;
@rdz16_track: 3;
@rdz16_pedestrian: 2;
@rdz16_bridleway: 0.75;
@rdz16_path: 1.25;
@rdz16_footway: 0.75;
@rdz16_steps: 1.25;
@rdz16_cycle: 2;
@rdz16_railway: 1;
@rdz16_turning_circle_marker: 6;
/* Border width (one side of the road only) */
@rdz16_motorway_trunk_outline: 1.25;
@rdz16_primary_outline: 1.25;
@rdz16_secondary_outline: 1.25;
@rdz16_motorway_link_outline: 1;
@rdz16_trunk_link_outline: 1;
@rdz16_primary_link_outline: 1;
@rdz16_secondary_link_outline: 1;
@rdz16_tertiary_outline: 1;
@rdz16_tertiary_link_outline: 1;
@rdz16_unclassified_outline: 1;
@rdz16_residential_outline: 1;
@rdz16_road_outline: 1;
@rdz16_living_street_outline: 1.5;
@rdz16_service_outline: 1;
@rdz16_pedestrian_outline: 2;
@rdz16_steps_outline: 1;

/* -- Zoom 17 -- */
@rdz17_motorway_trunk: 16;
@rdz17_primary: 14;
@rdz17_secondary: 14;
@rdz17_motorway_link: 8;
@rdz17_trunk_link: 8;
@rdz17_primary_link: 8;
@rdz17_secondary_link: 8;
@rdz17_tertiary: 10;
@rdz17_tertiary_link: 8;
@rdz17_unclassified: 10;
@rdz17_residential: 8;
@rdz17_road: 8;
@rdz17_living_street: 7.5;
@rdz17_service: 6;
@rdz17_track: 4;
@rdz17_pedestrian: 3;
@rdz17_bridleway: 1;
@rdz17_path: 2;
@rdz17_footway: 1.5;
@rdz17_steps: 3;
@rdz17_cycle: 3;
@rdz17_railway: 1;
@rdz17_turning_circle_marker: 15;
/* Border width (one side of the road only) */
@rdz17_motorway_trunk_outline: 1.5;
@rdz17_primary_outline: 1.25;
@rdz17_secondary_outline: 1.25;
@rdz17_motorway_link_outline: 1;
@rdz17_trunk_link_outline: 1;
@rdz17_primary_link_outline: 1;
@rdz17_secondary_link_outline: 1;
@rdz17_tertiary_outline: 1;
@rdz17_tertiary_link_outline: 1;
@rdz17_unclassified_outline: 1;
@rdz17_residential_outline: 1;
@rdz17_road_outline: 1;
@rdz17_living_street_outline: 1.75;
@rdz17_service_outline: 1;
@rdz17_pedestrian_outline: 3;
@rdz17_steps_outline: 1;
@rdz17_line_bridge_outline: 1;  // cycleway, footway, bridleway, path on bridges

/* -- Zoom 18 -- */
@rdz18_motorway_trunk: 23;
@rdz18_primary: 20;
@rdz18_secondary: 20;
@rdz18_motorway_link: 14;
@rdz18_trunk_link: 14;
@rdz18_primary_link: 14;
@rdz18_secondary_link: 14;
@rdz18_tertiary: 16;
@rdz18_tertiary_link: 14;
@rdz18_unclassified: 16;
@rdz18_residential: 14;
@rdz18_road: 14;
@rdz18_living_street: 11;
@rdz18_service: 10;
@rdz18_track: 7;
@rdz18_pedestrian: 4;
@rdz18_bridleway: 1.5;
@rdz18_path: 2.5;
@rdz18_footway: 2;
@rdz18_steps: 3.5;
@rdz18_cycle: 4;
@rdz18_railway: 1;
@rdz18_turning_circle_marker: 21;
/* Border width (one side of the road only) */
@rdz18_motorway_trunk_outline: 2;
@rdz18_primary_outline: 2;
@rdz18_secondary_outline: 2;
@rdz18_motorway_link_outline: 1.75;
@rdz18_trunk_link_outline: 1.75;
@rdz18_primary_link_outline: 1.75;
@rdz18_secondary_link_outline: 1.75;
@rdz18_tertiary_outline: 1.75;
@rdz18_tertiary_link_outline: 1.75;
@rdz18_unclassified_outline: 1.75;
@rdz18_residential_outline: 1.75;
@rdz18_road_outline: 1.75;
@rdz18_living_street_outline: 3;
@rdz18_service_outline: 1.75;
@rdz18_pedestrian_outline: 4;
@rdz18_steps_outline: 1;
@rdz18_line_bridge_outline: 1;  // cycleway, footway, bridleway, path on bridges


/* ---- Casing ----------------------------------------------- */

/* Line to draw both borders (left and right) */
#roads_high::outline[zoom>=11],
#tunnel::outline[zoom>=11],
#bridge::outline[zoom>=11] {
  line-cap: round;

  line-join: round;

  line-color: @standard-case;
  [type='motorway'],
  [type='motorway_link'],
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @motorway-trunk-case;
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary-case;
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary-case;
  }
  [type='tertiary'],
  [type='tertiary_link'],
  [type='unclassified'] {
    line-color: @tertiary-case;
  }

  /* -- widths -- */
  line-width: 0;
  [zoom>=11] {
    [type='motorway'], [type='trunk']     { line-width: @rdz11_motorway_trunk + (2 * @rdz11_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz11_primary + (2 * @rdz11_primary_outline); }
    [type='secondary']     { line-width: @rdz11_secondary + (2 * @rdz11_secondary_outline); }
    [type='tertiary']    { line-width: @rdz11_tertiary + (2 * @rdz11_tertiary_outline); }
    [type='living_street']    { line-width: @rdz11_living_street + (2 * @rdz11_living_street_outline); }
    [type='road']    { line-width: @rdz11_road + (2 * @rdz11_road_outline); }
    [type='unclassified']    { line-width: @rdz11_unclassified + (2 * @rdz11_unclassified_outline); }
    [type='residential']    { line-width: @rdz11_residential + (2 * @rdz11_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz11_tertiary_link + (2 * @rdz11_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz11_secondary_link + (2 * @rdz11_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz11_primary_link + (2 * @rdz11_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz11_trunk_link + (2 * @rdz11_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz11_motorway_link + (2 * @rdz11_motorway_link_outline); }
    /* No minor bridges yet */
    [type='service']      { line-width: @rdz11_service + (2 * @rdz11_service_outline); }
    // bridleway, footway are not shown at Z11
    [type='pedestrian']   { line-width: @rdz11_pedestrian + (2 * @rdz11_pedestrian_outline); }
  }
  [zoom>=12] {
    [type='motorway'], [type='trunk']     { line-width: @rdz12_motorway_trunk + (2 * @rdz12_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz12_primary + (2 * @rdz12_primary_outline); }
    [type='secondary']     { line-width: @rdz12_secondary + (2 * @rdz12_secondary_outline); }
    [type='tertiary']    { line-width: @rdz12_tertiary + (2 * @rdz12_tertiary_outline); }
    [type='living_street']    { line-width: @rdz12_living_street + (2 * @rdz12_living_street_outline); }
    [type='road']    { line-width: @rdz12_road + (2 * @rdz12_road_outline); }
    [type='unclassified']    { line-width: @rdz12_unclassified + (2 * @rdz12_unclassified_outline); }
    [type='residential']    { line-width: @rdz12_residential + (2 * @rdz12_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz12_tertiary_link + (2 * @rdz12_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz12_secondary_link + (2 * @rdz12_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz12_primary_link + (2 * @rdz12_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz12_trunk_link + (2 * @rdz12_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz12_motorway_link + (2 * @rdz12_motorway_link_outline); }
    /* No minor bridges yet */
    [type='service']      { line-width: @rdz12_service + (2 * @rdz12_service_outline); }
    [type='pedestrian']   { line-width: @rdz12_pedestrian + (2 * @rdz12_pedestrian_outline); }
  }
  [zoom>=13] {
    [type='motorway'], [type='trunk']     { line-width: @rdz13_motorway_trunk + (2 * @rdz13_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz13_primary + (2 * @rdz13_primary_outline); }
    [type='secondary']     { line-width: @rdz13_secondary + (2 * @rdz13_secondary_outline); }
    [type='living_street']    { line-width: @rdz13_living_street + (2 * @rdz13_living_street_outline); }
    [type='road']    { line-width: @rdz13_road + (2 * @rdz13_road_outline); }
    [type='unclassified']    { line-width: @rdz13_unclassified + (2 * @rdz13_unclassified_outline); }
    [type='residential']    { line-width: @rdz13_residential + (2 * @rdz13_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz13_tertiary_link + (2 * @rdz13_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz13_secondary_link + (2 * @rdz13_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz13_primary_link + (2 * @rdz13_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz13_trunk_link + (2 * @rdz13_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz13_motorway_link + (2 * @rdz13_motorway_link_outline); }
    [type='tertiary']   { line-width: @rdz13_tertiary + (2 * @rdz13_tertiary_outline); }
    /* No minor bridges yet */
    [type='service']      { line-width: @rdz13_service + (2 * @rdz13_service_outline); }
    [type='pedestrian']   { line-width: @rdz13_pedestrian + (2 * @rdz13_pedestrian_outline); }
  }
  [zoom>=14] {
    [type='motorway'], [type='trunk']     { line-width: @rdz14_motorway_trunk + (2 * @rdz14_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz14_primary + (2 * @rdz14_primary_outline); }
    [type='secondary']     { line-width: @rdz14_secondary + (2 * @rdz14_secondary_outline); }
    [type='tertiary']    { line-width: @rdz14_tertiary + (2 * @rdz14_tertiary_outline); }
    [type='living_street']    { line-width: @rdz14_living_street + (2 * @rdz14_living_street_outline); }
    [type='road']    { line-width: @rdz14_road + (2 * @rdz14_road_outline); }
    [type='unclassified']    { line-width: @rdz14_unclassified + (2 * @rdz14_unclassified_outline); }
    [type='residential']    { line-width: @rdz14_residential + (2 * @rdz14_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz14_tertiary_link + (2 * @rdz14_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz14_secondary_link + (2 * @rdz14_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz14_primary_link + (2 * @rdz14_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz14_trunk_link + (2 * @rdz14_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz14_motorway_link + (2 * @rdz14_motorway_link_outline); }
    /* No minor bridges yet */
    [type='service']      { line-width: @rdz14_service + (2 * @rdz14_service_outline); }
    [type='pedestrian']   { line-width: @rdz14_pedestrian + (2 * @rdz14_pedestrian_outline); }
  }
  [zoom>=15] {
    [type='motorway'], [type='trunk']     { line-width: @rdz15_motorway_trunk + (2 * @rdz15_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz15_primary + (2 * @rdz15_primary_outline); }
    [type='secondary']     { line-width: @rdz15_secondary + (2 * @rdz15_secondary_outline); }
    [type='tertiary']    { line-width: @rdz15_tertiary + (2 * @rdz15_tertiary_outline); }
    [type='living_street']    { line-width: @rdz15_living_street + (2 * @rdz15_living_street_outline); }
    [type='road']    { line-width: @rdz15_road + (2 * @rdz15_road_outline); }
    [type='unclassified']    { line-width: @rdz15_unclassified + (2 * @rdz15_unclassified_outline); }
    [type='residential']    { line-width: @rdz15_residential + (2 * @rdz15_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz15_tertiary_link + (2 * @rdz15_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz15_secondary_link + (2 * @rdz15_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz15_primary_link + (2 * @rdz15_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz15_trunk_link + (2 * @rdz15_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz15_motorway_link + (2 * @rdz15_motorway_link_outline); }
    [type='service']      { line-width: @rdz15_service + (2 * @rdz15_service_outline); }
    [type='pedestrian']   { line-width: @rdz15_pedestrian + (2 * @rdz15_pedestrian_outline); }
  }
  [zoom>=16] {
    [type='motorway'], [type='trunk']     { line-width: @rdz16_motorway_trunk + (2 * @rdz16_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz16_primary + (2 * @rdz16_primary_outline); }
    [type='secondary']     { line-width: @rdz16_secondary + (2 * @rdz16_secondary_outline); }
    [type='tertiary']    { line-width: @rdz16_tertiary + (2 * @rdz16_tertiary_outline); }
    [type='living_street']    { line-width: @rdz16_living_street + (2 * @rdz16_living_street_outline); }
    [type='road']    { line-width: @rdz16_road + (2 * @rdz16_road_outline); }
    [type='unclassified']    { line-width: @rdz16_unclassified + (2 * @rdz16_unclassified_outline); }
    [type='residential']    { line-width: @rdz16_residential + (2 * @rdz16_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz16_tertiary_link + (2 * @rdz16_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz16_secondary_link + (2 * @rdz16_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz16_primary_link + (2 * @rdz16_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz16_trunk_link + (2 * @rdz16_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz16_motorway_link + (2 * @rdz16_motorway_link_outline); }
    [type='service']      { line-width: @rdz16_service + (2 * @rdz16_service_outline); }
    [type='pedestrian']   { line-width: @rdz16_pedestrian + (2 * @rdz16_pedestrian_outline); }
  }
  [zoom>=17] {
    [type='motorway'], [type='trunk']     { line-width: @rdz17_motorway_trunk + (2 * @rdz17_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz17_primary + (2 * @rdz17_primary_outline); }
    [type='secondary']     { line-width: @rdz17_secondary + (2 * @rdz17_secondary_outline); }
    [type='tertiary']    { line-width: @rdz17_tertiary + (2 * @rdz17_tertiary_outline); }
    [type='living_street']    { line-width: @rdz17_living_street + (2 * @rdz17_living_street_outline); }
    [type='road']    { line-width: @rdz17_road + (2 * @rdz17_road_outline); }
    [type='unclassified']    { line-width: @rdz17_unclassified + (2 * @rdz17_unclassified_outline); }
    [type='residential']    { line-width: @rdz17_residential + (2 * @rdz17_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz17_tertiary_link + (2 * @rdz17_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz17_secondary_link + (2 * @rdz17_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz17_primary_link + (2 * @rdz17_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz17_trunk_link + (2 * @rdz17_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz17_motorway_link + (2 * @rdz17_motorway_link_outline); }
    [type='service']      { line-width: @rdz17_service + (2 * @rdz17_service_outline); }
    [type='pedestrian']   { line-width: @rdz17_pedestrian + (2 * @rdz17_pedestrian_outline); }
  }
  [zoom>=18] {
    [type='motorway'], [type='trunk']     { line-width: @rdz18_motorway_trunk + (2 * @rdz18_motorway_trunk_outline); }
    [type='primary']     { line-width: @rdz18_primary + (2 * @rdz18_primary_outline); }
    [type='secondary']     { line-width: @rdz18_secondary + (2 * @rdz18_secondary_outline); }
    [type='tertiary']    { line-width: @rdz18_tertiary + (2 * @rdz18_tertiary_outline); }
    [type='living_street']    { line-width: @rdz18_living_street + (2 * @rdz18_living_street_outline); }
    [type='road']    { line-width: @rdz18_road + (2 * @rdz18_road_outline); }
    [type='unclassified']    { line-width: @rdz18_unclassified + (2 * @rdz18_unclassified_outline); }
    [type='residential']    { line-width: @rdz18_residential + (2 * @rdz18_residential_outline); }
    [type='tertiary_link']    { line-width: @rdz18_tertiary_link + (2 * @rdz18_tertiary_link_outline); }
    [type='secondary_link']    { line-width: @rdz18_secondary_link + (2 * @rdz18_secondary_link_outline); }
    [type='primary_link']    { line-width: @rdz18_primary_link + (2 * @rdz18_primary_link_outline); }
    [type='trunk_link']    { line-width: @rdz18_trunk_link + (2 * @rdz18_trunk_link_outline); }
    [type='motorway_link']    { line-width: @rdz18_motorway_link + (2 * @rdz18_motorway_link_outline); }
    [type='service']      { line-width: @rdz18_service + (2 * @rdz18_service_outline); }
    [type='pedestrian']   { line-width: @rdz18_pedestrian + (2 * @rdz18_pedestrian_outline); }
  }
}

#bridge::outline {
  [zoom>=14] {
    [type='motorway'],
    [type='motorway_link'],
    [type='trunk'],
    [type='trunk_link'],
    [type='primary'],
    [type='primary_link'],
    [type='secondary'],
    [type='secondary_link'],
    [type='tertiary'],
    [type='tertiary_link'],
    [type='unclassified'] {
      line-color: @bridge_case;
    }
  }

  [zoom>=17] {
    [type='bridleway']   { line-color: @land; line-width: @rdz17_bridleway + (2 * @rdz17_line_bridge_outline); }
    [type='footway']   { line-color: @land; line-width: @rdz17_footway + (2 * @rdz17_line_bridge_outline); }

    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-color: @land;
      line-width: @rdz17_path + (2 * @rdz17_line_bridge_outline);
    }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-color: @land;
      line-width: @rdz17_cycle + (2 * @rdz17_line_bridge_outline);
      [oneway='no'][oneway_bicycle='no'] {
        line-width: @rdz17_cycle*1.5 + (2 * @rdz17_line_bridge_outline);
      }
    }
  }

  [zoom >= 18] {
    [type='bridleway']   { line-color: @land; line-width: @rdz18_bridleway + (2 * @rdz18_line_bridge_outline); }
    [type='footway']   { line-color: @land; line-width: @rdz18_footway + (2 * @rdz18_line_bridge_outline); }

    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-color: @land;
      line-width: @rdz18_path + (2 * @rdz18_line_bridge_outline);
    }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-color: @land;
      line-width: @rdz18_cycle + (2 * @rdz18_line_bridge_outline);
      [oneway='no'][oneway_bicycle='no'] {
        line-width: @rdz18_cycle*1.5 + (2 * @rdz18_line_bridge_outline);
      }
    }
  }
}

#tunnel::outline[zoom>=11],
#bridge::outline[zoom>=11] {
  line-cap: butt;
}

#tunnel::outline[zoom>=11] {
  line-dasharray: 3,3;
}

/* Eventually overload right border for cycleways */
#roads_high::outline_right[zoom>=11][cycleway_right_render='track'],
#roads_high::outline_right[zoom>=11][cycleway_right_render='lane'],
#roads_high::outline_right[zoom>=11][cycleway_right_render='busway'],
#roads_high::outline_right[zoom>=17][type='path'][can_bicycle='designated'][segregated='yes'],
#roads_high::outline_right[zoom>=17][type='footway'][can_bicycle='designated'][segregated='yes'],
#tunnel::outline_right[zoom>=11][cycleway_right_render='track'],
#tunnel::outline_right[zoom>=11][cycleway_right_render='lane'],
#tunnel::outline_right[zoom>=11][cycleway_right_render='busway'],
#tunnel::outline_right[zoom>=17][type='path'][can_bicycle='designated'][segregated='yes'],
#tunnel::outline_right[zoom>=17][type='footway'][can_bicycle='designated'][segregated='yes'],
#bridge::outline_right[zoom>=11][cycleway_right_render='track'],
#bridge::outline_right[zoom>=11][cycleway_right_render='lane'],
#bridge::outline_right[zoom>=11][cycleway_right_render='busway'],
#bridge::outline_right[zoom>=17][type='path'][can_bicycle='designated'][segregated='yes'],
#bridge::outline_right[zoom>=17][type='footway'][can_bicycle='designated'][segregated='yes'] {
  /* -- colors & styles -- */
  line-cap: butt;
  [cycleway_right_render='track'] {
    line-color: @cycle_track_case;
  }
  [cycleway_right_render='lane'] {
    line-color: @cycle_lane_case;
    line-dasharray: 6,3;
  }
  [cycleway_right_render='busway'] {
    line-color: @cycle_busway_case;
    line-dasharray: 6,10;
  }
  [type='path'][can_bicycle='designated'][segregated='yes'],
  [type='footway'][can_bicycle='designated'][segregated='yes'] {
    line-color: @path-fill;
  }

  /* widths */
  line-width: 0;
  [zoom>=11] {
    line-offset: 1 * @rdz11_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz11_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz11_motorway_trunk; }
    [type='primary']     { line-width: @rdz11_primary; }
    [type='secondary']     { line-width: @rdz11_secondary; }
    [type='tertiary']    { line-width: @rdz11_tertiary; }
    [type='living_street']    { line-width: @rdz11_living_street; }
    [type='road']    { line-width: @rdz11_road; }
    [type='unclassified']    { line-width: @rdz11_unclassified; }
    [type='residential']    { line-width: @rdz11_residential; }
    [type='tertiary_link']    { line-width: @rdz11_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz11_secondary_link; }
    [type='primary_link']    { line-width: @rdz11_primary_link; }
    [type='trunk_link']    { line-width: @rdz11_trunk_link; }
    [type='motorway_link']    { line-width: @rdz11_motorway_link; }
    [type='service']      { line-width: @rdz11_service; }
    [type='track']      { line-width: @rdz11_track; }
    [type='pedestrian']   { line-width: @rdz11_pedestrian; }
  }
  [zoom>=12] {
    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz12_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz12_motorway_trunk; }
    [type='primary']     { line-width: @rdz12_primary; }
    [type='secondary']     { line-width: @rdz12_secondary; }
    [type='tertiary']    { line-width: @rdz12_tertiary; }
    [type='living_street']    { line-width: @rdz12_living_street; }
    [type='road']    { line-width: @rdz12_road; }
    [type='unclassified']    { line-width: @rdz12_unclassified; }
    [type='residential']    { line-width: @rdz12_residential; }
    [type='tertiary_link']    { line-width: @rdz12_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz12_secondary_link; }
    [type='primary_link']    { line-width: @rdz12_primary_link; }
    [type='trunk_link']    { line-width: @rdz12_trunk_link; }
    [type='motorway_link']    { line-width: @rdz12_motorway_link; }
    [type='service']      { line-width: @rdz12_service; }
    [type='track']      { line-width: @rdz12_track; }
    [type='pedestrian']   { line-width: @rdz12_pedestrian; }
  }
  [zoom>=13] {
    line-offset: 1 * @rdz13_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz13_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz13_motorway_trunk; }
    [type='primary']     { line-width: @rdz13_primary; }
    [type='secondary']     { line-width: @rdz13_secondary; }
    [type='tertiary']    { line-width: @rdz13_tertiary; }
    [type='living_street']    { line-width: @rdz13_living_street; }
    [type='road']    { line-width: @rdz13_road; }
    [type='unclassified']    { line-width: @rdz13_unclassified; }
    [type='residential']    { line-width: @rdz13_residential; }
    [type='tertiary_link']    { line-width: @rdz13_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz13_secondary_link; }
    [type='primary_link']    { line-width: @rdz13_primary_link; }
    [type='trunk_link']    { line-width: @rdz13_trunk_link; }
    [type='motorway_link']    { line-width: @rdz13_motorway_link; }
    [type='service']      { line-width: @rdz13_service; }
    [type='track']      { line-width: @rdz13_track; }
    [type='pedestrian']   { line-width: @rdz13_pedestrian; }
  }
  [zoom>=14] {
    line-offset: 1 * @rdz14_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz14_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz14_motorway_trunk; }
    [type='primary']     { line-width: @rdz14_primary; }
    [type='secondary']     { line-width: @rdz14_secondary; }
    [type='tertiary']    { line-width: @rdz14_tertiary; }
    [type='living_street']    { line-width: @rdz14_living_street; }
    [type='road']    { line-width: @rdz14_road; }
    [type='unclassified']    { line-width: @rdz14_unclassified; }
    [type='residential']    { line-width: @rdz14_residential; }
    [type='tertiary_link']    { line-width: @rdz14_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz14_secondary_link; }
    [type='primary_link']    { line-width: @rdz14_primary_link; }
    [type='trunk_link']    { line-width: @rdz14_trunk_link; }
    [type='motorway_link']    { line-width: @rdz14_motorway_link; }
    [type='service']      { line-width: @rdz14_service; }
    [type='track']      { line-width: @rdz14_track; }
    [type='pedestrian']   { line-width: @rdz14_pedestrian; }
  }
  [zoom>=15] {
    line-offset: 1 * @rdz15_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz15_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz15_motorway_trunk; }
    [type='primary']     { line-width: @rdz15_primary; }
    [type='secondary']     { line-width: @rdz15_secondary; }
    [type='tertiary']    { line-width: @rdz15_tertiary; }
    [type='living_street']    { line-width: @rdz15_living_street; }
    [type='road']    { line-width: @rdz15_road; }
    [type='unclassified']    { line-width: @rdz15_unclassified; }
    [type='residential']    { line-width: @rdz15_residential; }
    [type='tertiary_link']    { line-width: @rdz15_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz15_secondary_link; }
    [type='primary_link']    { line-width: @rdz15_primary_link; }
    [type='trunk_link']    { line-width: @rdz15_trunk_link; }
    [type='motorway_link']    { line-width: @rdz15_motorway_link; }
    [type='service']      { line-width: @rdz15_service; }
    [type='track']      { line-width: @rdz15_track; }
    [type='pedestrian']   { line-width: @rdz15_pedestrian; }
  }
  [zoom>=16] {
    line-offset: 1 * @rdz16_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz16_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz16_motorway_trunk; }
    [type='primary']     { line-width: @rdz16_primary; }
    [type='secondary']     { line-width: @rdz16_secondary; }
    [type='tertiary']    { line-width: @rdz16_tertiary; }
    [type='living_street']    { line-width: @rdz16_living_street; }
    [type='road']    { line-width: @rdz16_road; }
    [type='unclassified']    { line-width: @rdz16_unclassified; }
    [type='residential']    { line-width: @rdz16_residential; }
    [type='tertiary_link']    { line-width: @rdz16_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz16_secondary_link; }
    [type='primary_link']    { line-width: @rdz16_primary_link; }
    [type='trunk_link']    { line-width: @rdz16_trunk_link; }
    [type='motorway_link']    { line-width: @rdz16_motorway_link; }
    [type='service']      { line-width: @rdz16_service; }
    [type='track']      { line-width: @rdz16_track; }
    [type='pedestrian']   { line-width: @rdz16_pedestrian; }
  }
  [zoom>=17] {
    line-offset: 1 * @rdz17_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz17_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz17_motorway_trunk; }
    [type='primary']     { line-width: @rdz17_primary; }
    [type='secondary']     { line-width: @rdz17_secondary; }
    [type='tertiary']    { line-width: @rdz17_tertiary; }
    [type='living_street']    { line-width: @rdz17_living_street; }
    [type='road']    { line-width: @rdz17_road; }
    [type='unclassified']    { line-width: @rdz17_unclassified; }
    [type='residential']    { line-width: @rdz17_residential; }
    [type='tertiary_link']    { line-width: @rdz17_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz17_secondary_link; }
    [type='primary_link']    { line-width: @rdz17_primary_link; }
    [type='trunk_link']    { line-width: @rdz17_trunk_link; }
    [type='motorway_link']    { line-width: @rdz17_motorway_link; }
    [type='service']      { line-width: @rdz17_service; }
    [type='track']      { line-width: @rdz17_track; }
    [type='pedestrian']   { line-width: @rdz17_pedestrian; }
    [type='path'] {
      line-width: @rdz17_path; line-offset: @rdz17_path/2 + @rdz17_cycle/2;
      [oneway='no'][oneway_bicycle='no'] {
        line-width: @rdz17_path; line-offset: @rdz17_path/2 + @rdz17_cycle*1.5/2;
      }
    }
  }
  [zoom>=18] {
    line-offset: 1 * @rdz18_cycle;
    [cycleway_right_oneway='no'] {
      line-offset: 1.5 * @rdz18_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz18_motorway_trunk; }
    [type='primary']     { line-width: @rdz18_primary; }
    [type='secondary']     { line-width: @rdz18_secondary; }
    [type='tertiary']    { line-width: @rdz18_tertiary; }
    [type='living_street']    { line-width: @rdz18_living_street; }
    [type='road']    { line-width: @rdz18_road; }
    [type='unclassified']    { line-width: @rdz18_unclassified; }
    [type='residential']    { line-width: @rdz18_residential; }
    [type='tertiary_link']    { line-width: @rdz18_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz18_secondary_link; }
    [type='primary_link']    { line-width: @rdz18_primary_link; }
    [type='trunk_link']    { line-width: @rdz18_trunk_link; }
    [type='motorway_link']    { line-width: @rdz18_motorway_link; }
    [type='service']      { line-width: @rdz18_service; }
    [type='track']      { line-width: @rdz18_track; }
    [type='pedestrian']   { line-width: @rdz18_pedestrian; }
    [type='path'] {
      line-width: @rdz18_path; line-offset: @rdz18_path/2 + @rdz18_cycle/2;
      [oneway='no'][oneway_bicycle='no']{
        line-width: @rdz18_path; line-offset: @rdz18_path/2 + @rdz18_cycle*1.5/2;
      }
    }

    [cycleway_right_render='lane'][cycleway_right_oneway='yes'],
    [cycleway_right_render='lane'][cycleway_right_oneway='-1'],
    [cycleway_right_render='busway'][cycleway_right_oneway='yes'],
    [cycleway_right_render='busway'][cycleway_right_oneway='-1'] {
      line-width: 0;
    }
  }
}

#roads_high::outline_right2[zoom>=18][cycleway_right_render='lane'][cycleway_right_oneway='yes'],
#roads_high::outline_right2[zoom>=18][cycleway_right_render='lane'][cycleway_right_oneway='-1'],
#roads_high::outline_right2[zoom>=18][cycleway_right_render='busway'][cycleway_right_oneway='yes'],
#roads_high::outline_right2[zoom>=18][cycleway_right_render='busway'][cycleway_right_oneway='-1'],
#tunnel::outline_right2[zoom>=18][cycleway_right_render='lane'][cycleway_right_oneway='yes'],
#tunnel::outline_right2[zoom>=18][cycleway_right_render='lane'][cycleway_right_oneway='-1'],
#tunnel::outline_right2[zoom>=18][cycleway_right_render='busway'][cycleway_right_oneway='yes'],
#tunnel::outline_right2[zoom>=18][cycleway_right_render='busway'][cycleway_right_oneway='-1'],
#bridge::outline_right2[zoom>=18][cycleway_right_render='lane'][cycleway_right_oneway='yes'],
#bridge::outline_right2[zoom>=18][cycleway_right_render='lane'][cycleway_right_oneway='-1'],
#bridge::outline_right2[zoom>=18][cycleway_right_render='busway'][cycleway_right_oneway='yes'],
#bridge::outline_right2[zoom>=18][cycleway_right_render='busway'][cycleway_right_oneway='-1'] {
  [cycleway_right_render='lane'][cycleway_right_oneway='yes'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-cyclelane-right.svg');
  }
  [cycleway_right_render='lane'][cycleway_right_oneway='-1'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-cyclelane-opposite-right.svg');
  }
  [cycleway_right_render='busway'][cycleway_right_oneway='yes'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-busway-right.svg');
  }
  [cycleway_right_render='busway'][cycleway_right_oneway='-1'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-busway-opposite-right.svg');
  }

  [type='motorway'], [type='trunk']     { line-pattern-offset: 0.5 * @rdz18_motorway_trunk + 0.5 * @rdz18_cycle; }
  [type='primary']     { line-pattern-offset: 0.5 * @rdz18_primary + 0.5 * @rdz18_cycle; }
  [type='secondary']     { line-pattern-offset: 0.5 * @rdz18_secondary + 0.5 * @rdz18_cycle; }
  [type='tertiary']    { line-pattern-offset: 0.5 * @rdz18_tertiary + 0.5 * @rdz18_cycle; }
  [type='living_street']    { line-pattern-offset: 0.5 * @rdz18_living_street + 0.5 * @rdz18_cycle; }
  [type='road']    { line-pattern-offset: 0.5 * @rdz18_road + 0.5 * @rdz18_cycle; }
  [type='unclassified']    { line-pattern-offset: 0.5 * @rdz18_unclassified + 0.5 * @rdz18_cycle; }
  [type='residential']    { line-pattern-offset: 0.5 * @rdz18_residential + 0.5 * @rdz18_cycle; }
  [type='tertiary_link']    { line-pattern-offset: 0.5 * @rdz18_tertiary_link + 0.5 * @rdz18_cycle; }
  [type='secondary_link']    { line-pattern-offset: 0.5 * @rdz18_secondary_link + 0.5 * @rdz18_cycle; }
  [type='primary_link']    { line-pattern-offset: 0.5 * @rdz18_primary_link + 0.5 * @rdz18_cycle; }
  [type='trunk_link']    { line-pattern-offset: 0.5 * @rdz18_trunk_link + 0.5 * @rdz18_cycle; }
  [type='motorway_link']    { line-pattern-offset: 0.5 * @rdz18_motorway_link + 0.5 * @rdz18_cycle; }
  [type='service']      { line-pattern-offset: 0.5 * @rdz18_service + 0.5 * @rdz18_cycle; }
  [type='track']      { line-pattern-offset: 0.5 * @rdz18_track + 0.5 * @rdz18_cycle; }
  [type='pedestrian']   { line-pattern-offset: 0.5 * @rdz18_pedestrian + 0.5 * @rdz18_cycle; }
}

#roads_high::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='yes'],
#roads_high::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='-1'],
#tunnel::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='yes'],
#tunnel::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='-1'],
#bridge::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='yes'],
#bridge::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='-1'] {
  marker-placement: line;
  marker-max-error: 0.5;
  marker-spacing: 100;
  marker-file: url(symbols/oneway.svg);
  [cycleway_right_oneway='-1'] {
    marker-file: url(symbols/oneway-reverse.svg);
  }
  marker-fill: #ddf;

  [type='motorway'], [type='trunk']     { marker-transform: translate(0.5 * @rdz18_motorway_trunk + 0.5 * @rdz18_cycle, 0.5 * @rdz18_motorway_trunk + 0.5 * @rdz18_cycle); }
  [type='primary']     { marker-transform: translate(0.5 * @rdz18_primary + 0.5 * @rdz18_cycle, 0.5 * @rdz18_primary + 0.5 * @rdz18_cycle); }
  [type='secondary']     { marker-transform: translate(0.5 * @rdz18_secondary + 0.5 * @rdz18_cycle, 0.5 * @rdz18_secondary + 0.5 * @rdz18_cycle); }
  [type='tertiary']    { marker-transform: translate(0.5 * @rdz18_tertiary + 0.5 * @rdz18_cycle, 0.5 * @rdz18_tertiary + 0.5 * @rdz18_cycle); }
  [type='living_street']    { marker-transform: translate(0.5 * @rdz18_living_street + 0.5 * @rdz18_cycle, 0.5 * @rdz18_living_street + 0.5 * @rdz18_cycle); }
  [type='road']    { marker-transform: translate(0.5 * @rdz18_road + 0.5 * @rdz18_cycle, 0.5 * @rdz18_road + 0.5 * @rdz18_cycle); }
  [type='unclassified']    { marker-transform: translate(0.5 * @rdz18_unclassified + 0.5 * @rdz18_cycle, 0.5 * @rdz18_unclassified + 0.5 * @rdz18_cycle); }
  [type='residential']    { marker-transform: translate(0.5 * @rdz18_residential + 0.5 * @rdz18_cycle, 0.5 * @rdz18_residential + 0.5 * @rdz18_cycle); }
  [type='tertiary_link']    { marker-transform: translate(0.5 * @rdz18_tertiary_link + 0.5 * @rdz18_cycle, 0.5 * @rdz18_tertiary_link + 0.5 * @rdz18_cycle); }
  [type='secondary_link']    { marker-transform: translate(0.5 * @rdz18_secondary_link + 0.5 * @rdz18_cycle, 0.5 * @rdz18_secondary_link + 0.5 * @rdz18_cycle); }
  [type='primary_link']    { marker-transform: translate(0.5 * @rdz18_primary_link + 0.5 * @rdz18_cycle, 0.5 * @rdz18_primary_link + 0.5 * @rdz18_cycle); }
  [type='trunk_link']    { marker-transform: translate(0.5 * @rdz18_trunk_link + 0.5 * @rdz18_cycle, 0.5 * @rdz18_trunk_link + 0.5 * @rdz18_cycle); }
  [type='motorway_link']    { marker-transform: translate(0.5 * @rdz18_motorway_link + 0.5 * @rdz18_cycle, 0.5 * @rdz18_motorway_link + 0.5 * @rdz18_cycle); }
  [type='service']      { marker-transform: translate(0.5 * @rdz18_service + 0.5 * @rdz18_cycle, 0.5 * @rdz18_service + 0.5 * @rdz18_cycle); }
  [type='track']      { marker-transform: translate(0.5 * @rdz18_track + 0.5 * @rdz18_cycle, 0.5 * @rdz18_track + 0.5 * @rdz18_cycle); }
  [type='pedestrian']   { marker-transform: translate(0.5 * @rdz18_pedestrian + 0.5 * @rdz18_cycle, 0.5 * @rdz18_pedestrian + 0.5 * @rdz18_cycle); }
}


#roads_high::outline_left[zoom>=11][cycleway_left_render='track'],
#roads_high::outline_left[zoom>=11][cycleway_left_render='lane'],
#roads_high::outline_left[zoom>=11][cycleway_left_render='busway'],
#tunnel::outline_left[zoom>=11][cycleway_left_render='track'],
#tunnel::outline_left[zoom>=11][cycleway_left_render='lane'],
#tunnel::outline_left[zoom>=11][cycleway_left_render='busway'],
#bridge::outline_left[zoom>=11][cycleway_left_render='track'],
#bridge::outline_left[zoom>=11][cycleway_left_render='lane'],
#bridge::outline_left[zoom>=11][cycleway_left_render='busway'] {
  /* -- colors & styles -- */
  line-cap: butt;
  [cycleway_left_render='track'] {
    line-color: @cycle_track_case;
  }
  [cycleway_left_render='lane'] {
    line-color: @cycle_lane_case;
    line-dasharray: 6,3;
  }
  [cycleway_left_render='busway'] {
    line-color: @cycle_busway_case;
    line-dasharray: 6,10;
  }

  /* widths */
  line-width: 0;
  [zoom>=11] {
    line-offset: -1 * @rdz11_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz11_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz11_motorway_trunk; }
    [type='primary']     { line-width: @rdz11_primary; }
    [type='secondary']     { line-width: @rdz11_secondary; }
    [type='tertiary']    { line-width: @rdz11_tertiary; }
    [type='living_street']    { line-width: @rdz11_living_street; }
    [type='road']    { line-width: @rdz11_road; }
    [type='unclassified']    { line-width: @rdz11_unclassified; }
    [type='residential']    { line-width: @rdz11_residential; }
    [type='tertiary_link']    { line-width: @rdz11_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz11_secondary_link; }
    [type='primary_link']    { line-width: @rdz11_primary_link; }
    [type='trunk_link']    { line-width: @rdz11_trunk_link; }
    [type='motorway_link']    { line-width: @rdz11_motorway_link; }
    [type='service']      { line-width: @rdz11_service; }
    [type='track']      { line-width: @rdz11_track; }
    [type='pedestrian']   { line-width: @rdz11_pedestrian; }
  }
  [zoom>=12] {
    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz12_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz12_motorway_trunk; }
    [type='primary']     { line-width: @rdz12_primary; }
    [type='secondary']     { line-width: @rdz12_secondary; }
    [type='tertiary']    { line-width: @rdz12_tertiary; }
    [type='living_street']    { line-width: @rdz12_living_street; }
    [type='road']    { line-width: @rdz12_road; }
    [type='unclassified']    { line-width: @rdz12_unclassified; }
    [type='residential']    { line-width: @rdz12_residential; }
    [type='tertiary_link']    { line-width: @rdz12_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz12_secondary_link; }
    [type='primary_link']    { line-width: @rdz12_primary_link; }
    [type='trunk_link']    { line-width: @rdz12_trunk_link; }
    [type='motorway_link']    { line-width: @rdz12_motorway_link; }
    [type='service']      { line-width: @rdz12_service; }
    [type='track']      { line-width: @rdz12_track; }
    [type='pedestrian']   { line-width: @rdz12_pedestrian; }
  }
  [zoom>=13] {
    line-offset: -1 * @rdz13_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz13_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz13_motorway_trunk; }
    [type='primary']     { line-width: @rdz13_primary; }
    [type='secondary']     { line-width: @rdz13_secondary; }
    [type='tertiary']    { line-width: @rdz13_tertiary; }
    [type='living_street']    { line-width: @rdz13_living_street; }
    [type='road']    { line-width: @rdz13_road; }
    [type='unclassified']    { line-width: @rdz13_unclassified; }
    [type='residential']    { line-width: @rdz13_residential; }
    [type='tertiary_link']    { line-width: @rdz13_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz13_secondary_link; }
    [type='primary_link']    { line-width: @rdz13_primary_link; }
    [type='trunk_link']    { line-width: @rdz13_trunk_link; }
    [type='motorway_link']    { line-width: @rdz13_motorway_link; }
    [type='service']      { line-width: @rdz13_service; }
    [type='track']      { line-width: @rdz13_track; }
    [type='pedestrian']   { line-width: @rdz13_pedestrian; }
  }
  [zoom>=14] {
    line-offset: -1 * @rdz14_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz14_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz14_motorway_trunk; }
    [type='primary']     { line-width: @rdz14_primary; }
    [type='secondary']     { line-width: @rdz14_secondary; }
    [type='tertiary']    { line-width: @rdz14_tertiary; }
    [type='living_street']    { line-width: @rdz14_living_street; }
    [type='road']    { line-width: @rdz14_road; }
    [type='unclassified']    { line-width: @rdz14_unclassified; }
    [type='residential']    { line-width: @rdz14_residential; }
    [type='tertiary_link']    { line-width: @rdz14_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz14_secondary_link; }
    [type='primary_link']    { line-width: @rdz14_primary_link; }
    [type='trunk_link']    { line-width: @rdz14_trunk_link; }
    [type='motorway_link']    { line-width: @rdz14_motorway_link; }
    [type='service']      { line-width: @rdz14_service; }
    [type='track']      { line-width: @rdz14_track; }
    [type='pedestrian']   { line-width: @rdz14_pedestrian; }
  }
  [zoom>=15] {
    line-offset: -1 * @rdz15_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz15_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz15_motorway_trunk; }
    [type='primary']     { line-width: @rdz15_primary; }
    [type='secondary']     { line-width: @rdz15_secondary; }
    [type='tertiary']    { line-width: @rdz15_tertiary; }
    [type='living_street']    { line-width: @rdz15_living_street; }
    [type='road']    { line-width: @rdz15_road; }
    [type='unclassified']    { line-width: @rdz15_unclassified; }
    [type='residential']    { line-width: @rdz15_residential; }
    [type='tertiary_link']    { line-width: @rdz15_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz15_secondary_link; }
    [type='primary_link']    { line-width: @rdz15_primary_link; }
    [type='trunk_link']    { line-width: @rdz15_trunk_link; }
    [type='motorway_link']    { line-width: @rdz15_motorway_link; }
    [type='service']      { line-width: @rdz15_service; }
    [type='track']      { line-width: @rdz15_track; }
    [type='pedestrian']   { line-width: @rdz15_pedestrian; }
  }
  [zoom>=16] {
    line-offset: -1 * @rdz16_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz16_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz16_motorway_trunk; }
    [type='primary']     { line-width: @rdz16_primary; }
    [type='secondary']     { line-width: @rdz16_secondary; }
    [type='tertiary']    { line-width: @rdz16_tertiary; }
    [type='living_street']    { line-width: @rdz16_living_street; }
    [type='road']    { line-width: @rdz16_road; }
    [type='unclassified']    { line-width: @rdz16_unclassified; }
    [type='residential']    { line-width: @rdz16_residential; }
    [type='tertiary_link']    { line-width: @rdz16_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz16_secondary_link; }
    [type='primary_link']    { line-width: @rdz16_primary_link; }
    [type='trunk_link']    { line-width: @rdz16_trunk_link; }
    [type='motorway_link']    { line-width: @rdz16_motorway_link; }
    [type='service']      { line-width: @rdz16_service; }
    [type='track']      { line-width: @rdz16_track; }
    [type='pedestrian']   { line-width: @rdz16_pedestrian; }
  }
  [zoom>=17] {
    line-offset: -1 * @rdz17_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz17_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz17_motorway_trunk; }
    [type='primary']     { line-width: @rdz17_primary; }
    [type='secondary']     { line-width: @rdz17_secondary; }
    [type='tertiary']    { line-width: @rdz17_tertiary; }
    [type='living_street']    { line-width: @rdz17_living_street; }
    [type='road']    { line-width: @rdz17_road; }
    [type='unclassified']    { line-width: @rdz17_unclassified; }
    [type='residential']    { line-width: @rdz17_residential; }
    [type='tertiary_link']    { line-width: @rdz17_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz17_secondary_link; }
    [type='primary_link']    { line-width: @rdz17_primary_link; }
    [type='trunk_link']    { line-width: @rdz17_trunk_link; }
    [type='motorway_link']    { line-width: @rdz17_motorway_link; }
    [type='service']      { line-width: @rdz17_service; }
    [type='track']      { line-width: @rdz17_track; }
    [type='pedestrian']   { line-width: @rdz17_pedestrian; }
  }
  [zoom>=18] {
    line-offset: -1 * @rdz18_cycle;
    [cycleway_left_oneway='no'] {
      line-offset: -1.5 * @rdz18_cycle;
    }

    [type='motorway'], [type='trunk']     { line-width: @rdz18_motorway_trunk; }
    [type='primary']     { line-width: @rdz18_primary; }
    [type='secondary']     { line-width: @rdz18_secondary; }
    [type='tertiary']    { line-width: @rdz18_tertiary; }
    [type='living_street']    { line-width: @rdz18_living_street; }
    [type='road']    { line-width: @rdz18_road; }
    [type='unclassified']    { line-width: @rdz18_unclassified; }
    [type='residential']    { line-width: @rdz18_residential; }
    [type='tertiary_link']    { line-width: @rdz18_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz18_secondary_link; }
    [type='primary_link']    { line-width: @rdz18_primary_link; }
    [type='trunk_link']    { line-width: @rdz18_trunk_link; }
    [type='motorway_link']    { line-width: @rdz18_motorway_link; }
    [type='service']      { line-width: @rdz18_service; }
    [type='track']      { line-width: @rdz18_track; }
    [type='pedestrian']   { line-width: @rdz18_pedestrian; }

    [cycleway_left_render='lane'][cycleway_left_oneway='yes'],
    [cycleway_left_render='lane'][cycleway_left_oneway='-1'],
    [cycleway_left_render='busway'][cycleway_left_oneway='yes'],
    [cycleway_left_render='busway'][cycleway_left_oneway='-1'] {
      line-width: 0;
    }
  }
}

#roads_high::outline_left2[zoom>=18][cycleway_left_render='lane'][cycleway_left_oneway='yes'],
#roads_high::outline_left2[zoom>=18][cycleway_left_render='lane'][cycleway_left_oneway='-1'],
#roads_high::outline_left2[zoom>=18][cycleway_left_render='busway'][cycleway_left_oneway='yes'],
#roads_high::outline_left2[zoom>=18][cycleway_left_render='busway'][cycleway_left_oneway='-1'],
#tunnel::outline_left2[zoom>=18][cycleway_left_render='lane'][cycleway_left_oneway='yes'],
#tunnel::outline_left2[zoom>=18][cycleway_left_render='lane'][cycleway_left_oneway='-1'],
#tunnel::outline_left2[zoom>=18][cycleway_left_render='busway'][cycleway_left_oneway='yes'],
#tunnel::outline_left2[zoom>=18][cycleway_left_render='busway'][cycleway_left_oneway='-1'],
#bridge::outline_left2[zoom>=18][cycleway_left_render='lane'][cycleway_left_oneway='yes'],
#bridge::outline_left2[zoom>=18][cycleway_left_render='lane'][cycleway_left_oneway='-1'],
#bridge::outline_left2[zoom>=18][cycleway_left_render='busway'][cycleway_left_oneway='yes'],
#bridge::outline_left2[zoom>=18][cycleway_left_render='busway'][cycleway_left_oneway='-1'] {
  [cycleway_left_render='lane'][cycleway_left_oneway='yes'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-cyclelane-left.svg');
  }
  [cycleway_left_render='lane'][cycleway_left_oneway='-1'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-cyclelane-opposite-left.svg');
  }
  [cycleway_left_render='busway'][cycleway_left_oneway='yes'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-busway-left.svg');
  }
  [cycleway_left_render='busway'][cycleway_left_oneway='-1'] {
    line-pattern-file: url('symbols/oriented-cycleways/oriented-busway-opposite-left.svg');
  }

  [type='motorway'], [type='trunk']     { line-pattern-offset: -0.5 * @rdz18_motorway_trunk - 0.5 * @rdz18_cycle; }
  [type='primary']     { line-pattern-offset: -0.5 * @rdz18_primary - 0.5 * @rdz18_cycle; }
  [type='secondary']     { line-pattern-offset: -0.5 * @rdz18_secondary - 0.5 * @rdz18_cycle; }
  [type='tertiary']    { line-pattern-offset: -0.5 * @rdz18_tertiary - 0.5 * @rdz18_cycle; }
  [type='living_street']    { line-pattern-offset: -0.5 * @rdz18_living_street - 0.5 * @rdz18_cycle; }
  [type='road']    { line-pattern-offset: -0.5 * @rdz18_road - 0.5 * @rdz18_cycle; }
  [type='unclassified']    { line-pattern-offset: -0.5 * @rdz18_unclassified - 0.5 * @rdz18_cycle; }
  [type='residential']    { line-pattern-offset: -0.5 * @rdz18_residential - 0.5 * @rdz18_cycle; }
  [type='tertiary_link']    { line-pattern-offset: -0.5 * @rdz18_tertiary_link - 0.5 * @rdz18_cycle; }
  [type='secondary_link']    { line-pattern-offset: -0.5 * @rdz18_secondary_link - 0.5 * @rdz18_cycle; }
  [type='primary_link']    { line-pattern-offset: -0.5 * @rdz18_primary_link - 0.5 * @rdz18_cycle; }
  [type='trunk_link']    { line-pattern-offset: -0.5 * @rdz18_trunk_link - 0.5 * @rdz18_cycle; }
  [type='motorway_link']    { line-pattern-offset: -0.5 * @rdz18_motorway_link - 0.5 * @rdz18_cycle; }
  [type='service']      { line-pattern-offset: -0.5 * @rdz18_service - 0.5 * @rdz18_cycle; }
  [type='track']      { line-pattern-offset: -0.5 * @rdz18_track - 0.5 * @rdz18_cycle; }
  [type='pedestrian']   { line-pattern-offset: -0.5 * @rdz18_pedestrian - 0.5 * @rdz18_cycle; }
}

#roads_high::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='yes'],
#roads_high::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='-1'],
#tunnel::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='yes'],
#tunnel::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='-1'],
#bridge::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='yes'],
#bridge::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='-1'] {
  marker-placement: line;
  marker-max-error: 0.5;
  marker-spacing: 100;
  marker-file: url(symbols/oneway.svg);
  [cycleway_left_oneway='-1'] {
    marker-file: url(symbols/oneway-reverse.svg);
  }
  marker-fill: #ddf;

  [type='motorway'], [type='trunk']     { marker-transform: translate(-0.5 * @rdz18_motorway_trunk - 0.5 * @rdz18_cycle, -0.5 * @rdz18_motorway_trunk - 0.5 * @rdz18_cycle); }
  [type='primary']     { marker-transform: translate(-0.5 * @rdz18_primary - 0.5 * @rdz18_cycle, -0.5 * @rdz18_primary - 0.5 * @rdz18_cycle); }
  [type='secondary']     { marker-transform: translate(-0.5 * @rdz18_secondary - 0.5 * @rdz18_cycle, -0.5 * @rdz18_secondary - 0.5 * @rdz18_cycle); }
  [type='tertiary']    { marker-transform: translate(-0.5 * @rdz18_tertiary - 0.5 * @rdz18_cycle, -0.5 * @rdz18_tertiary - 0.5 * @rdz18_cycle); }
  [type='living_street']    { marker-transform: translate(-0.5 * @rdz18_living_street - 0.5 * @rdz18_cycle, -0.5 * @rdz18_living_street - 0.5 * @rdz18_cycle); }
  [type='road']    { marker-transform: translate(-0.5 * @rdz18_road - 0.5 * @rdz18_cycle, -0.5 * @rdz18_road - 0.5 * @rdz18_cycle); }
  [type='unclassified']    { marker-transform: translate(-0.5 * @rdz18_unclassified - 0.5 * @rdz18_cycle, -0.5 * @rdz18_unclassified - 0.5 * @rdz18_cycle); }
  [type='residential']    { marker-transform: translate(-0.5 * @rdz18_residential - 0.5 * @rdz18_cycle, -0.5 * @rdz18_residential - 0.5 * @rdz18_cycle); }
  [type='tertiary_link']    { marker-transform: translate(-0.5 * @rdz18_tertiary_link - 0.5 * @rdz18_cycle, -0.5 * @rdz18_tertiary_link - 0.5 * @rdz18_cycle); }
  [type='secondary_link']    { marker-transform: translate(-0.5 * @rdz18_secondary_link - 0.5 * @rdz18_cycle, -0.5 * @rdz18_secondary_link - 0.5 * @rdz18_cycle); }
  [type='primary_link']    { marker-transform: translate(0.5 * @rdz18_primary_link - 0.5 * @rdz18_cycle, 0.5 * @rdz18_primary_link - 0.5 * @rdz18_cycle); }
  [type='trunk_link']    { marker-transform: translate(-0.5 * @rdz18_trunk_link - 0.5 * @rdz18_cycle, -0.5 * @rdz18_trunk_link - 0.5 * @rdz18_cycle); }
  [type='motorway_link']    { marker-transform: translate(-0.5 * @rdz18_motorway_link - 0.5 * @rdz18_cycle, -0.5 * @rdz18_motorway_link - 0.5 * @rdz18_cycle); }
  [type='service']      { marker-transform: translate(-0.5 * @rdz18_service - 0.5 * @rdz18_cycle, -0.5 * @rdz18_service - 0.5 * @rdz18_cycle); }
  [type='track']      { marker-transform: translate(-0.5 * @rdz18_track - 0.5 * @rdz18_cycle, -0.5 * @rdz18_track - 0.5 * @rdz18_cycle); }
  [type='pedestrian']   { marker-transform: translate(-0.5 * @rdz18_pedestrian - 0.5 * @rdz18_cycle); }
}


/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel::line[zoom>=14],
#bridge::line[zoom>=14] {
  /* -- colors & styles -- */
  [type='pedestrian'],
  [type='bridleway'],
  [type='footway'],
  [type='path'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [type='steps'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [type='cycleway'],
  [type='footway'][can_bicycle='yes'],
  [type='footway'][can_bicycle='designated'],
  [type='bridleway'][can_bicycle='yes'],
  [type='path'][can_bicycle='yes'],
  [type='path'][can_bicycle='designated'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [type='railway'][tunnel=0] {
    line-color: @land;
    line-join: round;
  }
  /* -- widths -- */
  [zoom>=14] {
    [type='pedestrian']   { line-width: @rdz14_pedestrian + @rdz14_pedestrian_outline; }
    [type='bridleway']   { line-width: @rdz14_bridleway; }
    [type='footway']   { line-width: @rdz14_footway; }
    [type='path']   { line-width: @rdz14_path; }
    [type='steps']        { line-width: @rdz14_steps + @rdz14_steps_outline; }
    [type='cycleway'],
    [type='path'][can_bicycle='yes'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='yes'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz14_cycle;
    }
  }
  [zoom>=15] {
    [type='pedestrian']   { line-width: @rdz15_pedestrian + @rdz15_pedestrian_outline; }
    [type='bridleway']   { line-width: @rdz15_bridleway; }
    [type='footway']   { line-width: @rdz15_footway; }
    [type='path']   { line-width: @rdz15_path; }
    [type='steps']        { line-width: @rdz15_steps + @rdz15_steps_outline; }
    [type='cycleway'],
    [type='path'][can_bicycle='yes'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='yes'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz15_cycle;
    }
  }
  [zoom>=16] {
    [type='pedestrian']   { line-width: @rdz16_pedestrian + @rdz16_pedestrian_outline; }
    [type='bridleway']   { line-width: @rdz16_bridleway; }
    [type='footway']   { line-width: @rdz16_footway; }
    [type='path']   { line-width: @rdz16_path; }
    [type='steps']        { line-width: @rdz16_steps + @rdz16_steps_outline; }
    [type='cycleway'],
    [type='path'][can_bicycle='yes'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='yes'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz16_cycle;
    }
  }
  [zoom>=17] {
    [type='pedestrian']   { line-width: @rdz17_pedestrian + @rdz17_pedestrian_outline; }
    [type='bridleway']   { line-width: @rdz17_bridleway; }
    [type='footway']   { line-width: @rdz17_footway; }
    [type='path']   { line-width: @rdz17_path; }
    [type='steps']        { line-width: @rdz17_steps + @rdz17_steps_outline; }
    [type='cycleway'],
    [type='path'][can_bicycle='yes'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='yes'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz17_cycle;
    }
  }
  [zoom>=18] {
    [type='pedestrian']   { line-width: @rdz18_pedestrian + @rdz18_pedestrian_outline; }
    [type='bridleway']   { line-width: @rdz18_bridleway; }
    [type='footway']   { line-width: @rdz18_footway; }
    [type='path']   { line-width: @rdz18_path; }
    [type='steps']        { line-width: @rdz18_steps + @rdz18_steps_outline; }
    [type='cycleway'],
    [type='path'][can_bicycle='yes'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='yes'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz18_cycle;
    }
  }
}

#roads_high::steps_ramp_left[zoom >= 15],
#tunnel::steps_ramp_left[zoom>=15],
#bridge::steps_ramp_left[zoom>=15] {
  [type='steps'] {
    [has_ramp!='no'][has_ramp!=null] {
      line-color: @cycle-fill;
      [zoom>=15] {
        line-width: @rdz15_steps_outline*2;
        line-offset: @rdz15_steps/2 + @rdz15_steps_outline;
      }
      [zoom>=16] {
        line-width: @rdz16_steps_outline*2;
        line-offset: @rdz16_steps/2 + @rdz16_steps_outline;
      }
      [zoom>=17] {
        line-width: @rdz17_steps_outline*2;
        line-offset: @rdz17_steps/2 + @rdz17_steps_outline;
      }
      [zoom>=18] {
        line-width: @rdz18_steps_outline*2;
        line-offset: @rdz18_steps/2 + @rdz18_steps_outline;
      }
    }
  }
}

#roads_high[zoom>=11],
#tunnel::inline[zoom>=11],
#bridge::inline[zoom>=11] {
  /* -- colors & styles -- */
  line-color: @standard-fill;
  [tunnel=1] {
    line-color: lighten(@standard-fill, 10%);
  }

  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway-trunk-fill;
    [tunnel=1] {
      line-color: lighten(@motorway-trunk-fill, 10%);
    }
    [can_bicycle='yes'] {
      line-color: @motorway-trunk-cycle-fill;
      [tunnel=1] {
        line-color: lighten(@motorway-trunk-cycle-fill, 10%);
      }
    }
  }
  [type='trunk'],
  [type='trunk_link'] {
      line-color: @motorway-trunk-cycle-fill;
      [tunnel=1] {
        line-color: lighten(@motorway-trunk-cycle-fill, 10%);
      }
      [can_bicycle='no'] {
        line-color: @motorway-trunk-fill;
        [tunnel=1] {
          line-color: lighten(@motorway-trunk-fill, 10%);
        }
      }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary-fill;
    [tunnel=1] {
      line-color: lighten(@primary-fill, 5%);
    }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary-fill;
    [tunnel=1] {
      line-color: lighten(@secondary-fill, 5%);
    }
  }
  [type='track'] {
    line-color: @track-fill;
    [tunnel=1] {
      line-color: lighten(@track-fill, 10%);
    }
  }
  [type='cycleway'] {
    line-color: @cycle-fill;
    [tunnel=1] {
      line-color: lighten(@cycle-fill, 15%);
    }
  }
  [type='pedestrian'] {
    line-color: @pedestrian-fill;
    [tunnel=1] {
      line-color: lighten(@pedestrian-fill, 10%);
    }
  }
  [type='bridleway'] {
    line-color: @bridleway-fill;
    [tunnel=1] {
      line-color: lighten(@bridleway-fill, 10%);
    }
  }
  [type='footway'],
  [type='steps'] {
    line-color: @footway-fill;
    [tunnel=1] {
      line-color: lighten(@footway-fill, 10%);
    }
  }
  [type='path'],
  [type='footway'][can_bicycle='yes'],
  [type='bridleway'][can_bicycle='yes'] {
    line-color: @path-fill;
    [tunnel=1] {
      line-color: lighten(@path-fill, 10%);
    }
  }
  [type='path'],
  [type='footway'] {
    [can_bicycle='designated'] {
      line-color: @mixed-cycle-fill;
      [tunnel=1] {
        line-color: lighten(@mixed-cycle-fill, 10%);
      }
      [segregated='yes'] {
        line-color: @cycle-fill;
        [tunnel=1] {
          line-color: lighten(@cycle-fill, 15%);
        }
      }
    }
  }

  /* Maxspeed bike friendliness only applies to a limited set of highways */
  [type != 'trunk_link'][type != 'motorway_link'][type != 'motorway'][type != 'trunk'][type != 'path'][type != 'cycleway'][type != 'track'][type != 'railway'][cyclestreet != 'yes'] {
      /* low maxspeed roads are bike friendly */
      [maxspeed_kmh < 33] {
          line-color: @speed32-fill;
          [tunnel=1] {
            line-color: lighten(@speed32-fill, 10%);
          }
      }
      [maxspeed_kmh < 21] {
          line-color: @speed20-fill;
          [tunnel=1] {
            line-color: lighten(@speed20-fill, 10%);
          }
      }
      [maxspeed_kmh < 10],
      [motor_vehicle='no'][can_bicycle!='no'] {
          line-color: @speedWalk-fill;
          [tunnel=1] {
            line-color: lighten(@speedWalk-fill, 10%);
          }
      }
    [can_bicycle='no'],
    [can_bicycle='private'] {
      line-color: @standard-nobicycle;
      [tunnel=1] {
        line-color: lighten(@standard-nobicycle, 10%);
      }
    }
  }


  /* cycle streets / bicycle roads are bike friendly */
  [cyclestreet='yes'] {
      line-color: @mixed-cycle-fill;
      [tunnel=1] {
        line-color: lighten(@mixed-cycle-fill, 10%);
      }
  }

  [can_bicycle='no'],
  [can_bicycle='private'] {
    line-color: @standard-nobicycle;
    [tunnel=1] {
      line-color: lighten(@standard-nobicycle, 10%);
    }
  }

  [type='service'],
  [type='track'],
  [type='tertiary'],
  [type='living_street'],
  [type='road'],
  [type='unclassified'],
  [type='residential'],
  [type='tertiary_link'],
  [type='secondary_link'],
  [type='primary_link'],
  [type='trunk_link'],
  [type='motorway_link'],
  [type='primary'],
  [type='secondary'],
  [type='motorway'],
  [type='trunk'],
  [type='cycleway'],
  [type='pedestrian'],
  [type='bridleway'],
  [type='footway'],
  [type='path'] {
    line-cap: round;
    line-join: round;
  }

  [tunnel=1] {
    line-cap: butt;
  }

  /* -- widths -- */
  line-width: 0;
  [zoom>=11] {
    [type='motorway'], [type='trunk']     { line-width: @rdz11_motorway_trunk; }
    [type='primary']     { line-width: @rdz11_primary; }
    [type='secondary']     { line-width: @rdz11_secondary; }
    [type='tertiary']    { line-width: @rdz11_tertiary; }
    [type='living_street']    { line-width: @rdz11_living_street; }
    [type='road']    { line-width: @rdz11_road; }
    [type='unclassified']    { line-width: @rdz11_unclassified; }
    [type='residential']    { line-width: @rdz11_residential; }
    [type='tertiary_link']    { line-width: @rdz11_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz11_secondary_link; }
    [type='primary_link']    { line-width: @rdz11_primary_link; }
    [type='trunk_link']    { line-width: @rdz11_trunk_link; }
    [type='motorway_link']    { line-width: @rdz11_motorway_link; }
    [type='service']      { line-width: @rdz11_service; }
    [type='track']      { line-width: @rdz11_track; }
    [type='pedestrian']   { line-width: @rdz11_pedestrian; }
    // bridleway, footway, steps are not shown at Z11
    [type='path'] {
      line-width: @rdz11_path;
    }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'], {
      line-width: @rdz11_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz11_cycle*1.5;
      }
    }
  }
  [zoom>=12] {
    [type='motorway'], [type='trunk']     { line-width: @rdz12_motorway_trunk; }
    [type='primary']     { line-width: @rdz12_primary; }
    [type='secondary']     { line-width: @rdz12_secondary; }
    [type='tertiary']    { line-width: @rdz12_tertiary; }
    [type='living_street']    { line-width: @rdz12_living_street; }
    [type='road']    { line-width: @rdz12_road; }
    [type='unclassified']    { line-width: @rdz12_unclassified; }
    [type='residential']    { line-width: @rdz12_residential; }
    [type='tertiary_link']    { line-width: @rdz12_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz12_secondary_link; }
    [type='primary_link']    { line-width: @rdz12_primary_link; }
    [type='trunk_link']    { line-width: @rdz12_trunk_link; }
    [type='motorway_link']    { line-width: @rdz12_motorway_link; }
    [type='service']      { line-width: @rdz12_service; }
    [type='track']      { line-width: @rdz12_track; }
    [type='pedestrian']   { line-width: @rdz12_pedestrian; }
    // bridleway, footway, steps are not shown at Z12
    [type='path'] {
      line-width: @rdz12_path;
    }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz12_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz12_cycle*1.5;
      }
    }
  }
  [zoom>=13] {
    [type='motorway'], [type='trunk']     { line-width: @rdz13_motorway_trunk; }
    [type='primary']     { line-width: @rdz13_primary; }
    [type='secondary']     { line-width: @rdz13_secondary; }
    [type='living_street']    { line-width: @rdz13_living_street; }
    [type='road']    { line-width: @rdz13_road; }
    [type='unclassified']    { line-width: @rdz13_unclassified; }
    [type='residential']    { line-width: @rdz13_residential; }
    [type='tertiary_link']    { line-width: @rdz13_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz13_secondary_link; }
    [type='primary_link']    { line-width: @rdz13_primary_link; }
    [type='trunk_link']    { line-width: @rdz13_trunk_link; }
    [type='motorway_link']    { line-width: @rdz13_motorway_link; }
    [type='tertiary']   { line-width: @rdz13_tertiary }
    [type='service']      { line-width: @rdz13_service; }
    [type='track']      { line-width: @rdz13_track; }
    [type='pedestrian']   { line-width: @rdz13_pedestrian; }
    [type='bridleway']   { line-width: @rdz13_bridleway; /*line-dasharray: 1,1;*/}
    [type='footway']   { line-width: @rdz13_footway; }
    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-width: @rdz13_path;
    }
    [type='steps']        { line-width: @rdz13_steps;      line-dasharray: 0.5,0.5; }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz13_cycle;
      [oneway='no'][oneway_bicycle='no'] {
        line-width: @rdz13_cycle*1.5;
      }
    }
  }
  [zoom>=14] {
    [type='motorway'], [type='trunk']     { line-width: @rdz14_motorway_trunk; }
    [type='primary']     { line-width: @rdz14_primary; }
    [type='secondary']     { line-width: @rdz14_secondary; }
    [type='tertiary']    { line-width: @rdz14_tertiary; }
    [type='living_street']    { line-width: @rdz14_living_street; }
    [type='road']    { line-width: @rdz14_road; }
    [type='unclassified']    { line-width: @rdz14_unclassified; }
    [type='residential']    { line-width: @rdz14_residential; }
    [type='tertiary_link']    { line-width: @rdz14_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz14_secondary_link; }
    [type='primary_link']    { line-width: @rdz14_primary_link; }
    [type='trunk_link']    { line-width: @rdz14_trunk_link; }
    [type='motorway_link']    { line-width: @rdz14_motorway_link; }
    [type='service']      { line-width: @rdz14_service; }
    [type='track']      { line-width: @rdz14_track; }
    [type='pedestrian']   { line-width: @rdz14_pedestrian; }
    [type='bridleway']   { line-width: @rdz14_bridleway; /*line-dasharray: 1,1; */}
    [type='footway']   { line-width: @rdz14_footway; }
    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-width: @rdz14_path;
    }
    [type='steps']        { line-width: @rdz14_steps;      line-dasharray: 0.5,0.5; }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz14_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz14_cycle*1.5;
      }
    }
  }
  [zoom>=15] {
    [type='motorway'], [type='trunk']     { line-width: @rdz15_motorway_trunk; }
    [type='primary']     { line-width: @rdz15_primary; }
    [type='secondary']     { line-width: @rdz15_secondary; }
    [type='tertiary']    { line-width: @rdz15_tertiary; }
    [type='living_street']    { line-width: @rdz15_living_street; }
    [type='road']    { line-width: @rdz15_road; }
    [type='unclassified']    { line-width: @rdz15_unclassified; }
    [type='residential']    { line-width: @rdz15_residential; }
    [type='tertiary_link']    { line-width: @rdz15_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz15_secondary_link; }
    [type='primary_link']    { line-width: @rdz15_primary_link; }
    [type='trunk_link']    { line-width: @rdz15_trunk_link; }
    [type='motorway_link']    { line-width: @rdz15_motorway_link; }
    [type='service']      { line-width: @rdz15_service; }
    [type='track']      { line-width: @rdz15_track; }
    [type='pedestrian']   { line-width: @rdz15_pedestrian; }
    [type='bridleway']   { line-width: @rdz15_bridleway; /*line-dasharray: 1,1;*/ }
    [type='footway']   { line-width: @rdz15_footway; }
    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-width: @rdz15_path;
    }
    [type='steps']        { line-width: @rdz15_steps;      line-dasharray: 0.5,0.5; }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz15_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz15_cycle*1.5;
      }
    }
  }
  [zoom>=16] {
    [type='motorway'], [type='trunk']     { line-width: @rdz16_motorway_trunk; }
    [type='primary']     { line-width: @rdz16_primary; }
    [type='secondary']     { line-width: @rdz16_secondary; }
    [type='tertiary']    { line-width: @rdz16_tertiary; }
    [type='living_street']    { line-width: @rdz16_living_street; }
    [type='road']    { line-width: @rdz16_road; }
    [type='unclassified']    { line-width: @rdz16_unclassified; }
    [type='residential']    { line-width: @rdz16_residential; }
    [type='tertiary_link']    { line-width: @rdz16_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz16_secondary_link; }
    [type='primary_link']    { line-width: @rdz16_primary_link; }
    [type='trunk_link']    { line-width: @rdz16_trunk_link; }
    [type='motorway_link']    { line-width: @rdz16_motorway_link; }
    [type='service']      { line-width: @rdz16_service; }
    [type='track']      { line-width: @rdz16_track; }
    [type='pedestrian']   { line-width: @rdz16_pedestrian; }
    [type='bridleway']   { line-width: @rdz16_bridleway; /*line-dasharray: 2,1;*/ }
    [type='footway']   { line-width: @rdz16_footway; }
    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-width: @rdz16_path;
    }
    [type='steps']        { line-width: @rdz16_steps;      line-dasharray: 1.5,0.75; }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz16_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz16_cycle*1.5;
      }
    }
  }
  [zoom>=17] {
    [type='motorway'], [type='trunk']     { line-width: @rdz17_motorway_trunk; }
    [type='primary']     { line-width: @rdz17_primary; }
    [type='secondary']     { line-width: @rdz17_secondary; }
    [type='tertiary']    { line-width: @rdz17_tertiary; }
    [type='living_street']    { line-width: @rdz17_living_street; }
    [type='road']    { line-width: @rdz17_road; }
    [type='unclassified']    { line-width: @rdz17_unclassified; }
    [type='residential']    { line-width: @rdz17_residential; }
    [type='tertiary_link']    { line-width: @rdz17_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz17_secondary_link; }
    [type='primary_link']    { line-width: @rdz17_primary_link; }
    [type='trunk_link']    { line-width: @rdz17_trunk_link; }
    [type='motorway_link']    { line-width: @rdz17_motorway_link; }
    [type='service']      { line-width: @rdz17_service; }
    [type='track']      { line-width: @rdz17_track; }
    [type='pedestrian']   { line-width: @rdz17_pedestrian; }
    [type='bridleway']   { line-width: @rdz17_bridleway;  /*line-dasharray: 2,2;*/ }
    [type='footway']   { line-width: @rdz17_footway; }
    [type='path'],
    [type='footway'][can_bicycle='yes'],
    [type='bridleway'][can_bicycle='yes'] {
      line-width: @rdz17_path;
    }
    [type='steps']        { line-width: @rdz17_steps;      line-dasharray: 2,1; }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz17_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz17_cycle*1.5;
      }
    }
  }
  [zoom>=18] {
    [type='motorway'], [type='trunk']     { line-width: @rdz18_motorway_trunk; }
    [type='primary']     { line-width: @rdz18_primary; }
    [type='secondary']     { line-width: @rdz18_secondary; }
    [type='tertiary']    { line-width: @rdz18_tertiary; }
    [type='living_street']    { line-width: @rdz18_living_street; }
    [type='road']    { line-width: @rdz18_road; }
    [type='unclassified']    { line-width: @rdz18_unclassified; }
    [type='residential']    { line-width: @rdz18_residential; }
    [type='tertiary_link']    { line-width: @rdz18_tertiary_link; }
    [type='secondary_link']    { line-width: @rdz18_secondary_link; }
    [type='primary_link']    { line-width: @rdz18_primary_link; }
    [type='trunk_link']    { line-width: @rdz18_trunk_link; }
    [type='motorway_link']    { line-width: @rdz18_motorway_link; }
    [type='service']      { line-width: @rdz18_service; }
    [type='track']      { line-width: @rdz18_track; }
    [type='pedestrian']   { line-width: @rdz18_pedestrian; }
    [type='bridleway']   { line-width: @rdz18_bridleway; /*line-dasharray: 3,3;*/ }
    [type='footway']   { line-width: @rdz18_footway; }
    [type='path'] {
      line-width: @rdz18_path;
    }
    [type='steps']        { line-width: @rdz18_steps;      line-dasharray: 2,1; }
    [type='cycleway'],
    [type='path'][can_bicycle='designated'],
    [type='footway'][can_bicycle='designated'] {
      line-width: @rdz18_cycle;
      [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz18_cycle*1.5;
      }
    }
  }
}

#roads_high::surface[zoom>=14],
#tunnel::surface[zoom>=14],
#bridge::surface[zoom>=14] {
  [type='primary'],
  [type='secondary'],
  [type='tertiary'],
  [type='living_street'],
  [type='road'],
  [type='unclassified'],
  [type='residential'],
  [type='tertiary_link'],
  [type='secondary_link'],
  [type='primary_link'],
  [type='service'],
  [type='track'],
  [type='pedestrian'],
  [type='bridleway'],
  [type='footway'],
  [type='path'],
  [type='cycleway'] {
    /* Don't draw something for good surface, ok for racing bikes (<=28mm tyres). */

    /* Surface ok for treking/gravel/cyclocross/city bike (28mm < tyres <= 40mm). */
    [surface_type='cyclocross'] {
      line-dasharray: 4,8;
      [zoom>=15] {
        line-dasharray: 6,12;
      }
      [zoom>=16] {
        line-dasharray: 8,16;
      }
      [zoom>=17] {
        line-dasharray: 12,24;
      }
      [zoom>=18] {
        line-dasharray: 24,48;
      }

      /* -- colors & styles -- */
      line-color: darken(@standard-fill, @surfaceDarker1); /* Darken since it's white. */
      [type='track'] {
        line-color: @track-light2;
      }
      [type='bridleway'] {
        line-color: lighten(@bridleway-fill, @surfaceLighter1);
      }
      [type='footway'] {
        line-color: lighten(@footway-fill, @surfaceLighter1);
      }
      [type='path'],
      [type='footway'][can_bicycle='yes'],
      [type='bridleway'][can_bicycle='yes'] {
        line-color: lighten(@path-fill,@surfaceLighter1);
      }
      [type='cycleway'] {
        line-color: lighten(@cycle-fill, @surfaceLighter1);
      }
      [type='path'][can_bicycle='designated'],
      [type='footway'][can_bicycle='designated'] {
        line-color: lighten(@mixed-cycle-fill, @surfaceLighter1);
        [segregated='yes'] {
          line-color: lighten(@cycle-fill, @surfaceLighter1);
        }
      }

      [can_bicycle='no'],
      [can_bicycle='private'] {
        line-color: lighten(@standard-nobicycle, @surfaceLighter1);
      }

      [zoom>=14] {
        [type='primary']     { line-width: @rdz14_primary; }
        [type='secondary']     { line-width: @rdz14_secondary; }
        [type='tertiary']    { line-width: @rdz14_tertiary; }
        [type='living_street']    { line-width: @rdz14_living_street; }
        [type='road']    { line-width: @rdz14_road; }
        [type='unclassified']    { line-width: @rdz14_unclassified; }
        [type='residential']    { line-width: @rdz14_residential; }
        [type='tertiary_link']    { line-width: @rdz14_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz14_secondary_link; }
        [type='primary_link']    { line-width: @rdz14_primary_link; }
        [type='service']      { line-width: @rdz14_service; }
        [type='track']      { line-width: @rdz14_track; }
        [type='pedestrian']   { line-width: @rdz14_pedestrian; }
        [type='bridleway']   { line-width: @rdz14_bridleway; }
        [type='footway']   { line-width: @rdz14_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz14_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz14_cycle;
          [oneway='no'][oneway_bicycle='no']
          { line-width: @rdz14_cycle*1.5; }
        }
      }
      [zoom>=15] {
        [type='primary']     { line-width: @rdz15_primary; }
        [type='secondary']     { line-width: @rdz15_secondary; }
        [type='tertiary']    { line-width: @rdz15_tertiary; }
        [type='living_street']    { line-width: @rdz15_living_street; }
        [type='road']    { line-width: @rdz15_road; }
        [type='unclassified']    { line-width: @rdz15_unclassified; }
        [type='residential']    { line-width: @rdz15_residential; }
        [type='tertiary_link']    { line-width: @rdz15_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz15_secondary_link; }
        [type='primary_link']    { line-width: @rdz15_primary_link; }
        [type='service']      { line-width: @rdz15_service; }
        [type='track']      { line-width: @rdz15_track; }
        [type='pedestrian']   { line-width: @rdz15_pedestrian; }
        [type='bridleway']   { line-width: @rdz15_bridleway; }
        [type='footway']   { line-width: @rdz15_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz15_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz15_cycle;
          [oneway='no'][oneway_bicycle='no'] {
              line-width: @rdz15_cycle*1.5;
          }
        }
      }
      [zoom>=16] {
        [type='primary']     { line-width: @rdz16_primary; }
        [type='secondary']     { line-width: @rdz16_secondary; }
        [type='tertiary']    { line-width: @rdz16_tertiary; }
        [type='living_street']    { line-width: @rdz16_living_street; }
        [type='road']    { line-width: @rdz16_road; }
        [type='unclassified']    { line-width: @rdz16_unclassified; }
        [type='residential']    { line-width: @rdz16_residential; }
        [type='tertiary_link']    { line-width: @rdz16_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz16_secondary_link; }
        [type='primary_link']    { line-width: @rdz16_primary_link; }
        [type='service']      { line-width: @rdz16_service; }
        [type='track']      { line-width: @rdz15_track; } //Special effect.
        [type='pedestrian']   { line-width: @rdz16_pedestrian; }
        [type='bridleway']   { line-width: @rdz16_bridleway; }
        [type='footway']   { line-width: @rdz16_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz16_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz16_cycle;
          [oneway='no'][oneway_bicycle='no'] {
              line-width: @rdz16_cycle*1.5;
          }
        }
      }
      [zoom>=17] {
        [type='primary']     { line-width: @rdz17_primary; }
        [type='secondary']     { line-width: @rdz17_secondary; }
        [type='tertiary']    { line-width: @rdz17_tertiary; }
        [type='living_street']    { line-width: @rdz17_living_street; }
        [type='road']    { line-width: @rdz17_road; }
        [type='unclassified']    { line-width: @rdz17_unclassified; }
        [type='residential']    { line-width: @rdz17_residential; }
        [type='tertiary_link']    { line-width: @rdz17_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz17_secondary_link; }
        [type='primary_link']    { line-width: @rdz17_primary_link; }
        [type='service']      { line-width: @rdz17_service; }
        [type='track']      { line-width: @rdz16_track; } //Special effect.
        [type='pedestrian']   { line-width: @rdz17_pedestrian; }
        [type='bridleway']   { line-width: @rdz17_bridleway; }
        [type='footway']   { line-width: @rdz17_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz17_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz17_cycle;
          [oneway='no'][oneway_bicycle='no'] {
              line-width: @rdz17_cycle*1.5;
          }
        }
      }
      [zoom>=18] {
        [type='primary']     { line-width: @rdz18_primary; }
        [type='secondary']     { line-width: @rdz18_secondary; }
        [type='tertiary']    { line-width: @rdz18_tertiary; }
        [type='living_street']    { line-width: @rdz18_living_street; }
        [type='road']    { line-width: @rdz18_road; }
        [type='unclassified']    { line-width: @rdz18_unclassified; }
        [type='residential']    { line-width: @rdz18_residential; }
        [type='tertiary_link']    { line-width: @rdz18_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz18_secondary_link; }
        [type='primary_link']    { line-width: @rdz18_primary_link; }
        [type='service']      { line-width: @rdz18_service; }
        [type='track']      { line-width: @rdz17_track; }  //Special effect.
        [type='pedestrian']   { line-width: @rdz18_pedestrian; }
        [type='bridleway']   { line-width: @rdz18_bridleway; }
        [type='footway']   { line-width: @rdz18_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz18_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz18_cycle;
          [oneway='no'][oneway_bicycle='no'] {
              line-width: @rdz18_cycle*1.5;
          }
        }
      }
    }

    /* Bad surface ok for mountain bike (>40mm tyres). */
    [surface_type='mtb'] {
      line-dasharray: 10,5;
      [zoom>=15] {
        line-dasharray: 14,7;
      }
      [zoom>=16] {
        line-dasharray: 20,10;
      }
      [zoom>=17] {
        line-dasharray: 32,16;
      }
      [zoom>=18] {
        line-dasharray: 64,32;
      }

      /* -- colors & styles -- */
      line-color: darken(@standard-fill, @surfaceDarker2); /* Darken since its white. */
      [type='track'] {
        line-color: @track-light2;
      }
      [type='cycleway'] {
        line-color: lighten(@cycle-fill, @surfaceLighter2);
      }
      [type='bridleway'] {
        line-color: lighten(@bridleway-fill, @surfaceLighter2);
      }
      [type='footway'] {
        line-color: lighten(@footway-fill, @surfaceLighter2);
      }
      [type='path'],
      [type='footway'][can_bicycle='yes'],
      [type='bridleway'][can_bicycle='yes'] {
        line-color: lighten(@path-fill, @surfaceLighter2);
      }
      [can_bicycle='no'],
      [can_bicycle='private'] {
        line-color: lighten(@standard-nobicycle, @surfaceLighter2);
      }
      [type='path'][can_bicycle='designated'],
      [type='footway'][can_bicycle='designated'] {
        line-color: lighten(@mixed-cycle-fill, @surfaceLighter2);
        [segregated='yes'] {
          line-color: lighten(@cycle-fill, @surfaceLighter2);
        }
      }

      [zoom>=14] {
        [type='primary']     { line-width: @rdz14_primary; }
        [type='secondary']     { line-width: @rdz14_secondary; }
        [type='tertiary']    { line-width: @rdz14_tertiary; }
        [type='living_street']    { line-width: @rdz14_living_street; }
        [type='road']    { line-width: @rdz14_road; }
        [type='unclassified']    { line-width: @rdz14_unclassified; }
        [type='residential']    { line-width: @rdz14_residential; }
        [type='tertiary_link']    { line-width: @rdz14_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz14_secondary_link; }
        [type='primary_link']    { line-width: @rdz14_primary_link; }
        [type='service']      { line-width: @rdz14_service; }
        [type='track']      { line-width: @rdz14_track; }
        [type='pedestrian']   { line-width: @rdz14_pedestrian; }
        [type='bridleway']   { line-width: @rdz14_bridleway; }
        [type='footway']   { line-width: @rdz14_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz14_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz14_cycle;
          [oneway='no'][oneway_bicycle='no']
          { line-width: @rdz14_cycle*1.5; }
        }
      }
      [zoom>=15] {
        [type='primary']     { line-width: @rdz15_primary; }
        [type='secondary']     { line-width: @rdz15_secondary; }
        [type='tertiary']    { line-width: @rdz15_tertiary; }
        [type='living_street']    { line-width: @rdz15_living_street; }
        [type='road']    { line-width: @rdz15_road; }
        [type='unclassified']    { line-width: @rdz15_unclassified; }
        [type='residential']    { line-width: @rdz15_residential; }
        [type='tertiary_link']    { line-width: @rdz15_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz15_secondary_link; }
        [type='primary_link']    { line-width: @rdz15_primary_link; }
        [type='service']      { line-width: @rdz15_service; }
        [type='track']      { line-width: @rdz15_track; }
        [type='pedestrian']   { line-width: @rdz15_pedestrian; }
        [type='bridleway']   { line-width: @rdz15_bridleway; }
        [type='footway']   { line-width: @rdz15_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz15_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz15_cycle;
          [oneway='no'][oneway_bicycle='no']
          { line-width: @rdz15_cycle*1.5; }
        }
      }
      [zoom>=16] {
        [type='primary']     { line-width: @rdz16_primary; }
        [type='secondary']     { line-width: @rdz16_secondary; }
        [type='tertiary']    { line-width: @rdz16_tertiary; }
        [type='living_street']    { line-width: @rdz16_living_street; }
        [type='road']    { line-width: @rdz16_road; }
        [type='unclassified']    { line-width: @rdz16_unclassified; }
        [type='residential']    { line-width: @rdz16_residential; }
        [type='tertiary_link']    { line-width: @rdz16_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz16_secondary_link; }
        [type='primary_link']    { line-width: @rdz16_primary_link; }
        [type='service']      { line-width: @rdz16_service; }
        [type='track']      { line-width: @rdz15_track; } //Special effect.
        [type='pedestrian']   { line-width: @rdz16_pedestrian; }
        [type='bridleway']   { line-width: @rdz16_bridleway; }
        [type='footway']   { line-width: @rdz16_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz16_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz16_cycle;
          [oneway='no'][oneway_bicycle='no']
          { line-width: @rdz16_cycle*1.5; }
        }
      }
      [zoom>=17] {
        [type='primary']     { line-width: @rdz17_primary; }
        [type='secondary']     { line-width: @rdz17_secondary; }
        [type='tertiary']    { line-width: @rdz17_tertiary; }
        [type='living_street']    { line-width: @rdz17_living_street; }
        [type='road']    { line-width: @rdz17_road; }
        [type='unclassified']    { line-width: @rdz17_unclassified; }
        [type='residential']    { line-width: @rdz17_residential; }
        [type='tertiary_link']    { line-width: @rdz17_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz17_secondary_link; }
        [type='primary_link']    { line-width: @rdz17_primary_link; }
        [type='service']      { line-width: @rdz17_service; }
        [type='track']      { line-width: @rdz16_track; } //Special effect.
        [type='pedestrian']   { line-width: @rdz17_pedestrian; }
        [type='bridleway']   { line-width: @rdz17_bridleway; }
        [type='footway']   { line-width: @rdz17_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz17_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz17_cycle;
          [oneway='no'][oneway_bicycle='no']
          { line-width: @rdz17_cycle*1.5; }
        }
      }
      [zoom>=18] {
        [type='primary']     { line-width: @rdz18_primary; }
        [type='secondary']     { line-width: @rdz18_secondary; }
        [type='tertiary']    { line-width: @rdz18_tertiary; }
        [type='living_street']    { line-width: @rdz18_living_street; }
        [type='road']    { line-width: @rdz18_road; }
        [type='unclassified']    { line-width: @rdz18_unclassified; }
        [type='residential']    { line-width: @rdz18_residential; }
        [type='tertiary_link']    { line-width: @rdz18_tertiary_link; }
        [type='secondary_link']    { line-width: @rdz18_secondary_link; }
        [type='primary_link']    { line-width: @rdz18_primary_link; }
        [type='service']      { line-width: @rdz18_service; }
        [type='track']      { line-width: @rdz17_track; } //Special effect.
        [type='pedestrian']   { line-width: @rdz18_pedestrian; }
        [type='bridleway']   { line-width: @rdz18_bridleway; }
        [type='footway']   { line-width: @rdz18_footway; }
        [type='path'],
        [type='footway'][can_bicycle='yes'],
        [type='bridleway'][can_bicycle='yes'] {
          line-width: @rdz18_path;
        }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'],
        [type='footway'][can_bicycle='designated'] {
          line-width: @rdz18_cycle;
          [oneway='no'][oneway_bicycle='no']
          { line-width: @rdz18_cycle*1.5; }
        }
      }
    }
  }
}


#roads_high::rail_line[zoom>=11],
#bridge::rail_line[zoom>=11] {
  [type='railway'] {
    line-color: @rail-line;
    /* -- widths -- */
    [zoom>=11] {
      line-width: @rdz11_railway;
    }
    [zoom>=12] {
      line-width: @rdz12_railway;
    }
    [zoom>=13] {
      line-width: @rdz13_railway;
    }
    [zoom>=14] {
      line-width: @rdz14_railway;
    }
    [zoom>=15] {
      line-width: @rdz15_railway;
    }
    [zoom>=16] {
      line-width: @rdz16_railway;
    }
    [zoom>=17] {
      line-width: @rdz17_railway;
    }
    [zoom>=18] {
      line-width: @rdz18_railway;
    }
  }
}

#roads_high::rail_line2[zoom>=11],
#bridge::rail_line2[zoom>=11] {
  [type='railway'] {
    line-width: 0;
    [tunnel=0] {
      line-color: @rail-line;
      line-dasharray: 1,4;
      [type='subway'] { line-opacity: 0.67; }
      [zoom>=14] { line-dasharray: 1,8; }

      [zoom>=11] {
        line-width: @rdz11_railway*3;
      }
      [zoom>=12] {
        line-width: @rdz12_railway*3;
      }
      [zoom>=13] {
        line-width: @rdz13_railway*3;
      }
      [zoom>=14] {
        line-width: @rdz14_railway*3;
      }
      [zoom>=15] {
        line-width: @rdz15_railway*3;
      }
      [zoom>=16] {
        line-width: @rdz16_railway*3;
      }
      [zoom>=17] {
        line-width: @rdz17_railway*3;
      }
      [zoom>=18] {
        line-width: @rdz18_railway*3;
      }
    }
  }
}


/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
  marker-fill: @standard-fill;
  marker-line-color: @standard-case;
  marker-line-width: 2;
  marker-allow-overlap: true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill: @standard-fill;
  marker-line-width: 0;
  marker-line-opacity: 0;
  marker-allow-overlap: true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom>=14]  { marker-width: @rdz14_turning_circle_marker; }
  [zoom>=15]  { marker-width: @rdz15_turning_circle_marker; }
  [zoom>=16]  { marker-width: @rdz16_turning_circle_marker; }
  [zoom>=17]  { marker-width: @rdz17_turning_circle_marker; }
  [zoom>=18] { marker-width: @rdz18_turning_circle_marker; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
  line-color: @aeroway;
  line-cap: butt;
  line-join: miter;
  [type='runway'] {
    [zoom>=10] { line-width: 1; }
    [zoom>=11] { line-width: 2; }
    [zoom>=12] { line-width: 3; }
    [zoom>=13] { line-width: 5; }
    [zoom>=14] { line-width: 7; }
    [zoom>=15] { line-width: 11; }
    [zoom>=16] { line-width: 15; }
    [zoom>=17] { line-width: 19; }
    [zoom>=18] { line-width: 23; }
  }
  [type='taxiway'] {
    [zoom>=10] { line-width: 0.2; }
    [zoom>=11] { line-width: 0.2; }
    [zoom>=12] { line-width: 0.2; }
    [zoom>=13] { line-width: 1; }
    [zoom>=14] { line-width: 1.5; }
    [zoom>=15] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
    [zoom>=17] { line-width: 4; }
    [zoom>=18] { line-width: 5; }
  }
}

/* ================================================================== */
/* BICYCLE ROUTES
/* ================================================================== */

#bicycle_routes_gen0,
#bicycle_routes_gen1,
#bicycle_routes_gen2 {
  opacity: 0.75;
}

#bicycle_routes_bicycle_gen3 {
  opacity: 0.25;
}

#bicycle_routes_mtb_gen3 {
  opacity: 0.5;
}

#bicycle_routes_gen0[zoom >= 2],
#bicycle_routes_gen1[zoom >= 5],
#bicycle_routes_gen2[zoom >= 8],
#bicycle_routes_bicycle_gen3[zoom >= 11],
#bicycle_routes_mtb_gen3[zoom >= 11] {
  [type='icn'] {
    line-color: @icn-overlay;
  }
  [type='ncn'] {
    line-color: @ncn-overlay;
  }
  [type='rcn'] {
    line-color: @rcn-overlay;
  }
  [type='lcn'] {
    line-color: @lcn-overlay;
  }
  [route='mtb'] {
    line-color: @mtb-overlay;
  }

  [state='proposed'] {
    line-dasharray: 6,6;
  }

  line-width: 1;
  [zoom >= 9] {
    line-width: 2;
  }
  [zoom >= 10] {
    line-width: 3;
  }
  [zoom >= 12] {
    line-width: 4;
  }
  [zoom >= 14] {
    line-width: 5;
  }
  [zoom >= 15] {
    line-width: 6;
  }
  [zoom >= 16] {
    line-width: 7;
  }
  [zoom >= 17] {
    line-width: 10;
  }
  [zoom >= 18] {
    line-width: 14;
  }
}

/******************************************************************* */
