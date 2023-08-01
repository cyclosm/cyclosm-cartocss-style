// ==================================================================
//                    ROAD & RAIL LINES
// ==================================================================

// At lower zoomlevels, just show major automobile routes: motorways
// and trunks.


#roads_low[zoom>=7][zoom<=8][type='railway']::rail_perpendicular,
#roads_med[zoom>=9][zoom<=10][type='railway']::rail_perpendicular {
    /* background: to avoid weird pattern when many tracks are overlapping */
    background/line-color: @land;
    background/line-width: 3;

    line-color: @rail-line;
    line-cap: butt;
    line-dasharray: 0,2,1,2; /* start with space to avoid dense pattern on very short ways */
    line-width: 2;

    [zoom >= 9] { line-width: 3; }
}

#roads_low[zoom>=5][zoom<=8][type='railway'] {
  line-width: 0.3;
  line-color: @rail-line;

  [zoom >= 8] { line-width: 0.6; }
}

// At mid-level scales start to show primary and secondary routes
// as well.
#roads_med[zoom >= 9][zoom<=10] {
  line-color: @motorway-trunk-fill;

  [type='motorway'][can_bicycle='yes'] {
    line-color: @motorway-trunk-cycle-fill;
  }
  [type='primary'] {
    line-color: @primary-case;
  }
  [type='secondary'] {
    line-color: @secondary-case;
  }

  [type='railway'] {
    line-color: @rail-line;
  }

  line-width: 1;
  [type='secondary']
  {
    line-width: 0.6;

    [zoom >= 10] {
      line-width: 1;
    }
  }
}

// At higher levels the roads become more complex. We're now showing
//more than just automobile and railway routes - footways, and cycleways
//come in as well.

// ----------------------------------------------------------
// ---------------- Variables -------------------------------
// ----------------------------------------------------------
//
// * Road width variables that are used in road & bridge styles.
// *
// * Roads are drawn in two steps. First, a line if the width of the road + the
// * two borders is drawn and then a line of the width of the road is drawn on
// * top, to make a road with borders. Here, the width of the ways is the width
// * of the fill of the road and the border width is the width of a single
// * border, on one side (first line is drawn with a width of way with + 2 *
// * border_width).


// -- Zoom 11 --
// Width of ways
@rdz11_motorway_trunk: 1.2;
@rdz11_primary: 0.8;
@rdz11_secondary: 0.8;
@rdz11_motorway_link: 0;
@rdz11_primary_link: 0;
@rdz11_secondary_link: 0;
@rdz11_tertiary: 0;
@rdz11_tertiary_link: 0;
@rdz11_unclassified: 0;
@rdz11_residential: 0;
@rdz11_road: 0;
@rdz11_living_street: 0;
@rdz11_service: 0;
@rdz11_pedestrian: 0;
@rdz11_track: 0.15;
@rdz11_path: 0.15;
@rdz11_cycle: 0.4;
@rdz11_railway: 0.5;
// Border width (one side of the road only)
@rdz11_motorway_trunk_outline: 1;
@rdz11_primary_outline: 0.8;
@rdz11_secondary_outline: 0.8;
@rdz11_motorway_link_outline: 0.15;
@rdz11_primary_link_outline: 0.15;
@rdz11_secondary_link_outline: 0.15;
@rdz11_tertiary_outline: 0.4;
@rdz11_tertiary_link_outline: 0.15;
@rdz11_unclassified_outline: 0.35;
@rdz11_residential_outline: 0.2;
@rdz11_living_street_outline: 0.15;
@rdz11_service_outline: 0.15;
@rdz11_pedestrian_outline: 0.15;

// -- Zoom 12 --
@rdz12_motorway_trunk: 2;
@rdz12_primary: 1.2;
@rdz12_secondary: 1.2;
@rdz12_motorway_link: 1;
@rdz12_primary_link: 0.6;
@rdz12_secondary_link: 0.6;
@rdz12_tertiary: 1;
@rdz12_tertiary_link: 0.5;
@rdz12_unclassified: 1;
@rdz12_residential: 0.5;
@rdz12_living_street: 0.5;
@rdz12_service: 0;
@rdz12_track: 0.5;
@rdz12_pedestrian: 0.5;
@rdz12_path: 0.5;
@rdz12_cycle: 0.7;
@rdz12_railway: 0.5;
// Border width (one side of the road only)
@rdz12_motorway_trunk_outline: 1;
@rdz12_primary_outline: 1;
@rdz12_secondary_outline: 1;
@rdz12_motorway_link_outline: 0.25;
@rdz12_primary_link_outline: 0.25;
@rdz12_secondary_link_outline: 0.25;
@rdz12_tertiary_outline: 1;
@rdz12_tertiary_link_outline: 0.25;
@rdz12_unclassified_outline: 1;
@rdz12_residential_outline: 0.25;
@rdz12_living_street_outline: 0.25;
@rdz12_service_outline: 0.25;
@rdz12_pedestrian_outline: 0.25;

// -- Zoom 13 --
@rdz13_motorway_trunk: 3;
@rdz13_primary: 2;
@rdz13_secondary: 2;
@rdz13_motorway_link: 1.5;
@rdz13_primary_link: 1;
@rdz13_secondary_link: 1;
@rdz13_tertiary: 2;
@rdz13_tertiary_link: 0.6;
@rdz13_unclassified: 1.5;
@rdz13_residential: 1;
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
// Border width (one side of the road only)
@rdz13_motorway_trunk_outline: 1;
@rdz13_primary_outline: 1;
@rdz13_secondary_outline: 1;
@rdz13_motorway_link_outline: 0.6;
@rdz13_primary_link_outline: 0.6;
@rdz13_secondary_link_outline: 0.6;
@rdz13_tertiary_outline: 1;
@rdz13_tertiary_link_outline: 0.6;
@rdz13_unclassified_outline: 0.8;
@rdz13_residential_outline: 0.6;
@rdz13_living_street_outline: 0.6;
@rdz13_service_outline: 0.3;
@rdz13_pedestrian_outline: 0.6;
@rdz13_steps_outline: 0;

// -- Zoom 14 --
@rdz14_motorway_trunk: 4;
@rdz14_primary: 2.8;
@rdz14_secondary: 2.8;
@rdz14_motorway_link: 2;
@rdz14_primary_link: 1.4;
@rdz14_secondary_link: 1.4;
@rdz14_tertiary: 2;
@rdz14_tertiary_link: 1;
@rdz14_unclassified: 2;
@rdz14_residential: 1;
@rdz14_living_street: 1;
@rdz14_service: 1;
@rdz14_track: 1.5;
@rdz14_pedestrian: 1;
@rdz14_bridleway: 0.25;
@rdz14_path: 1;
@rdz14_footway: 0.25;
@rdz14_steps: 0.5;
@rdz14_cycle: 2;
@rdz14_railway: 0.6;
@rdz14_turning_circle_marker: 1.1;
// Border width
// Border width (one side of the road only)
@rdz14_motorway_trunk_outline: 1;
@rdz14_primary_outline: 1;
@rdz14_secondary_outline: 1;
@rdz14_motorway_link_outline: 1;
@rdz14_primary_link_outline: 1;
@rdz14_secondary_link_outline: 1;
@rdz14_tertiary_outline: 1;
@rdz14_tertiary_link_outline: 1;
@rdz14_unclassified_outline: 1;
@rdz14_residential_outline: 1;
@rdz14_living_street_outline: 1;
@rdz14_service_outline: 0.5;
@rdz14_pedestrian_outline: 1;
@rdz14_steps_outline: 0;

// -- Zoom 15 --
@rdz15_motorway_trunk: 6;
@rdz15_primary: 4;
@rdz15_secondary: 4;
@rdz15_motorway_link: 3;
@rdz15_primary_link: 2;
@rdz15_secondary_link: 2;
@rdz15_tertiary: 3;
@rdz15_tertiary_link: 1.5;
@rdz15_unclassified: 3;
@rdz15_residential: 2;
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
// Border width (one side of the road only)
@rdz15_motorway_trunk_outline: 1.25;
@rdz15_primary_outline: 1;
@rdz15_secondary_outline: 1;
@rdz15_motorway_link_outline: 1;
@rdz15_primary_link_outline: 1;
@rdz15_secondary_link_outline: 1;
@rdz15_tertiary_outline: 1;
@rdz15_tertiary_link_outline: 1;
@rdz15_unclassified_outline: 1;
@rdz15_residential_outline: 1;
@rdz15_living_street_outline: 1;
@rdz15_service_outline: 1;
@rdz15_pedestrian_outline: 1;
@rdz15_steps_outline: 1;

// -- Zoom 16 --
@rdz16_motorway_trunk: 10;
@rdz16_primary: 8;
@rdz16_secondary: 8;
@rdz16_motorway_link: 5;
@rdz16_primary_link: 4;
@rdz16_secondary_link: 4;
@rdz16_tertiary: 6;
@rdz16_tertiary_link: 4;
@rdz16_unclassified: 6;
@rdz16_residential: 4;
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
// Border width (one side of the road only)
@rdz16_motorway_trunk_outline: 1.25;
@rdz16_primary_outline: 1.25;
@rdz16_secondary_outline: 1.25;
@rdz16_motorway_link_outline: 1;
@rdz16_primary_link_outline: 1;
@rdz16_secondary_link_outline: 1;
@rdz16_tertiary_outline: 1;
@rdz16_tertiary_link_outline: 1;
@rdz16_unclassified_outline: 1;
@rdz16_residential_outline: 1;
@rdz16_living_street_outline: 1.5;
@rdz16_service_outline: 1;
@rdz16_pedestrian_outline: 2;
@rdz16_steps_outline: 1;

