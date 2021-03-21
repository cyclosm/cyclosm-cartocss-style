/* LABELS.MSS CONTENTS:
 * - Area labels
 * - Waterway labels
 * - Bicycle route labels
 */

/* Font sets are defined in palette.mss */

// =====================================================================
// AREA LABELS
// =====================================================================

#highway_area_label,
#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom=10][area>102400000],
  [zoom=11][area>51200000],
  [zoom=12][area>25600000],
  [zoom=13][area>1280000][area<256000000],
  [zoom=14][area>320000] [area<64000000],
  [zoom=15][area>80000]  [area<16000000],
  [zoom=16][area>20000]  [area<4000000],
  [zoom=17][area>5000]   [area<100000],
  [zoom>=18]             [area<25000] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width: 30;
    text-fill: #888;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;

    // Specific style overrides for different types of areas:
    [type='forest'],
    [type='wood'],
    [type='grass'],
    [type='common'],
    [type='park'] {
      text-face-name: @sans_italic;
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10%);
    }
    [type='golf_course'] {
      text-fill: @grass * 0.6;
      text-halo-fill: lighten(@grass, 10%);
    }
    [type='cemetery'] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10%);
    }
    [type='university'] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10%);
    }
    [type='basin'],
    [type='water'] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10%);
    }
    [type='marina'] {
      text-fill: @water * 0.5;
      text-halo-fill: lighten(@water, 10%);
      text-face-name: @sans_italic;
    }
    [type='national_park'],
    [type='aboriginal_lands'],
    [type='protected_area'],
    [type='nature_reserve'] {
      text-face-name: @sans_italic;
      text-fill: @nature_reserve;
    }
    [type='military'] {
      text-fill: @military * 0.6;
      text-face-name: @sans_italic;
    }
    [type='retail'] {
      text-fill: @shop-text;
      text-face-name: @sans_italic;
    }

    // text size adjustement regarding area size:
    [zoom=15][area>1600000],
    [zoom=16][area>80000],
    [zoom=17][area>20000],
    [zoom=18][area>5000] {
        text-name: "[name]";
        text-size: 13;
        text-wrap-width: 60;
        text-character-spacing: 1;
        text-halo-radius: 2;
    }
    [zoom=16][area>1600000],
    [zoom=17][area>80000],
    [zoom=18][area>20000] {
        text-size: 15;
        text-character-spacing: 2;
        text-wrap-width: 120;
    }
    [zoom>=17][area>1600000],
    [zoom>=18][area>80000] {
        text-size: 20;
        text-character-spacing: 3;
        text-wrap-width: 180;
    }
  }
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom=18] {
    text-size: 14;
    text-spacing: 300;
  }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#roads-text-ref-low-zoom[zoom < 13] {
  [highway = 'motorway'][zoom >= 10],
  [highway = 'trunk'][zoom >= 10],
  [highway = 'primary'][zoom >= 11],
  [highway = 'secondary'][zoom >= 12] {
    text-name: "[refs]";
    text-size: 7;
    text-fill: @road_text;
    text-spacing: 600;
    text-clip: false;
    text-placement: line;
    text-face-name: @sans;
    text-repeat-distance: @major-highway-text-repeat-distance;
    text-halo-radius: @standard-halo-radius;
  }
}