// -- Zoom 17 --
@rdz17_motorway_trunk: 16;
@rdz17_primary: 14;
@rdz17_secondary: 14;
@rdz17_motorway_link: 8;
@rdz17_primary_link: 8;
@rdz17_secondary_link: 8;
@rdz17_tertiary: 10;
@rdz17_tertiary_link: 8;
@rdz17_unclassified: 10;
@rdz17_residential: 8;
@rdz17_living_street: 7.5;
@rdz17_service: 6;
@rdz17_track: 4;
@rdz17_pedestrian: 3;
@rdz17_bridleway: 1.5;
@rdz17_path: 2;
@rdz17_footway: 1.5;
@rdz17_steps: 3;
@rdz17_cycle: 3;
@rdz17_railway: 1;
@rdz17_turning_circle_marker: 15;
// Border width (one side of the road only)
@rdz17_motorway_trunk_outline: 1.5;
@rdz17_primary_outline: 1.25;
@rdz17_secondary_outline: 1.25;
@rdz17_motorway_link_outline: 1;
@rdz17_primary_link_outline: 1;
@rdz17_secondary_link_outline: 1;
@rdz17_tertiary_outline: 1;
@rdz17_tertiary_link_outline: 1;
@rdz17_unclassified_outline: 1;
@rdz17_residential_outline: 1;
@rdz17_living_street_outline: 1.75;
@rdz17_service_outline: 1;
@rdz17_pedestrian_outline: 3;
@rdz17_steps_outline: 1;
@rdz17_line_bridge_outline: 1;  // cycleway, footway, bridleway, path on bridges

// -- Zoom 18 --
@rdz18_motorway_trunk: 23;
@rdz18_primary: 20;
@rdz18_secondary: 20;
@rdz18_motorway_link: 14;
@rdz18_primary_link: 14;
@rdz18_secondary_link: 14;
@rdz18_tertiary: 16;
@rdz18_tertiary_link: 14;
@rdz18_unclassified: 16;
@rdz18_residential: 14;
@rdz18_living_street: 11;
@rdz18_service: 10;
@rdz18_track: 7;
@rdz18_pedestrian: 4;
@rdz18_bridleway: 2;
@rdz18_path: 2.5;
@rdz18_footway: 2;
@rdz18_steps: 3.5;
@rdz18_cycle: 4;
@rdz18_railway: 1;
@rdz18_turning_circle_marker: 21;
// Border width (one side of the road only)
@rdz18_motorway_trunk_outline: 2;
@rdz18_primary_outline: 2;
@rdz18_secondary_outline: 2;
@rdz18_motorway_link_outline: 1.75;
@rdz18_primary_link_outline: 1.75;
@rdz18_secondary_link_outline: 1.75;
@rdz18_tertiary_outline: 1.75;
@rdz18_tertiary_link_outline: 1.75;
@rdz18_unclassified_outline: 1.75;
@rdz18_residential_outline: 1.75;
@rdz18_living_street_outline: 3;
@rdz18_service_outline: 1.75;
@rdz18_pedestrian_outline: 4;
@rdz18_steps_outline: 1;
@rdz18_line_bridge_outline: 1.5;  // cycleway, footway, bridleway, path on bridges

// ---- Rail background with hatches -------------------------

#roads_high[zoom>=11],
#bridge[zoom>=11] {
    [type='railway']::rail_perpendicular {
      [service!='minor'],
      [service='minor'][zoom>=13]
      {
        line-cap: butt;
        line-color: @rail-line;
        [service='minor'] {
          line-color: lighten(@rail-line, 25%);
        }

        /* hatches: start with space to avoid dense pattern on very short ways */
        line-dasharray: 0,2,1,2;
        [zoom>=14] { line-dasharray: 0,4,1,4; }

        line-width: 3;
        [zoom>=19] { line-width: 6; }
      }
    }
}

// ---- Casing -----------------------------------------------

// Line to draw both borders (left and right)
#roads_high::outline[zoom>=11],
#tunnel::outline[zoom>=11],
#bridge::outline[zoom>=11] {
  [type='motorway'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @motorway-trunk-case;
    line-width: @rdz11_motorway_trunk + (2 * @rdz11_motorway_trunk_outline);
    [zoom>=12] { line-width: @rdz12_motorway_trunk + (2 * @rdz12_motorway_trunk_outline); }
    [zoom>=13] { line-width: @rdz13_motorway_trunk + (2 * @rdz13_motorway_trunk_outline); }
    [zoom>=14] {
      line-width: @rdz14_motorway_trunk + (2 * @rdz14_motorway_trunk_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_motorway_trunk + (2 * @rdz15_motorway_trunk_outline); }
    [zoom>=16] { line-width: @rdz16_motorway_trunk + (2 * @rdz16_motorway_trunk_outline); }
    [zoom>=17] { line-width: @rdz17_motorway_trunk + (2 * @rdz17_motorway_trunk_outline); }
    [zoom>=18] { line-width: @rdz18_motorway_trunk + (2 * @rdz18_motorway_trunk_outline); }
  }
  [type='motorway_link'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @motorway-trunk-case;
    line-width: @rdz11_motorway_link + (2 * @rdz11_motorway_link_outline);
    [zoom>=12] { line-width: @rdz12_motorway_link + (2 * @rdz12_motorway_link_outline); }
    [zoom>=13] { line-width: @rdz13_motorway_link + (2 * @rdz13_motorway_link_outline); }
    [zoom>=14] {
      line-width: @rdz14_motorway_link + (2 * @rdz14_motorway_link_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_motorway_link + (2 * @rdz15_motorway_link_outline); }
    [zoom>=16] { line-width: @rdz16_motorway_link + (2 * @rdz16_motorway_link_outline); }
    [zoom>=17] { line-width: @rdz17_motorway_link + (2 * @rdz17_motorway_link_outline); }
    [zoom>=18] { line-width: @rdz18_motorway_link + (2 * @rdz18_motorway_link_outline); }
  }
  [type='primary'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @primary-case;
    line-width: @rdz11_primary + (2 * @rdz11_primary_outline);
    [zoom>=12] { line-width: @rdz12_primary + (2 * @rdz12_primary_outline); }
    [zoom>=13] { line-width: @rdz13_primary + (2 * @rdz13_primary_outline); }
    [zoom>=14] {
      line-width: @rdz14_primary + (2 * @rdz14_primary_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_primary + (2 * @rdz15_primary_outline); }
    [zoom>=16] { line-width: @rdz16_primary + (2 * @rdz16_primary_outline); }
    [zoom>=17] { line-width: @rdz17_primary + (2 * @rdz17_primary_outline); }
    [zoom>=18] { line-width: @rdz18_primary + (2 * @rdz18_primary_outline); }
  }
  [type='primary_link'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @primary-case;
    line-width: @rdz11_primary_link + (2 * @rdz11_primary_link_outline);
    [zoom>=12] { line-width: @rdz12_primary_link + (2 * @rdz12_primary_link_outline); }
    [zoom>=13] { line-width: @rdz13_primary_link + (2 * @rdz13_primary_link_outline); }
    [zoom>=14] {
      line-width: @rdz14_primary_link + (2 * @rdz14_primary_link_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_primary_link + (2 * @rdz15_primary_link_outline); }
    [zoom>=16] { line-width: @rdz16_primary_link + (2 * @rdz16_primary_link_outline); }
    [zoom>=17] { line-width: @rdz17_primary_link + (2 * @rdz17_primary_link_outline); }
    [zoom>=18] { line-width: @rdz18_primary_link + (2 * @rdz18_primary_link_outline); }
  }
  [type='secondary'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @secondary-case;
    line-width: @rdz11_secondary + (2 * @rdz11_secondary_outline);
    [zoom>=12] { line-width: @rdz12_secondary + (2 * @rdz12_secondary_outline); }
    [zoom>=13] { line-width: @rdz13_secondary + (2 * @rdz13_secondary_outline); }
    [zoom>=14] {
      line-width: @rdz14_secondary + (2 * @rdz14_secondary_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_secondary + (2 * @rdz15_secondary_outline); }
    [zoom>=16] { line-width: @rdz16_secondary + (2 * @rdz16_secondary_outline); }
    [zoom>=17] { line-width: @rdz17_secondary + (2 * @rdz17_secondary_outline); }
    [zoom>=18] { line-width: @rdz18_secondary + (2 * @rdz18_secondary_outline); }
  }
  [type='secondary_link'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @secondary-case;
    line-width: @rdz11_secondary_link + (2 * @rdz11_secondary_link_outline);
    [zoom>=12] { line-width: @rdz12_secondary_link + (2 * @rdz12_secondary_link_outline); }
    [zoom>=13] { line-width: @rdz13_secondary_link + (2 * @rdz13_secondary_link_outline); }
    [zoom>=14] {
      line-width: @rdz14_secondary_link + (2 * @rdz14_secondary_link_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_secondary_link + (2 * @rdz15_secondary_link_outline); }
    [zoom>=16] { line-width: @rdz16_secondary_link + (2 * @rdz16_secondary_link_outline); }
    [zoom>=17] { line-width: @rdz17_secondary_link + (2 * @rdz17_secondary_link_outline); }
    [zoom>=18] { line-width: @rdz18_secondary_link + (2 * @rdz18_secondary_link_outline); }
  }
  [type='tertiary'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @tertiary-case;
    line-width: @rdz11_tertiary + (2 * @rdz11_tertiary_outline);
    [zoom>=12] { line-width: @rdz12_tertiary + (2 * @rdz12_tertiary_outline); }
    [zoom>=13] { line-width: @rdz13_tertiary + (2 * @rdz13_tertiary_outline); }
    [zoom>=14] {
      line-width: @rdz14_tertiary + (2 * @rdz14_tertiary_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_tertiary + (2 * @rdz15_tertiary_outline); }
    [zoom>=16] { line-width: @rdz16_tertiary + (2 * @rdz16_tertiary_outline); }
    [zoom>=17] { line-width: @rdz17_tertiary + (2 * @rdz17_tertiary_outline); }
    [zoom>=18] { line-width: @rdz18_tertiary + (2 * @rdz18_tertiary_outline); }
  }
  [type='tertiary_link'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @tertiary-case;
    line-width: @rdz11_tertiary_link + (2 * @rdz11_tertiary_link_outline);
    [zoom>=12] { line-width: @rdz12_tertiary_link + (2 * @rdz12_tertiary_link_outline); }
    [zoom>=13] { line-width: @rdz13_tertiary_link + (2 * @rdz13_tertiary_link_outline); }
    [zoom>=14] {
      line-width: @rdz14_tertiary_link + (2 * @rdz14_tertiary_link_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_tertiary_link + (2 * @rdz15_tertiary_link_outline); }
    [zoom>=16] { line-width: @rdz16_tertiary_link + (2 * @rdz16_tertiary_link_outline); }
    [zoom>=17] { line-width: @rdz17_tertiary_link + (2 * @rdz17_tertiary_link_outline); }
    [zoom>=18] { line-width: @rdz18_tertiary_link + (2 * @rdz18_tertiary_link_outline); }
  }
  [type='unclassified'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @standard-case;
    line-width: @rdz11_unclassified + (2 * @rdz11_unclassified_outline);
    [zoom>=12] { line-width: @rdz12_unclassified + (2 * @rdz12_unclassified_outline); }
    [zoom>=13] { line-width: @rdz13_unclassified + (2 * @rdz13_unclassified_outline); }
    [zoom>=14] {
      line-width: @rdz14_unclassified + (2 * @rdz14_unclassified_outline);
      #bridge::outline {
        line-color: @bridge_case;
      }
    }
    [zoom>=15] { line-width: @rdz15_unclassified + (2 * @rdz15_unclassified_outline); }
    [zoom>=16] { line-width: @rdz16_unclassified + (2 * @rdz16_unclassified_outline); }
    [zoom>=17] { line-width: @rdz17_unclassified + (2 * @rdz17_unclassified_outline); }
    [zoom>=18] { line-width: @rdz18_unclassified + (2 * @rdz18_unclassified_outline); }
  }
  [type='residential'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @standard-case;
    line-width: @rdz11_residential + (2 * @rdz11_residential_outline);
    [zoom>=12] { line-width: @rdz12_residential + (2 * @rdz12_residential_outline); }
    [zoom>=13] { line-width: @rdz13_residential + (2 * @rdz13_residential_outline); }
    [zoom>=14] { line-width: @rdz14_residential + (2 * @rdz14_residential_outline); }
    [zoom>=15] { line-width: @rdz15_residential + (2 * @rdz15_residential_outline); }
    [zoom>=16] { line-width: @rdz16_residential + (2 * @rdz16_residential_outline); }
    [zoom>=17] { line-width: @rdz17_residential + (2 * @rdz17_residential_outline); }
    [zoom>=18] { line-width: @rdz18_residential + (2 * @rdz18_residential_outline); }
  }
  [type='living_street'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @pedestrian-case;
    line-width: @rdz11_living_street + (2 * @rdz11_living_street_outline);
    [zoom>=12] { line-width: @rdz12_living_street + (2 * @rdz12_living_street_outline); }
    [zoom>=13] { line-width: @rdz13_living_street + (2 * @rdz13_living_street_outline); }
    [zoom>=14] { line-width: @rdz14_living_street + (2 * @rdz14_living_street_outline); }
    [zoom>=15] { line-width: @rdz15_living_street + (2 * @rdz15_living_street_outline); }
    [zoom>=16] { line-width: @rdz16_living_street + (2 * @rdz16_living_street_outline); }
    [zoom>=17] { line-width: @rdz17_living_street + (2 * @rdz17_living_street_outline); }
    [zoom>=18] { line-width: @rdz18_living_street + (2 * @rdz18_living_street_outline); }
  }
  [type='pedestrian'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @pedestrian-case;
    line-width: @rdz11_pedestrian + (2 * @rdz11_pedestrian_outline);
    [zoom>=12] { line-width: @rdz12_pedestrian + (2 * @rdz12_pedestrian_outline); }
    [zoom>=13] { line-width: @rdz13_pedestrian + (2 * @rdz13_pedestrian_outline); }
    [zoom>=14] { line-width: @rdz14_pedestrian + (2 * @rdz14_pedestrian_outline); }
    [zoom>=15] { line-width: @rdz15_pedestrian + (2 * @rdz15_pedestrian_outline); }
    [zoom>=16] { line-width: @rdz16_pedestrian + (2 * @rdz16_pedestrian_outline); }
    [zoom>=17] { line-width: @rdz17_pedestrian + (2 * @rdz17_pedestrian_outline); }
    [zoom>=18] { line-width: @rdz18_pedestrian + (2 * @rdz18_pedestrian_outline); }
  }
  [type='service'][service!='minor'] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @standard-case;
    line-width: @rdz11_service + (2 * @rdz11_service_outline);
    [zoom>=12] { line-width: @rdz12_service + (2 * @rdz12_service_outline); }
    [zoom>=13] { line-width: @rdz13_service + (2 * @rdz13_service_outline); }
    [zoom>=14] { line-width: @rdz14_service + (2 * @rdz14_service_outline); }
    [zoom>=15] { line-width: @rdz15_service + (2 * @rdz15_service_outline); }
    [zoom>=16] { line-width: @rdz16_service + (2 * @rdz16_service_outline); }
    [zoom>=17] { line-width: @rdz17_service + (2 * @rdz17_service_outline); }
    [zoom>=18] { line-width: @rdz18_service + (2 * @rdz18_service_outline); }
  }
  [type='service'][service='minor'][zoom>=14] {
    line-cap: round;
    line-join: round;
    #tunnel::outline,
    #bridge::outline {
      line-cap: butt;
    }
    #tunnel::outline {
      line-dasharray: 3,3;
    }

    line-color: @standard-case;

    line-width: @rdz14_service*0.5 + @rdz14_service_outline*0.5; //only the outline at z14
    [zoom>=15] { line-width: @rdz15_service*0.5 + @rdz15_service_outline; }
    [zoom>=16] { line-width: @rdz16_service*0.5 + @rdz16_service_outline; }
    [zoom>=17] { line-width: @rdz17_service*0.5 + @rdz17_service_outline; }
    [zoom>=18] { line-width: @rdz18_service*0.5 + @rdz18_service_outline; }
  }

  #tunnel::outline {
    [zoom>=17] {
      [type='bridleway'] { line-dasharray: 3,3; line-cap: butt; line-color: @bridge_case; line-width: @rdz17_bridleway + (2 * @rdz17_line_bridge_outline); }
      //[type='footway'] { line-dasharray: 3,3; line-cap: butt; line-color: @bridge_case; line-width: @rdz17_footway + (2 * @rdz17_line_bridge_outline); }
      [type='path'] { line-dasharray: 3,3; line-cap: butt; line-color: @bridge_case; line-width: @rdz17_path + (2 * @rdz17_line_bridge_outline); }
      [type='cycleway'],
      [type='path'][can_bicycle='designated'] {
        line-dasharray: 3,3;
        line-cap: butt;
        line-color: @bridge_case;
        line-width: @rdz17_cycle + (2 * @rdz17_line_bridge_outline);
        [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz17_cycle*1.5 + (2 * @rdz17_line_bridge_outline);
        }
      }

      [zoom >= 18] {
        [type='bridleway'] { line-dasharray: 3,3; line-cap: butt; line-color: @bridge_case; line-width: @rdz18_bridleway + (2 * @rdz18_line_bridge_outline); }
        //[type='footway'] { line-dasharray: 3,3; line-cap: butt; line-color: @bridge_case; line-width: @rdz18_footway + (2 * @rdz18_line_bridge_outline); }
        [type='path'] { line-dasharray: 3,3; line-cap: butt; line-color: @bridge_case; line-width: @rdz18_path + (2 * @rdz18_line_bridge_outline); }
        [type='cycleway'],
        [type='path'][can_bicycle='designated'] {
          line-dasharray: 3,3;
          line-cap: butt;
          line-color: @bridge_case;
          line-width: @rdz18_cycle + (2 * @rdz18_line_bridge_outline);
          [oneway='no'][oneway_bicycle='no'] {
            line-width: @rdz18_cycle*1.5 + (2 * @rdz18_line_bridge_outline);
          }
        }
      }
    }
  }

  #bridge::outline {
    [zoom>=17] {
      [type='bridleway'] { line-cap: butt; line-color: @bridge_path_case; line-width: @rdz17_bridleway + (2 * @rdz17_line_bridge_outline); }
      [type='footway'] { line-cap: butt; line-color: @bridge_path_case; line-width: @rdz17_footway + (2 * @rdz17_line_bridge_outline); }
      [type='path'] { line-cap: butt; line-color: @bridge_path_case; line-width: @rdz17_path + (2 * @rdz17_line_bridge_outline); }
      [type='cycleway'],
      [type='path'][can_bicycle='designated'] {
        line-cap: butt;
        line-color: @bridge_path_case;
        line-width: @rdz17_cycle + (2 * @rdz17_line_bridge_outline);
        [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz17_cycle*1.5 + (2 * @rdz17_line_bridge_outline);
        }
      }
    }

    [zoom >= 18] {
      [type='bridleway'] { line-cap: butt; line-color: @bridge_path_case; line-width: @rdz18_bridleway + (2 * @rdz18_line_bridge_outline); }
      [type='footway'] { line-cap: butt; line-color: @bridge_path_case; line-width: @rdz18_footway + (2 * @rdz18_line_bridge_outline); }
      [type='path'] { line-cap: butt; line-color: @bridge_path_case; line-width: @rdz18_path + (2 * @rdz18_line_bridge_outline); }
      [type='cycleway'],
      [type='path'][can_bicycle='designated'] {
        line-cap: butt;
        line-color: @bridge_path_case;
        line-width: @rdz18_cycle + (2 * @rdz18_line_bridge_outline);
        [oneway='no'][oneway_bicycle='no'] {
          line-width: @rdz18_cycle*1.5 + (2 * @rdz18_line_bridge_outline);
        }
      }
    }
  }
}


#roads_high::path_outline_right[zoom>=17][type='path'][can_bicycle='designated'][segregated='yes'],
#tunnel::path_outline_right[zoom>=17][type='path'][can_bicycle='designated'][segregated='yes'],
#bridge::path_outline_right[zoom>=17][type='path'][can_bicycle='designated'][segregated='yes'] {
  line-cap: butt;
  line-color: @path-fill;

  line-width: @rdz17_path;
  line-offset: @rdz17_path/2 + @rdz17_cycle/2;
  [oneway='no'][oneway_bicycle='no'] {
    line-width: @rdz17_path; line-offset: @rdz17_path/2 + @rdz17_cycle*1.5/2;
  }
  [zoom>=18] {
    line-width: @rdz18_path;
    line-offset: @rdz18_path/2 + @rdz18_cycle/2;
    [oneway='no'][oneway_bicycle='no']{
      line-width: @rdz18_path; line-offset: @rdz18_path/2 + @rdz18_cycle*1.5/2;
    }
  }
}