#roads-text-ref {
  [highway = 'motorway'],
  [highway = 'trunk'],
  [highway = 'primary'],
  [highway = 'secondary'],
  [highway = 'tertiary'] {
    [zoom >= 13] {
      text-name: "[refs]";
      text-size: 8;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @sans;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 14] {
      text-size: 9;
    }
    [zoom >= 15] {
      text-size: 10;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }

  [highway = 'residential'],
  [highway = 'unclassified'],
  [highway = 'service'],
  [highway = 'road'] {
    [zoom >= 16] {
      text-name: "[refs]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-face-name: @sans;
      text-repeat-distance: @minor-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
      text-spacing: 400;
    }
    [zoom >= 19] {
      text-size: 12;
      text-spacing: 400;
    }
  }

  [highway = 'living_street'],
  [highway = 'pedestrian'] {
    [zoom >= 16] {
      text-name: "[refs]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-face-name: @sans;
      text-repeat-distance: @minor-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
}

#roads-text-name {
  [highway = 'motorway'],
  [highway = 'trunk'],
  [highway = 'primary'] {
    [zoom >= 13] {
      text-name: "[name]";
      text-size: 8;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @sans;
      text-repeat-distance: @major-highway-text-repeat-distance;
      [tunnel = 'no'] {
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @road_halo;
      }
    }
    [zoom >= 14] {
      text-size: 9;
    }
    [zoom >= 15] {
      text-size: 10;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
  [highway = 'secondary'] {
    [zoom >= 14] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @sans;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 15] {
      text-size: 10;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
  [highway = 'tertiary'] {
    [zoom >= 14] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @sans;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
  [highway = 'residential'],
  [highway = 'unclassified'],
  [highway = 'road'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-face-name: @sans;
      text-repeat-distance: @minor-highway-text-repeat-distance;
      [highway = 'unclassified'] { text-repeat-distance: @major-highway-text-repeat-distance;}
    }
    [zoom >= 17] {
      text-size: 11;
      text-spacing: 400;
    }
    [zoom >= 19] {
      text-size: 12;
      text-spacing: 400;
    }
  }

  [highway = 'service'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      [highway = 'raceway'] { text-halo-fill: @road_halo; }
      [highway = 'service'] { text-halo-fill: @road_halo; }
      text-face-name: @sans;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
    }
  }

  [highway = 'living_street'],
  [highway = 'pedestrian'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-face-name: @sans;
      text-repeat-distance: @minor-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
}


#roads-text-conditional[zoom >= 20] {
  text-fill: @conditional-text;
  text-size: 9;
  text-halo-radius: @standard-halo-radius;
  text-halo-fill: @road_halo;
  text-spacing: 300;
  text-clip: false;
  text-placement: line;
  text-face-name: @sans;
  text-vertical-alignment: top;
  text-dy: -12;
  text-repeat-distance: @minor-highway-text-repeat-distance;
  text-name: "[conditional]";
}

#paths-text-name {
  [highway = 'track'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-fill: #222;
      text-size: 9;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @sans;
      text-vertical-alignment: middle;
      text-dy: 7;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
      text-dy: 9;
    }
  }

  [highway = 'bridleway'],
  [highway = 'footway'],
  [highway = 'cycleway'],
  [highway = 'path'],
  [highway = 'steps'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-fill: #222;
      text-size: 9;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @sans;
      text-vertical-alignment: middle;
      text-dy: 7;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
      text-dy: 9;
    }
  }
}


/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */
#roads-text-name[highway != 'construction'][zoom>=15],
#paths-text-name[highway != 'construction'][zoom>=15] {
  // One way road for general traffic, NO countraflow for bikes
  [oneway = 'yes'][oneway_bicycle != 'no'],
  [oneway = '-1'][oneway_bicycle != 'no'],
  [highway='path'][oneway_bicycle = 'yes'],
  [highway='path'][oneway_bicycle = '-1'],
  [highway='cycleway'][oneway_bicycle = 'yes'],
  [highway='cycleway'][oneway_bicycle = '-1'],
  [highway='footway'][oneway_bicycle = 'yes'],
  [highway='footway'][oneway_bicycle = '-1'] {
     marker-placement:line;
     marker-max-error: 0.5;
     marker-spacing: 100;
     marker-fill: #777777;
     [highway='cycleway'],
     [highway='path'] {
       marker-fill: #ddf;
     }
     marker-file: url(symbols/oneway.svg);
     [oneway='-1'] {
       marker-file: url(symbols/oneway-reverse.svg);
     }
     [zoom=15] {
        marker-transform: "scale(0.75)";
        marker-spacing: 80;
     }
  }
  // One way road for general traffic, WITH countraflow for bikes
  [oneway = 'yes'][oneway_bicycle = 'no'],
  [oneway = '-1'][oneway_bicycle = 'no'] {
     bike/marker-placement: line;
     bike/marker-max-error: 0.5;
     bike/marker-spacing: 100;
     bike/marker-file: url(symbols/oneway-cycle.svg);
     [oneway='-1'] { bike/marker-file: url(symbols/oneway-cycle-reverse.svg); }
     [zoom=15] {
        bike/marker-transform: "scale(0.75)";
        bike/marker-spacing: 80;
     }
  }
}
/* Render designated roads */
#roads-text-name[highway != 'construction'][zoom>=15] {
  [bicycle='designated'][oneway = 'yes'][oneway_bicycle != 'no'],
  [bicycle='designated'][oneway = '-1'][oneway_bicycle != 'no'] {
     designated/marker-placement: line;
     designated/marker-max-error: 0.5;
     designated/marker-spacing: 50;
     designated/marker-fill: @cycle-fill;
     designated/marker-file: url(symbols/oneway.svg);
     [oneway='-1'] { designated/marker-file: url(symbols/oneway-reverse.svg); }
     [zoom=15] {
        designated/marker-transform: "scale(0.75)";
        designated/marker-spacing: 40;
     }
  }
  [bicycle='designated'][oneway = 'yes'][oneway_bicycle = 'no'],
  [bicycle='designated'][oneway = '-1'][oneway_bicycle = 'no'],
  [bicycle='designated'][oneway != 'yes'][oneway != '-1'][oneway_bicycle != 'yes'][oneway_bicycle != '-1'] {
     designated/marker-placement: line;
     designated/marker-max-error: 0.5;
     designated/marker-spacing: 50;
     designated/marker-fill: @cycle-fill;
     designated/marker-file: url(symbols/oneway-cycle.svg);
     [zoom=15] {
        designated/marker-transform: "scale(0.75)";
        designated/marker-spacing: 40;
     }
  }
}