// Eventually overload right border for cycleways
#roads_high::outline_right[zoom>=11][cycleway_right_render='track'],
#roads_high::outline_right[zoom>=11][cycleway_right_render='shared_track'],
#roads_high::outline_right[zoom>=11][cycleway_right_render='sidewalk'],
#roads_high::outline_right[zoom>=12][cycleway_right_render='lane'],
#roads_high::outline_right[zoom>=12][cycleway_right_render='busway'],
#tunnel::outline_right[zoom>=11][cycleway_right_render='track'],
#tunnel::outline_right[zoom>=11][cycleway_right_render='shared_track'],
#tunnel::outline_right[zoom>=11][cycleway_right_render='sidewalk'],
#tunnel::outline_right[zoom>=12][cycleway_right_render='lane'],
#tunnel::outline_right[zoom>=12][cycleway_right_render='busway'],
#bridge::outline_right[zoom>=11][cycleway_right_render='track'],
#bridge::outline_right[zoom>=11][cycleway_right_render='shared_track'],
#bridge::outline_right[zoom>=11][cycleway_right_render='sidewalk'],
#bridge::outline_right[zoom>=12][cycleway_right_render='lane'],
#bridge::outline_right[zoom>=12][cycleway_right_render='busway'],
{
  [type='motorway'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz11_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz11_cycle; }
    line-width: @rdz11_motorway_trunk;

    [zoom>=12] {
      line-offset: 1 * @rdz12_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
      line-width: @rdz12_motorway_trunk;
    }
    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_motorway_trunk;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_motorway_trunk;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_motorway_trunk;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_motorway_trunk;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_motorway_trunk;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_motorway_trunk;
    }
  }

  [type='motorway_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_motorway_link;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_motorway_link;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_motorway_link;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_motorway_link;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_motorway_link;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_motorway_link;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_motorway_link;
    }
  }

  [type='primary'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz11_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz11_cycle; }
    line-width: @rdz11_primary;

    [zoom>=12] {
      line-offset: 1 * @rdz12_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
      line-width: @rdz12_primary;
    }
    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_primary;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_primary;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_primary;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_primary;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_primary;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_primary;
    }
  }

  [type='primary_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }


    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_primary_link;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_primary_link;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_primary_link;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_primary_link;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_primary_link;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_primary_link;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_primary_link;
    }
  }

  [type='secondary'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz11_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz11_cycle; }
    line-width: @rdz11_secondary;

    [zoom>=12] {
      line-offset: 1 * @rdz12_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
      line-width: @rdz12_secondary;
    }
    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_secondary;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_secondary;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_secondary;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_secondary;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_secondary;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_secondary;
    }
  }

  [type='secondary_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_secondary_link;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_secondary_link;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_secondary_link;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_secondary_link;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_secondary_link;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_secondary_link;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_secondary_link;
    }
  }

  [type='tertiary'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_tertiary;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_tertiary;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_tertiary;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_tertiary;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_tertiary;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_tertiary;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_tertiary;
    }
  }

  [type='tertiary_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_tertiary_link;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_tertiary_link;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_tertiary_link;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_tertiary_link;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_tertiary_link;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_tertiary_link;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_tertiary_link;
    }
  }

  [type='unclassified'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_unclassified;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_unclassified;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_unclassified;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_unclassified;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_unclassified;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_unclassified;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_unclassified;
    }
  }

  [type='residential'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_residential;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_residential;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_residential;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_residential;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_residential;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_residential;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_residential;
    }
  }

  [type='living_street'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_living_street;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_living_street;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_living_street;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_living_street;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_living_street;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_living_street;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_living_street;
    }
  }

  [type='pedestrian'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_pedestrian;

    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_pedestrian;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_pedestrian;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_pedestrian;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_pedestrian;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_pedestrian;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_pedestrian;
    }
  }

  [type='service'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_right_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_right_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_right_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: 1 * @rdz12_cycle;
    [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz12_cycle; }
    line-width: @rdz12_service;
    [zoom>=13] {
      line-offset: 1 * @rdz13_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz13_cycle; }
      line-width: @rdz13_service;
    }
    [zoom>=14] {
      line-offset: 1 * @rdz14_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz14_cycle; }
      line-width: @rdz14_service;
    }
    [zoom>=15] {
      line-offset: 1 * @rdz15_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz15_cycle; }
      line-width: @rdz15_service;
    }
    [zoom>=16] {
      line-offset: 1 * @rdz16_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz16_cycle; }
      line-width: @rdz16_service;
    }
    [zoom>=17] {
      line-offset: 1 * @rdz17_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz17_cycle; }
      line-width: @rdz17_service;
    }
    [zoom>=18] {
      line-offset: 1 * @rdz18_cycle;
      [cycleway_right_oneway='no'] { line-offset: 1.5 * @rdz18_cycle; }
      line-width: @rdz18_service;
    }
  }
}

#roads_high::cycleway_right[zoom>=18][cycleway_right_render='shared_track'][cycleway_right_oneway='yes'],
#roads_high::cycleway_right[zoom>=18][cycleway_right_render='shared_track'][cycleway_right_oneway='-1'],
#tunnel::cycleway_right[zoom>=18][cycleway_right_render='shared_track'][cycleway_right_oneway='yes'],
#tunnel::cycleway_right[zoom>=18][cycleway_right_render='shared_track'][cycleway_right_oneway='-1'],
#bridge::cycleway_right[zoom>=18][cycleway_right_render='shared_track'][cycleway_right_oneway='yes'],
#bridge::cycleway_right[zoom>=18][cycleway_right_render='shared_track'][cycleway_right_oneway='-1'],
#roads_high::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='yes'],
#roads_high::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='-1'],
#tunnel::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='yes'],
#tunnel::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='-1'],
#bridge::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='yes'],
#bridge::cycleway_right[zoom>=18][cycleway_right_render='track'][cycleway_right_oneway='-1'] {
  [type='motorway'],
  [type='primary'],
  [type='secondary'],
  [type='tertiary'],
  [type='living_street'],
  [type='unclassified'],
  [type='residential'],
  [type='tertiary_link'],
  [type='secondary_link'],
  [type='primary_link'],
  [type='motorway_link'],
  [type='service'],
  [type='pedestrian'] {
    marker-placement: line;
    marker-max-error: 0.5;
    marker-spacing: 100;
    marker-file: url(symbols/oneway.svg);
    [cycleway_right_oneway='-1'] {
      marker-file: url(symbols/oneway-reverse.svg);
    }
    marker-fill: #ddf;

    [type='motorway']       { marker-transform: translate(0, 0.5 * @rdz18_motorway_trunk + 0.5 * @rdz18_cycle); }
    [type='primary']        { marker-transform: translate(0, 0.5 * @rdz18_primary + 0.5 * @rdz18_cycle); }
    [type='secondary']      { marker-transform: translate(0, 0.5 * @rdz18_secondary + 0.5 * @rdz18_cycle); }
    [type='tertiary']       { marker-transform: translate(0, 0.5 * @rdz18_tertiary + 0.5 * @rdz18_cycle); }
    [type='living_street']  { marker-transform: translate(0, 0.5 * @rdz18_living_street + 0.5 * @rdz18_cycle); }
    [type='unclassified']   { marker-transform: translate(0, 0.5 * @rdz18_unclassified + 0.5 * @rdz18_cycle); }
    [type='residential']    { marker-transform: translate(0, 0.5 * @rdz18_residential + 0.5 * @rdz18_cycle); }
    [type='tertiary_link']  { marker-transform: translate(0, 0.5 * @rdz18_tertiary_link + 0.5 * @rdz18_cycle); }
    [type='secondary_link'] { marker-transform: translate(0, 0.5 * @rdz18_secondary_link + 0.5 * @rdz18_cycle); }
    [type='primary_link']   { marker-transform: translate(0, 0.5 * @rdz18_primary_link + 0.5 * @rdz18_cycle); }
    [type='motorway_link']  { marker-transform: translate(0, 0.5 * @rdz18_motorway_link + 0.5 * @rdz18_cycle); }
    [type='service']        { marker-transform: translate(0, 0.5 * @rdz18_service + 0.5 * @rdz18_cycle); }
    [type='pedestrian']     { marker-transform: translate(0, 0.5 * @rdz18_pedestrian + 0.5 * @rdz18_cycle); }
  }
}


// Eventually overload left border for cycleways
#roads_high::outline_left[zoom>=11][cycleway_left_render='track'],
#roads_high::outline_left[zoom>=11][cycleway_left_render='shared_track'],
#roads_high::outline_left[zoom>=11][cycleway_left_render='sidewalk'],
#roads_high::outline_left[zoom>=12][cycleway_left_render='lane'],
#roads_high::outline_left[zoom>=12][cycleway_left_render='busway'],
#tunnel::outline_left[zoom>=11][cycleway_left_render='track'],
#tunnel::outline_left[zoom>=11][cycleway_left_render='shared_track'],
#tunnel::outline_left[zoom>=11][cycleway_left_render='sidewalk'],
#tunnel::outline_left[zoom>=12][cycleway_left_render='lane'],
#tunnel::outline_left[zoom>=12][cycleway_left_render='busway'],
#bridge::outline_left[zoom>=11][cycleway_left_render='track'],
#bridge::outline_left[zoom>=11][cycleway_left_render='shared_track'],
#bridge::outline_left[zoom>=11][cycleway_left_render='sidewalk'],
#bridge::outline_left[zoom>=12][cycleway_left_render='lane'],
#bridge::outline_left[zoom>=12][cycleway_left_render='busway'],
{
  [type='motorway'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz11_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz11_cycle; }
    line-width: @rdz11_motorway_trunk;

    [zoom>=12] {
      line-offset: -1 * @rdz12_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
      line-width: @rdz12_motorway_trunk;
    }
    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_motorway_trunk;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_motorway_trunk;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_motorway_trunk;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_motorway_trunk;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_motorway_trunk;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_motorway_trunk;
    }
  }

  [type='motorway_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_motorway_link;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_motorway_link;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_motorway_link;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_motorway_link;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_motorway_link;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_motorway_link;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_motorway_link;
    }
  }

  [type='primary'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz11_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz11_cycle; }
    line-width: @rdz11_primary;

    [zoom>=12] {
      line-offset: -1 * @rdz12_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
      line-width: @rdz12_primary;
    }
    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_primary;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_primary;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_primary;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_primary;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_primary;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_primary;
    }
  }

  [type='primary_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_primary_link;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_primary_link;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_primary_link;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_primary_link;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_primary_link;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_primary_link;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_primary_link;
    }
  }

  [type='secondary'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz11_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz11_cycle; }
    line-width: @rdz11_secondary;

    [zoom>=12] {
      line-offset: -1 * @rdz12_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
      line-width: @rdz12_secondary;
    }
    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_secondary;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_secondary;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_secondary;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_secondary;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_secondary;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_secondary;
    }
  }

  [type='secondary_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_secondary_link;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_secondary_link;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_secondary_link;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_secondary_link;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_secondary_link;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_secondary_link;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_secondary_link;
    }
  }

  [type='tertiary'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_tertiary;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_tertiary;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_tertiary;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_tertiary;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_tertiary;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_tertiary;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_tertiary;
    }
  }

  [type='tertiary_link'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_tertiary_link;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_tertiary_link;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_tertiary_link;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_tertiary_link;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_tertiary_link;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_tertiary_link;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_tertiary_link;
    }
  }

  [type='unclassified'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_unclassified;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_unclassified;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_unclassified;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_unclassified;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_unclassified;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_unclassified;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_unclassified;
    }
  }

  [type='residential'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_residential;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_residential;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_residential;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_residential;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_residential;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_residential;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_residential;
    }
  }

  [type='living_street'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_living_street;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_living_street;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_living_street;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_living_street;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_living_street;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_living_street;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_living_street;
    }
  }

  [type='pedestrian'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_pedestrian;

    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_pedestrian;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_pedestrian;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_pedestrian;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_pedestrian;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_pedestrian;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_pedestrian;
    }
  }

  [type='service'] {
    line-cap: butt;
    line-color: @cycle_track_case;
    [cycleway_left_render='sidewalk'] {
      line-color: @path-fill;
    }
    [cycleway_left_render='lane'] {
      line-dasharray: 6,3;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='busway'] {
      line-dasharray: 6,10;
      line-color: @mixed-cycle-fill;
    }
    [cycleway_left_render='shared_track'] {
      line-color: @mixed-cycle-fill;
    }

    line-offset: -1 * @rdz12_cycle;
    [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz12_cycle; }
    line-width: @rdz12_service;
    [zoom>=13] {
      line-offset: -1 * @rdz13_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz13_cycle; }
      line-width: @rdz13_service;
    }
    [zoom>=14] {
      line-offset: -1 * @rdz14_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz14_cycle; }
      line-width: @rdz14_service;
    }
    [zoom>=15] {
      line-offset: -1 * @rdz15_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz15_cycle; }
      line-width: @rdz15_service;
    }
    [zoom>=16] {
      line-offset: -1 * @rdz16_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz16_cycle; }
      line-width: @rdz16_service;
    }
    [zoom>=17] {
      line-offset: -1 * @rdz17_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz17_cycle; }
      line-width: @rdz17_service;
    }
    [zoom>=18] {
      line-offset: -1 * @rdz18_cycle;
      [cycleway_left_oneway='no'] { line-offset: -1.5 * @rdz18_cycle; }
      line-width: @rdz18_service;
    }
  }
}

#roads_high::cycleway_left[zoom>=18][cycleway_left_render='shared_track'][cycleway_left_oneway='yes'],
#roads_high::cycleway_left[zoom>=18][cycleway_left_render='shared_track'][cycleway_left_oneway='-1'],
#tunnel::cycleway_left[zoom>=18][cycleway_left_render='shared_track'][cycleway_left_oneway='yes'],
#tunnel::cycleway_left[zoom>=18][cycleway_left_render='shared_track'][cycleway_left_oneway='-1'],
#bridge::cycleway_left[zoom>=18][cycleway_left_render='shared_track'][cycleway_left_oneway='yes'],
#bridge::cycleway_left[zoom>=18][cycleway_left_render='shared_track'][cycleway_left_oneway='-1'],
#roads_high::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='yes'],
#roads_high::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='-1'],
#tunnel::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='yes'],
#tunnel::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='-1'],
#bridge::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='yes'],
#bridge::cycleway_left[zoom>=18][cycleway_left_render='track'][cycleway_left_oneway='-1'] {
  [type='motorway'],
  [type='primary'],
  [type='secondary'],
  [type='tertiary'],
  [type='living_street'],
  [type='unclassified'],
  [type='residential'],
  [type='tertiary_link'],
  [type='secondary_link'],
  [type='primary_link'],
  [type='motorway_link'],
  [type='service'],
  [type='pedestrian'] {
    marker-placement: line;
    marker-max-error: 0.5;
    marker-spacing: 100;
    marker-file: url(symbols/oneway.svg);
    [cycleway_left_oneway='-1'] {
      marker-file: url(symbols/oneway-reverse.svg);
    }
    marker-fill: #ddf;

    [type='motorway']       { marker-transform: translate(0, -0.5 * @rdz18_motorway_trunk - 0.5 * @rdz18_cycle); }
    [type='primary']        { marker-transform: translate(0, -0.5 * @rdz18_primary - 0.5 * @rdz18_cycle); }
    [type='secondary']      { marker-transform: translate(0, -0.5 * @rdz18_secondary - 0.5 * @rdz18_cycle); }
    [type='tertiary']       { marker-transform: translate(0, -0.5 * @rdz18_tertiary - 0.5 * @rdz18_cycle); }
    [type='living_street']  { marker-transform: translate(0, -0.5 * @rdz18_living_street - 0.5 * @rdz18_cycle); }
    [type='unclassified']   { marker-transform: translate(0, -0.5 * @rdz18_unclassified - 0.5 * @rdz18_cycle); }
    [type='residential']    { marker-transform: translate(0, -0.5 * @rdz18_residential - 0.5 * @rdz18_cycle); }
    [type='tertiary_link']  { marker-transform: translate(0, -0.5 * @rdz18_tertiary_link - 0.5 * @rdz18_cycle); }
    [type='secondary_link'] { marker-transform: translate(0, -0.5 * @rdz18_secondary_link - 0.5 * @rdz18_cycle); }
    [type='primary_link']   { marker-transform: translate(0, -0.5 * @rdz18_primary_link - 0.5 * @rdz18_cycle); }
    [type='motorway_link']  { marker-transform: translate(0, -0.5 * @rdz18_motorway_link - 0.5 * @rdz18_cycle); }
    [type='service']        { marker-transform: translate(0, -0.5 * @rdz18_service - 0.5 * @rdz18_cycle); }
    [type='pedestrian']     { marker-transform: translate(0, -0.5 * @rdz18_pedestrian - 0.5 * @rdz18_cycle); }
  }
}