/* ================================================================== */
/* TRAIN STATIONS
/* ================================================================== */

#train_stations[zoom >= 12]{
  // Train station
  [station=null] {
    marker-file: url('symbols/openstreetmap-carto/square.svg');
    marker-fill: @trainstation-icon;
    marker-placement: interior;
    marker-clip: false;
    marker-width: 6;

    [zoom >= 14] {
      text-name: "[name]";
      text-size: 1.1 * @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @trainstation-text;
      text-dy: 10;
      text-face-name: @sans_bold;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: interior;
    }
    [zoom >= 15] {
      marker-width: 9;
      text-size: 1.3 * @standard-font-size;
    }
  }

  // Subway / light rail
  [station!=null][zoom >= 15] {
    marker-file: url('symbols/openstreetmap-carto/square.svg');
    marker-fill: @trainstation-icon;
    marker-placement: interior;
    marker-clip: false;
    marker-width: 3;

    [zoom >= 16] {
      marker-width: 6;
    }
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @trainstation-text;
      text-dy: 10;
      text-face-name: @sans_bold;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: interior;
    }
  }
}


/* ================================================================== */
/* BICYCLE ROUTES
/* ================================================================== */

#bicycle_routes_labels[type='icn'][zoom >= 8][width <= 8],
#bicycle_routes_labels[type='ncn'][zoom >= 8][width <= 8],
#bicycle_routes_labels[type='rcn'][zoom >= 10][width <= 8],
#bicycle_routes_labels[type='lcn'][zoom >= 12][width <= 8] {
  shield-name: "[ref]";
  shield-size: @shield-size;
  shield-line-spacing: @shield-line-spacing;
  shield-placement: line;
  shield-spacing: @shield-spacing;
  shield-repeat-distance: @shield-repeat-distance;
  shield-margin: @shield-margin;
  shield-face-name: @sans;
  shield-clip: @shield-clip;
  shield-file: url("symbols/shields/[type]_[width]x[height].svg");
  shield-transform: "scale(0.75)";

  shield-fill: @icn-shield-fill;
  [route='bicycle'][type='ncn'] {
    shield-fill: @ncn-shield-fill;
  }
  [route='bicycle'][type='rcn'] {
    shield-fill: @rcn-shield-fill;
  }
  [route='bicycle'][type='lcn'] {
    shield-fill: @lcn-shield-fill;
  }
  [route='mtb'] {
    shield-fill: @mtb-shield-fill;
    shield-file: url("symbols/shields/mtb_[width]x[height].svg");
  }
}

//Route name label
#bicycle_routes_labels[type='icn'][zoom >= 16],
#bicycle_routes_labels[type='ncn'][zoom >= 16],
#bicycle_routes_labels[type='rcn'][zoom >= 16],
#bicycle_routes_labels[type='lcn'][zoom >= 16] {
  text-size: 9;
  text-halo-radius: @standard-halo-radius;
  text-halo-fill: @road_halo;
  text-spacing: 900;
  text-clip: false;
  text-placement: line;
  text-face-name: @sans;
  text-vertical-alignment: top;
  text-dy: 12;
  text-repeat-distance: 900;
  text-name: "[name]";

  text-fill: darken(@icn-overlay, 25%);
  [route='bicycle'][type='ncn'] {
    text-fill: darken(@ncn-overlay, 25%);
  }
  [route='bicycle'][type='rcn'] {
    text-fill: darken(@rcn-overlay, 25%);
  }
  [route='bicycle'][type='lcn'] {
    text-fill: darken(@lcn-overlay, 25%);
  }
  [route='mtb'] {
    text-fill: darken(@mtb-overlay, 25%);
  }
}

#cycle-junction-nodes[zoom >= 13] {
  shield-name: "[ref]";
  shield-size: @shield-size;
  shield-face-name: @sans;
  shield-file: url("symbols/shields/[network]-junction_1x1.svg");
  [zoom = 13] {
    shield-transform: "scale(1.5)";
  }
  [zoom >= 14][zoom <= 15] {
    shield-transform: "scale(1.2)";
  }
  [zoom >= 16] {
    shield-size: @shield-size-z16;
    shield-file: url("symbols/shields/[network]-junction_1x1_z16.svg");
  }
  [network='icn'] {
    shield-fill: @icn-shield-fill;
  }
  [network='ncn'] {
    shield-fill: @ncn-shield-fill;
  }
  [network='rcn'] {
    shield-fill: @rcn-shield-fill;
  }
  [network='lcn'] {
    shield-fill: @lcn-shield-fill;
  }
}

/* ****************************************************************** */