#roads_high::steps_ramp_left[zoom >= 15],
#tunnel::steps_ramp_left[zoom>=15],
#bridge::steps_ramp_left[zoom>=15] {
  [type='steps'] {
    [has_ramp!='no'][has_ramp!=null][has_ramp!='separate'] {
      line-color: @cycle-fill;
      line-width: @rdz15_steps_outline*2;
      line-offset: @rdz15_steps/2 + @rdz15_steps_outline;

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

/**/
#roads_high::inline[zoom>=11],
#tunnel::inline[zoom>=11],
#bridge::inline[zoom>=11] {

  [type='motorway'][zoom>=11] {
    line-cap: round;
    line-join: round;
    line-color: @motorway-trunk-cycle-fill;
    #tunnel { line-color: lighten(@motorway-trunk-cycle-fill, 10%); }
    [can_bicycle='no'] {
      line-color: @motorway-trunk-fill;
      #tunnel { line-color: lighten(@motorway-trunk-fill, 10%); }
    }

    line-width: @rdz11_motorway_trunk;
    [zoom>=12] { line-width: @rdz12_motorway_trunk; }
    [zoom>=13] { line-width: @rdz13_motorway_trunk; }
    [zoom>=14] { line-width: @rdz14_motorway_trunk; }
    [zoom>=15] { line-width: @rdz15_motorway_trunk; }
    [zoom>=16] { line-width: @rdz16_motorway_trunk; }
    [zoom>=17] { line-width: @rdz17_motorway_trunk; }
    [zoom>=18] { line-width: @rdz18_motorway_trunk; }
  }
  [type='motorway_link'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-color: @motorway-trunk-cycle-fill;
    #tunnel { line-color: lighten(@motorway-trunk-cycle-fill, 10%); }
    [can_bicycle='no'] {
      line-color: @motorway-trunk-fill;
      #tunnel { line-color: lighten(@motorway-trunk-fill, 10%); }
    }

    line-width: @rdz12_motorway_link;
    [zoom>=13] { line-width: @rdz13_motorway_link; }
    [zoom>=14] { line-width: @rdz14_motorway_link; }
    [zoom>=15] { line-width: @rdz15_motorway_link; }
    [zoom>=16] { line-width: @rdz16_motorway_link; }
    [zoom>=17] { line-width: @rdz17_motorway_link; }
    [zoom>=18] { line-width: @rdz18_motorway_link; }
  }

  [type='primary'] {
    line-cap: round;
    line-join: round;
    line-width: @rdz11_primary;
    [zoom>=12] { line-width: @rdz12_primary; }
    [zoom>=13] { line-width: @rdz13_primary; }
    [zoom>=14] { line-width: @rdz14_primary; }
    [zoom>=15] { line-width: @rdz15_primary; }
    [zoom>=16] { line-width: @rdz16_primary; }
    [zoom>=17] { line-width: @rdz17_primary; }
    [zoom>=18] { line-width: @rdz18_primary; }

    line-color: @primary-fill;
    #tunnel { line-color: lighten(@primary-fill, 5%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_primary;
        [zoom>=15] { surface/line-width: @rdz15_primary; }
        [zoom>=16] { surface/line-width: @rdz16_primary; }
        [zoom>=17] { surface/line-width: @rdz17_primary; }
        [zoom>=18] { surface/line-width: @rdz18_primary; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }
  [type='primary_link'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_primary_link;
    [zoom>=13] { line-width: @rdz13_primary_link; }
    [zoom>=14] { line-width: @rdz14_primary_link; }
    [zoom>=15] { line-width: @rdz15_primary_link; }
    [zoom>=16] { line-width: @rdz16_primary_link; }
    [zoom>=17] { line-width: @rdz17_primary_link; }
    [zoom>=18] { line-width: @rdz18_primary_link; }

    line-color: @primary-fill;
    #tunnel { line-color: lighten(@primary-fill, 5%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_primary_link;
        [zoom>=15] { surface/line-width: @rdz15_primary_link; }
        [zoom>=16] { surface/line-width: @rdz16_primary_link; }
        [zoom>=17] { surface/line-width: @rdz17_primary_link }
        [zoom>=18] { surface/line-width: @rdz18_primary_link; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }

  [type='secondary'] {
    line-cap: round;
    line-join: round;
    line-width: @rdz11_secondary;
    [zoom>=12] { line-width: @rdz12_secondary; }
    [zoom>=13] { line-width: @rdz13_secondary; }
    [zoom>=14] { line-width: @rdz14_secondary; }
    [zoom>=15] { line-width: @rdz15_secondary; }
    [zoom>=16] { line-width: @rdz16_secondary; }
    [zoom>=17] { line-width: @rdz17_secondary; }
    [zoom>=18] { line-width: @rdz18_secondary; }

    line-color: @secondary-fill;
    #tunnel { line-color: lighten(@secondary-fill, 5%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_secondary;
        [zoom>=15] { surface/line-width: @rdz15_secondary; }
        [zoom>=16] { surface/line-width: @rdz16_secondary; }
        [zoom>=17] { surface/line-width: @rdz17_secondary; }
        [zoom>=18] { surface/line-width: @rdz18_secondary; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }
  [type='secondary_link'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_secondary_link;
    [zoom>=13] { line-width: @rdz13_secondary_link; }
    [zoom>=14] { line-width: @rdz14_secondary_link; }
    [zoom>=15] { line-width: @rdz15_secondary_link; }
    [zoom>=16] { line-width: @rdz16_secondary_link; }
    [zoom>=17] { line-width: @rdz17_secondary_link; }
    [zoom>=18] { line-width: @rdz18_secondary_link; }

    line-color: @secondary-fill;
    #tunnel { line-color: lighten(@secondary-fill, 5%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_secondary_link;
        [zoom>=15] { surface/line-width: @rdz15_secondary_link; }
        [zoom>=16] { surface/line-width: @rdz16_secondary_link; }
        [zoom>=17] { surface/line-width: @rdz17_secondary_link; }
        [zoom>=18] { surface/line-width: @rdz18_secondary_link; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }

  [type='tertiary'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_tertiary;
    [zoom>=13] { line-width: @rdz13_tertiary; }
    [zoom>=14] { line-width: @rdz14_tertiary; }
    [zoom>=15] { line-width: @rdz15_tertiary; }
    [zoom>=16] { line-width: @rdz16_tertiary; }
    [zoom>=17] { line-width: @rdz17_tertiary; }
    [zoom>=18] { line-width: @rdz18_tertiary; }

    line-color: @standard-fill;
    #tunnel { line-color: lighten(@standard-fill, 10%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_tertiary;
        [zoom>=15] { surface/line-width: @rdz15_tertiary; }
        [zoom>=16] { surface/line-width: @rdz16_tertiary; }
        [zoom>=17] { surface/line-width: @rdz17_tertiary; }
        [zoom>=18] { surface/line-width: @rdz18_tertiary; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }
  [type='tertiary_link'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_tertiary_link;
    [zoom>=13] { line-width: @rdz13_tertiary_link; }
    [zoom>=14] { line-width: @rdz14_tertiary_link; }
    [zoom>=15] { line-width: @rdz15_tertiary_link; }
    [zoom>=16] { line-width: @rdz16_tertiary_link; }
    [zoom>=17] { line-width: @rdz17_tertiary_link; }
    [zoom>=18] { line-width: @rdz18_tertiary_link; }

    line-color: @standard-fill;
    #tunnel { line-color: lighten(@standard-fill, 10%); }

    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_tertiary_link;
        [zoom>=15] { surface/line-width: @rdz15_tertiary_link; }
        [zoom>=16] { surface/line-width: @rdz16_tertiary_link; }
        [zoom>=17] { surface/line-width: @rdz17_tertiary_link; }
        [zoom>=18] { surface/line-width: @rdz18_tertiary_link; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }

  [type='unclassified'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_unclassified;
    [zoom>=13] { line-width: @rdz13_unclassified; }
    [zoom>=14] { line-width: @rdz14_unclassified; }
    [zoom>=15] { line-width: @rdz15_unclassified; }
    [zoom>=16] { line-width: @rdz16_unclassified; }
    [zoom>=17] { line-width: @rdz17_unclassified; }
    [zoom>=18] { line-width: @rdz18_unclassified; }

    line-color: @standard-fill;
    #tunnel { line-color: lighten(@standard-fill, 10%); }

    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_unclassified;
        [zoom>=15] { surface/line-width: @rdz15_unclassified; }
        [zoom>=16] { surface/line-width: @rdz16_unclassified; }
        [zoom>=17] { surface/line-width: @rdz17_unclassified; }
        [zoom>=18] { surface/line-width: @rdz18_unclassified; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] {
            surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2);
          }
        }
      }
    }
  }

  [type='residential'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_residential;
    [zoom>=13] { line-width: @rdz13_residential; }
    [zoom>=14] { line-width: @rdz14_residential; }
    [zoom>=15] { line-width: @rdz15_residential; }
    [zoom>=16] { line-width: @rdz16_residential; }
    [zoom>=17] { line-width: @rdz17_residential; }
    [zoom>=18] { line-width: @rdz18_residential; }

    line-color: @standard-fill;
    #tunnel { line-color: lighten(@standard-fill, 10%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_residential;
        [zoom>=15] { surface/line-width: @rdz15_residential; }
        [zoom>=16] { surface/line-width: @rdz16_residential; }
        [zoom>=17] { surface/line-width: @rdz17_residential; }
        [zoom>=18] { surface/line-width: @rdz18_residential; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }

  [type='service'][service!='minor'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_service;
    [zoom>=13] { line-width: @rdz13_service; }
    [zoom>=14] { line-width: @rdz14_service; }
    [zoom>=15] { line-width: @rdz15_service; }
    [zoom>=16] { line-width: @rdz16_service; }
    [zoom>=17] { line-width: @rdz17_service; }
    [zoom>=18] { line-width: @rdz18_service; }

    line-color: @standard-fill;
    #tunnel { line-color: lighten(@standard-fill, 10%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    //surface
    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_service;
        [zoom>=15] { surface/line-width: @rdz15_service; }
        [zoom>=16] { surface/line-width: @rdz16_service; }
        [zoom>=17] { surface/line-width: @rdz17_service; }
        [zoom>=18] { surface/line-width: @rdz18_service; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }
  [type='service'][service='minor'][zoom>=15] {
    line-cap: round;
    line-join: round;
    line-width: @rdz15_service*0.5;
    [service='minor'][zoom>=16] { line-width: @rdz16_service*0.5; }
    [service='minor'][zoom>=17] { line-width: @rdz17_service*0.5; }
    [service='minor'][zoom>=18] { line-width: @rdz18_service*0.5; }

    line-color: @standard-fill;
    #tunnel { line-color: lighten(@standard-fill, 10%); }
    [maxspeed_kmh < 33] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh < 21] {
        line-color: @speed20-fill;
        #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    //surface
    //[zoom>=15] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz15_service*0.5;
        [zoom>=16] { surface/line-width: @rdz16_service*0.5; }
        [zoom>=17] { surface/line-width: @rdz17_service*0.5; }
        [zoom>=18] { surface/line-width: @rdz18_service*0.5; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    //}
  }

  [type='living_street'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_living_street;
    [zoom>=13] { line-width: @rdz13_living_street; }
    [zoom>=14] { line-width: @rdz14_living_street; }
    [zoom>=15] { line-width: @rdz15_living_street; }
    [zoom>=16] { line-width: @rdz16_living_street; }
    [zoom>=17] { line-width: @rdz17_living_street; }
    [zoom>=18] { line-width: @rdz18_living_street; }

    line-color: @speed20-fill;
    #tunnel { line-color: lighten(@speed20-fill, 10%); }
    [maxspeed_kmh < 10] {
      line-color: @speedWalk-fill;
      #tunnel { line-color: lighten(@speedWalk-fill, 10%); }
    }
    [maxspeed_kmh >= 21] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh >= 33] {
        line-color: @standard-fill;
        #tunnel { line-color: lighten(@standard-fill, 10%); }
    }
    [motor_vehicle='no'][can_bicycle!='no'] {
        line-color: @nomotor-fill;
        #tunnel { line-color: lighten(@nomotor-fill, 10%); }
    }
    [cyclestreet='yes'] {
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_living_street;
        [zoom>=15] { surface/line-width: @rdz15_living_street; }
        [zoom>=16] { surface/line-width: @rdz16_living_street; }
        [zoom>=17] { surface/line-width: @rdz17_living_street; }
        [zoom>=18] { surface/line-width: @rdz18_living_street; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }

  [type='pedestrian'][zoom>=12] {
    line-cap: round;
    line-join: round;
    line-width: @rdz12_pedestrian;
    [zoom>=13] { line-width: @rdz13_pedestrian; }
    [zoom>=14] { line-width: @rdz14_pedestrian; }
    [zoom>=15] { line-width: @rdz15_pedestrian; }
    [zoom>=16] { line-width: @rdz16_pedestrian; }
    [zoom>=17] { line-width: @rdz17_pedestrian; }
    [zoom>=18] { line-width: @rdz18_pedestrian; }

    line-color: @pedestrian-fill;
    #tunnel { line-color: lighten(@pedestrian-fill, 10%); }
    [maxspeed_kmh >= 10] {
      line-color: @speed20-fill;
      #tunnel { line-color: lighten(@speed20-fill, 10%); }
    }
    [maxspeed_kmh >= 21] {
        line-color: @speed32-fill;
        #tunnel { line-color: lighten(@speed32-fill, 10%); }
    }
    [maxspeed_kmh >= 33] {
        line-color: @standard-fill;
        #tunnel { line-color: lighten(@standard-fill, 10%); }
    }
    //  [motor_vehicle='no'][can_bicycle!='no'][type!='pedestrian'] { //Keep pedestrian color even if motor is forbidden.
    //    line-color: @nomotor-fill;
    //    #tunnel {
    //      line-color: lighten(@nomotor-fill, 10%);
    //    }
    //  }
    /*  [can_bicycle='no'] {
        line-color: @standard-nobicycle;
        #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
      }*/
  /*  [cyclestreet='yes'] { // a pedestrian street should not be a cyclestreet
        line-color: @mixed-cycle-fill;
        #tunnel { line-color: lighten(@mixed-cycle-fill, 10%); }
    }*/
    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }


    [zoom>=14] {
      [surface_type='cyclocross'],
      [surface_type='mtb'] {
        surface/line-width: @rdz14_pedestrian;
        [zoom>=15] { surface/line-width: @rdz15_pedestrian; }
        [zoom>=16] { surface/line-width: @rdz16_pedestrian; }
        [zoom>=17] { surface/line-width: @rdz17_pedestrian; }
        [zoom>=18] { surface/line-width: @rdz18_pedestrian; }

        [surface_type='cyclocross'] {
          surface/line-opacity: 0.6;
          surface/line-dasharray: 4,8;
          [zoom>=16] { surface/line-dasharray: 6,12; }
          [zoom>=17] { surface/line-dasharray: 8,16; }

          surface/line-color: darken(@standard-fill, @surfaceDarker2); // Darken since it's white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter1); }
        }

        // Bad surface ok for mountain bike (>40mm tyres).
        [surface_type='mtb'] {
          surface/line-dasharray: 10,5;
          [zoom>=16] { surface/line-dasharray: 14,7; }
          [zoom>=17] { surface/line-dasharray: 20,10; }

          surface/line-color: darken(@standard-fill, @surfaceDarker1); // Darken since its white.
          [can_bicycle='no'] { surface/line-color: lighten(@standard-nobicycle, @surfaceLighter2); }
        }
      }
    }
  }

  [type='track'][zoom >= 11] {
    [surface_type='unknown'][zoom >= 13],
    [surface_type='cyclocross'][zoom >= 12],
    [surface_type='mtb'][zoom >= 12] {
      background/line-join: round;
      background/line-opacity: 0.4;
      background/line-color: #FFFFFF;

      background/line-width: @rdz12_track;
      [zoom>=13] { background/line-width: @rdz13_track; }
      [zoom>=14] { background/line-width: @rdz14_track; }
      [zoom>=15] { background/line-width: @rdz15_track; }
      [zoom>=16] { background/line-width: @rdz16_track; }
      [zoom>=17] { background/line-width: @rdz17_track; }
      [zoom>=18] { background/line-width: @rdz18_track; }

      line-cap: butt;
      //[surface_type='unknown'] {
        line-dasharray: 10,1;
      //}
      [surface_type='cyclocross'] {
        line-dasharray: 5,2;
        [zoom>=16] { line-dasharray: 10,4; }
        [zoom>=17] { line-dasharray: 20,8; }
      }
      [surface_type='mtb'] {
        line-dasharray: 2,2;
        [zoom>=16] { line-dasharray: 4,4; }
        [zoom>=17] { line-dasharray: 8,8; }
      }
    }

    line-cap: round;
    line-join: round;
    line-color: @track-fill;
    #tunnel { line-color: lighten(@track-fill, 10%); }

    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    line-width: @rdz11_track;
    [zoom>=12] { line-width: @rdz12_track; }
    [zoom>=13] { line-width: @rdz13_track; }
    [zoom>=14] { line-width: @rdz14_track; }
    [zoom>=15] { line-width: @rdz15_track; }
    [zoom>=16] { line-width: @rdz16_track; }
    [zoom>=17] { line-width: @rdz17_track; }
    [zoom>=18] { line-width: @rdz18_track; }
  }

  [type='bridleway'][zoom >= 13] {
    [surface_type='unknown'],
    [surface_type='cyclocross'],
    [surface_type='mtb'] {
      background/line-join: round;
      background/line-opacity: 0.4;
      background/line-color: #FFFFFF;

      background/line-width: @rdz13_bridleway;
      [zoom>=14] { background/line-width: @rdz14_bridleway; }
      [zoom>=15] { background/line-width: @rdz15_bridleway; }
      [zoom>=16] { background/line-width: @rdz16_bridleway; }
      [zoom>=17] { background/line-width: @rdz17_bridleway; }
      [zoom>=18] { background/line-width: @rdz18_bridleway; }

      line-cap: butt;
      //[surface_type='unknown'] {
        line-dasharray: 10,1;
      //}
      [surface_type='cyclocross'] {
        line-dasharray: 5,2;
        [zoom>=16] { line-dasharray: 10,4; }
        [zoom>=17] { line-dasharray: 20,8; }
      }
      [surface_type='mtb'] {
        line-dasharray: 2,2;
        [zoom>=16] { line-dasharray: 4,4; }
        [zoom>=17] { line-dasharray: 8,8; }
      }
    }

    line-cap: round;
    line-join: round;
    line-color: @bridleway-fill;
    #tunnel { line-color: lighten(@bridleway-fill, 10%); }

    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    line-width: @rdz13_bridleway;
    [zoom>=14] { line-width: @rdz14_bridleway; }
    [zoom>=15] { line-width: @rdz15_bridleway; }
    [zoom>=16] { line-width: @rdz16_bridleway; }
    [zoom>=17] { line-width: @rdz17_bridleway; }
    [zoom>=18] { line-width: @rdz18_bridleway; }
  }

  [type='footway'][zoom >= 13] {
    [surface_type='unknown'],
    [surface_type='cyclocross'],
    [surface_type='mtb'] {
      background/line-join: round;
      background/line-opacity: 0.4;
      background/line-color: #FFFFFF;

      background/line-width: @rdz13_footway;
      [zoom>=14] { background/line-width: @rdz14_footway; }
      [zoom>=15] { background/line-width: @rdz15_footway; }
      [zoom>=16] { background/line-width: @rdz16_footway; }
      [zoom>=17] { background/line-width: @rdz17_footway; }
      [zoom>=18] { background/line-width: @rdz18_footway; }

      line-cap: butt;
      //[surface_type='unknown'] {
        line-dasharray: 10,1;
      //}
      [surface_type='cyclocross'] {
        line-dasharray: 5,2;
        [zoom>=16] { line-dasharray: 10,4; }
        [zoom>=17] { line-dasharray: 20,8; }
      }
      [surface_type='mtb'] {
        line-dasharray: 2,2;
        [zoom>=16] { line-dasharray: 4,4; }
        [zoom>=17] { line-dasharray: 8,8; }
      }
    }

    line-cap: round;
    line-join: round;
    line-color: @footway-fill;
    #tunnel { line-color: @footway-tunnel-fill; }

    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    line-width: @rdz13_footway;
    [zoom>=14] { line-width: @rdz14_footway; }
    [zoom>=15] { line-width: @rdz15_footway; }
    [zoom>=16] { line-width: @rdz16_footway; }
    [zoom>=17] { line-width: @rdz17_footway; }
    [zoom>=18] { line-width: @rdz18_footway; }
  }

  [type='steps'][zoom >= 14] {
    line-color: @footway-fill;
    #tunnel { line-color: @footway-tunnel-fill; }

    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    line-width: @rdz14_steps;
    line-dasharray: 0.5,0.5;
    [zoom>=15] { line-width: @rdz15_steps; }
    [zoom>=16] { line-width: @rdz16_steps; line-dasharray: 1.5,0.75; }
    [zoom>=17] { line-width: @rdz17_steps; line-dasharray: 2,1; }
    [zoom>=18] { line-width: @rdz18_steps; }
  }

  [type='cycleway'][zoom >= 11] {
    [surface_type='cyclocross'][zoom >= 12],
    [surface_type='mtb'][zoom >= 12] {
      background/line-join: round;
      background/line-opacity: 0.6;
      background/line-color: darken(@cycle-fill, @surfaceLighter1);

      background/line-width: @rdz12_cycle;
      [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz12_cycle*1.5; }
      [zoom>=13] {
        background/line-width: @rdz13_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz13_cycle*1.5; }
      }
      [zoom>=14] {
        background/line-width: @rdz14_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz14_cycle*1.5; }
      }
      [zoom>=15] {
        background/line-width: @rdz15_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz15_cycle*1.5; }
      }
      [zoom>=16] {
        background/line-width: @rdz16_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz16_cycle*1.5; }
      }
      [zoom>=17] {
        background/line-width: @rdz17_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz17_cycle*1.5; }
      }
      [zoom>=18] {
        background/line-width: @rdz18_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz18_cycle*1.5; }
      }

      // cyclocross
      line-dasharray: 5,2;
      line-cap: butt;
      [zoom>=16] { line-dasharray: 10,4; }
      [zoom>=17] { line-dasharray: 20,8; }
      [surface_type='mtb'] {
        line-dasharray: 2,2;
        [zoom>=16] { line-dasharray: 4,4; }
        [zoom>=17] { line-dasharray: 8,8; }
      }
    }

    line-cap: round;
    line-join: round;
    line-color: @cycle-fill;
    #tunnel { line-color: lighten(@cycle-fill, 25%); }

    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    line-width: @rdz11_cycle;
    [oneway='no'][oneway_bicycle='no'] { line-width: @rdz11_cycle*1.5; }
    [zoom>=12] {
      line-width: @rdz12_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz12_cycle*1.5; }
    }
    [zoom>=13] {
      line-width: @rdz13_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz13_cycle*1.5; }
    }
    [zoom>=14] {
      line-width: @rdz14_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz14_cycle*1.5; }
    }
    [zoom>=15] {
      line-width: @rdz15_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz15_cycle*1.5; }
    }
    [zoom>=16] {
      line-width: @rdz16_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz16_cycle*1.5; }
    }
    [zoom>=17] {
      line-width: @rdz17_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz17_cycle*1.5; }
    }
    [zoom>=18] {
      line-width: @rdz18_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz18_cycle*1.5; }
    }
  }

  [type='path'][zoom >= 11]
  {
    [surface_type='unknown'][zoom >= 13],
    [surface_type='cyclocross'][zoom >= 12],
    [surface_type='mtb'][zoom >= 12] {
      background/line-join: round;
      background/line-opacity: 0.4;
      background/line-color: #FFFFFF;

      background/line-width: @rdz12_path;
      [can_bicycle='designated'] {
        background/line-width: @rdz12_cycle;
        [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz12_cycle*1.5; }
      }
      [zoom>=13] {
        background/line-width: @rdz13_path;
        [can_bicycle='designated'] {
          background/line-width: @rdz13_cycle;
          [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz13_cycle*1.5; }
        }
      }
      [zoom>=14] {
        background/line-width: @rdz14_path;
        [can_bicycle='designated'] {
          background/line-width: @rdz14_cycle;
          [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz14_cycle*1.5; }
        }
      }
      [zoom>=15] {
        background/line-width: @rdz15_path;
        [can_bicycle='designated'] {
          background/line-width: @rdz15_cycle;
          [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz15_cycle*1.5; }
        }
      }
      [zoom>=16] {
        background/line-width: @rdz16_path;
        [can_bicycle='designated'] {
          background/line-width: @rdz16_cycle;
          [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz16_cycle*1.5; }
        }
      }
      [zoom>=17] {
        background/line-width: @rdz17_path;
        [can_bicycle='designated'] {
          background/line-width: @rdz17_cycle;
          [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz17_cycle*1.5; }
        }
      }
      [zoom>=18] {
        background/line-width: @rdz18_path;
        [can_bicycle='designated'] {
          background/line-width: @rdz18_cycle;
          [oneway='no'][oneway_bicycle='no'] { background/line-width: @rdz18_cycle*1.5; }
        }
      }

      line-cap: butt;
      line-dasharray: 10,1;
      [surface_type='cyclocross'][zoom >= 12] {
        line-dasharray: 5,2;
        [zoom>=16] { line-dasharray: 10,4; }
        [zoom>=17] { line-dasharray: 20,8; }
      }
      [surface_type='mtb'][zoom >= 12] {
        line-dasharray: 2,2;
        [zoom>=16] { line-dasharray: 4,4; }
        [zoom>=17] { line-dasharray: 8,8; }
      }
    }

    line-cap: round;
    line-join: round;
    line-color: @path-fill;
    #tunnel { line-color: lighten(@path-fill, 15%); }

    [can_bicycle='designated'] {
      line-color: @mixed-cycle-fill;
      #tunnel { line-color: lighten(@mixed-cycle-fill, 15%); }

      [segregated='yes'] {
        line-color: @cycle-fill;
        #tunnel { line-color: lighten(@cycle-fill, 25%); }
      }

      line-width: @rdz11_cycle;
      [oneway='no'][oneway_bicycle='no'] { line-width: @rdz11_cycle*1.5; }
      [zoom>=12] {
        line-width: @rdz12_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz12_cycle*1.5; }
      }
      [zoom>=13] {
        line-width: @rdz13_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz13_cycle*1.5; }
      }
      [zoom>=14] {
        line-width: @rdz14_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz14_cycle*1.5; }
      }
      [zoom>=15] {
        line-width: @rdz15_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz15_cycle*1.5; }
      }
      [zoom>=16] {
        line-width: @rdz16_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz16_cycle*1.5; }
      }
      [zoom>=17] {
        line-width: @rdz17_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz17_cycle*1.5; }
      }
      [zoom>=18] {
        line-width: @rdz18_cycle;
        [oneway='no'][oneway_bicycle='no'] { line-width: @rdz18_cycle*1.5; }
      }
    }

    [can_bicycle='no'] {
      line-color: @standard-nobicycle;
      #tunnel { line-color: lighten(@standard-nobicycle, 5%); }
    }

    line-width: @rdz11_path;
    [zoom>=12] { line-width: @rdz12_path; }
    [zoom>=13] { line-width: @rdz13_path; }
    [zoom>=14] { line-width: @rdz14_path; }
    [zoom>=15] { line-width: @rdz15_path; }
    [zoom>=16] { line-width: @rdz16_path; }
    [zoom>=17] { line-width: @rdz17_path; }
    [zoom>=18] { line-width: @rdz18_path; }
  }
}


#roads_high::mtbscale[mtb_scale>=0][zoom>=15]
{
  [type='service'],
  [type='track'],
  [type='bridleway'],
  [type='footway'],
  [type='path'],
  [type='cycleway']
  {
    line-color: #2076ff;
    line-dasharray: 1,8;

    [mtb_scale=1] {
      line-dasharray: 1,1,1,8;
    }
    [mtb_scale>=2] {
      line-color: #FF0000;
    }
    [mtb_scale>=3] {
      line-color: #000000; //one dash |
    }
    [mtb_scale>=4] {
      line-dasharray: 1,1,1,8;// 2 ||
    }
    [mtb_scale>=5] {
      line-dasharray: 1,1,1,1,1,8;// 3 |||
    }
    [mtb_scale>=6] {
      line-dasharray: 1,1,1,1,1,1,1,8;// 4 |||
    }

    line-width: @rdz15_path*3;
    [zoom>=16] {
      line-width: @rdz16_path*3;
    }
    [zoom>=17] {
      line-width: @rdz17_path*3;
    }
    [zoom>=18] {
      line-width: @rdz18_path*3;
    }
  }
}

#roads_high::mtbscale[mtb_scale=null][mtb_scale_imba>=0][zoom>=15]
{
  [type='service'],
  [type='track'],
  [type='bridleway'],
  [type='footway'],
  [type='path'],
  [type='cycleway']
  {
    line-cap: round;
    line-color: #FFFFFF;
    line-dasharray: 0.1,12;

    [mtb_scale_imba>=1] {
      line-color: #4e9b00;
    }
    [mtb_scale_imba>=2] {
      line-color: #2076ff;
    }
    [mtb_scale_imba>=3] {
      line-color: #000000;
    }
    [mtb_scale_imba>=4] {
      line-color: #000000;
      line-dasharray: 0.1,4,0.1,18;
    }

    line-width: @rdz15_path*3;
    [zoom>=16] {
      line-width: @rdz16_path*3;
    }
    [zoom>=17] {
      line-width: @rdz17_path*2;
      line-dasharray: 0.1,24;
      [mtb_scale_imba>=4] {
        line-dasharray: 0.1,4,0.1,36;
      }
    }
    [zoom>=18] {
      line-width: @rdz18_path*2;
    }
  }
}


#roads_high::rail_line[zoom>=11],
#bridge::rail_line[zoom>=11] {
  [type='railway'] {
    [service!='minor'],
    [service='minor'][zoom>=13]
    {
      line-color: @rail-line;
      [service='minor'] {
        line-color: lighten(@rail-line, 25%);
      }

      line-width: @rdz11_railway;
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
}


// ---- Turning Circles ---------------------------------------------
#turning_circle_case[zoom>=14] {
  marker-fill: @standard-fill;
  marker-line-color: @standard-case;
  marker-line-width: 2*@rdz14_residential_outline;
  [zoom>=15] { marker-line-width: 2*@rdz15_residential_outline; }
  [zoom>=16] { marker-line-width: 2*@rdz16_residential_outline; }
  [zoom>=17] { marker-line-width: 2*@rdz17_residential_outline; }
  [zoom>=18] { marker-line-width: 2*@rdz18_residential_outline; }
  marker-allow-overlap: true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill: @standard-fill;
  marker-line-width: 0;
  marker-line-opacity: 0;
  marker-allow-overlap: true;
}
#turning_circle_case[zoom>=14],
#turning_circle_fill[zoom>=14] {
  marker-width: @rdz14_turning_circle_marker;
  [zoom>=15]  { marker-width: @rdz15_turning_circle_marker; }
  [zoom>=16]  { marker-width: @rdz16_turning_circle_marker; }
  [zoom>=17]  { marker-width: @rdz17_turning_circle_marker; }
  [zoom>=18] { marker-width: @rdz18_turning_circle_marker; }
}

// ==================================================================
// AEROWAYS
// ==================================================================

#aeroway[zoom>=11] {
  line-color: @aeroway;
  //[type='runway'] { //default for runway
    line-width: 2;
    [zoom>=12] { line-width: 3; }
    [zoom>=13] { line-width: 5; }
    [zoom>=14] { line-width: 7; }
    [zoom>=15] { line-width: 11; }
    [zoom>=16] { line-width: 15; }
    [zoom>=17] { line-width: 19; }
    [zoom>=18] { line-width: 23; }
  //}
  [type='taxiway'] {
    line-width: 0.2;
    [zoom>=13] { line-width: 1; }
    [zoom>=14] { line-width: 1.5; }
    [zoom>=15] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
    [zoom>=17] { line-width: 4; }
    [zoom>=18] { line-width: 5; }
  }
}

// ==================================================================
// BICYCLE ROUTES
// ==================================================================

#bicycle_routes_gen0[zoom >= 2] {
  opacity: 0.75;

  line-color: @icn-overlay;
  [route='mtb'] {
    line-color: @mtb-overlay;
  }

  line-width: 1;
}
#bicycle_routes_gen1[zoom >= 5] {
  opacity: 0.75;
  line-color: @icn-overlay;
  line-width: 1;

  [type='ncn'] {
    line-color: @ncn-overlay;
    [zoom >= 5] { line-width: 0.5; }
    [zoom >= 7] { line-width: 1; }
  }
  [route='mtb'] {
    line-color: @mtb-overlay;
  }

  [state='proposed'] {
    line-dasharray: 6,6;
  }
}
#bicycle_routes_gen2[zoom >= 8] {
  opacity: 0.6;
  line-color: @icn-overlay;
  [type='ncn'] {
    line-color: @ncn-overlay;
  }
  [type='rcn'] {
    line-color: @rcn-overlay;
  }
  [route='mtb'] {
    line-color: @mtb-overlay;
  }

  [state='proposed'] {
    line-dasharray: 6,6;
  }

  line-width: 1;
  [zoom >= 9] { line-width: 1.5; }
  [zoom >= 10] { line-width: 2; }
}

#bicycle_routes_bicycle_gen3[zoom >= 11] {
  opacity: 0.25;
  line-color: @lcn-overlay;
  [type='icn'] {
    line-color: @icn-overlay;
  }
  [type='ncn'] {
    line-color: @ncn-overlay;
  }
  [type='rcn'] {
    line-color: @rcn-overlay;
  }

  [state='proposed'] {
    line-dasharray: 6,6;
  }

  line-width: 3;
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
#bicycle_routes_mtb_gen3[zoom >= 11] {
  opacity: 0.5;
  line-color: @mtb-overlay;

  [state='proposed'] {
    line-dasharray: 6,6;
  }

  line-width: 3;
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

/**/
