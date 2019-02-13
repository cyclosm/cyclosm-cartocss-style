/* LABELS.MSS CONTENTS:
 * - area labels
 * - waterway labels
 */

/* Font sets are defined in palette.mss */

// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=10][area>102400000],
  [zoom>=11][area>25600000],
  [zoom>=13][area>1600000],
  [zoom>=14][area>320000],
  [zoom>=15][area>80000],
  [zoom>=16][area>20000],
  [zoom>=17][area>5000],
  [zoom>=18][area>=0] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=10] {
      text-face-name: @sans_italic;
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10%);
    }
    [type='golf_course'][zoom>=10] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10%);
    }
    [type='cemetery'][zoom>=10] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10%);
    }
    [type='university'][zoom>=10] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10%);
    }
    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10%);
    }
  }
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
  [highway = 'trunk'][zoom >= 11],
  [highway = 'primary'][zoom >= 11],
  [highway = 'secondary'][zoom >= 12] {
    shield-name: "[refs]";
    shield-size: @shield-size;
    shield-line-spacing: @shield-line-spacing;
    shield-placement: line;
    shield-spacing: @shield-spacing;
    shield-repeat-distance: @shield-repeat-distance;
    shield-margin: @shield-margin;
    shield-face-name: @sans;
    shield-clip: @shield-clip;

    [highway = 'motorway'] {
      shield-fill: @motorway-shield-fill;
      shield-file: url("symbols/shields/motorway_[width]x[height].svg");
    }

    [highway = 'trunk'] {
      shield-fill: @trunk-shield-fill;
      shield-file: url("symbols/shields/trunk_[width]x[height].svg");
    }

    [highway = 'primary'] {
      shield-fill: @primary-shield-fill;
      shield-file: url("symbols/shields/primary_[width]x[height].svg");
    }

    [highway = 'secondary'] {
      shield-fill: @secondary-shield-fill;
      shield-file: url("symbols/shields/secondary_[width]x[height].svg");
    }
  }
}

#roads-text-ref {
  [highway = 'motorway'],
  [highway = 'trunk'],
  [highway = 'primary'],
  [highway = 'secondary'],
  [highway = 'tertiary'] {
    [zoom >= 13] {
      shield-name: "[refs]";
      shield-size: @shield-size;
      shield-line-spacing: @shield-line-spacing;

      [zoom >= 16] {
        shield-size: @shield-size-z16;
        shield-line-spacing: @shield-line-spacing-z16;
      }
      [zoom >= 18] {
        shield-size: @shield-size-z18;
        shield-line-spacing: @shield-line-spacing-z18;
      }

      shield-placement: line;
      shield-spacing: @shield-spacing;
      shield-repeat-distance: @shield-repeat-distance;
      shield-margin: @shield-margin;
      shield-face-name: @sans;
      shield-clip: @shield-clip;

      [highway = 'motorway'] {
        shield-fill: @motorway-shield-fill;
        shield-file: url("symbols/shields/motorway_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/motorway_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/motorway_[width]x[height]_z18.svg");
        }
      }
      [highway = 'trunk'] {
        shield-fill: @trunk-shield-fill;
        shield-file: url("symbols/shields/trunk_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/trunk_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/trunk_[width]x[height]_z18.svg");
        }
      }
      [highway = 'primary'] {
        shield-fill: @primary-shield-fill;
        shield-file: url("symbols/shields/primary_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/primary_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/primary_[width]x[height]_z18.svg");
        }
      }
      [highway = 'secondary'] {
        shield-fill: @secondary-shield-fill;
        shield-file: url("symbols/shields/secondary_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/secondary_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/secondary_[width]x[height]_z18.svg");
        }
      }
      [highway = 'tertiary'] {
        shield-fill: @tertiary-shield-fill;
        shield-file: url("symbols/shields/tertiary_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/tertiary_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/tertiary_[width]x[height]_z18.svg");
        }
      }
    }
  }

  [highway = 'unclassified'],
  [highway = 'residential'] {
    [zoom >= 15] {
      text-name: "[refs]";
      text-size: 8;

      [zoom >= 16] {
        text-size: 9;
      }
      [zoom >= 18] {
        text-size: 10;
      }

      text-fill: @road_text;
      text-face-name: @sans;
      text-placement: line;
      text-repeat-distance: @major-highway-text-repeat-distance;
      text-halo-radius: 2;
      text-halo-fill: @road_halo;
      text-spacing: 760;
      text-clip: false;
    }
  }

  [highway = 'track'] {
    [zoom >= 15] {
      text-name: "[refs]";
      text-size: 8;
      text-dy: 5;

      [zoom >= 16] {
        text-size: 9;
        text-dy: 7;
      }
      [zoom >= 17] {
        text-size: 11;
        text-dy: 9;
      }

      text-clip: false;
      text-fill: #222;
      text-face-name: @sans;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @road_halo;
      text-margin: 10;
      text-placement: line;
      text-spacing: 760;
      text-repeat-distance: @major-highway-text-repeat-distance;
      text-vertical-alignment: middle;
    }
  }
}

#roads-text-name {
  [highway = 'motorway'],
  [highway = 'trunk'],
  [highway = 'primary'],
  [highway = 'construction'][construction = 'motorway'],
  [highway = 'construction'][construction = 'trunk'],
  [highway = 'construction'][construction = 'primary'] {
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
        [highway = 'motorway'] { text-halo-fill: @road_halo; }
        [highway = 'trunk'] { text-halo-fill: @road_halo; }
        [highway = 'primary'] { text-halo-fill: @road_halo; }
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
  [highway = 'secondary'],
  [highway = 'construction'][construction = 'secondary'] {
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
  [highway = 'tertiary'],
  [highway = 'construction'][construction = 'tertiary'] {
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
  [highway = 'construction'][construction = null][zoom >= 16] {
    text-name: "[name]";
    text-size: 9;
    text-fill: @road_text;
    text-spacing: 300;
    text-clip: false;
    text-placement: line;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @road_halo;
    text-face-name: @sans;
    text-repeat-distance: @major-highway-text-repeat-distance;

    [zoom >= 17] {
      text-size: 11;
      text-spacing: 400;
    }
    [zoom >= 19] {
      text-size: 12;
      text-spacing: 400;
    }
  }
  [highway = 'residential'],
  [highway = 'unclassified'],
  [highway = 'road'],
  [highway = 'construction'][construction = null],
  [highway = 'construction'][construction = 'residential'],
  [highway = 'construction'][construction = 'unclassified'],
  [highway = 'construction'][construction = 'road'] {
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

  [highway = 'raceway'],
  [highway = 'service'],
  [highway = 'construction'][construction = 'raceway'],
  [highway = 'construction'][construction = 'service'][zoom >= 17] {
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
  [highway = 'pedestrian'],
  [highway = 'construction'][construction = 'living_street'][zoom >= 16],
  [highway = 'construction'][construction = 'pedestrian'][zoom >= 16] {
    [zoom >= 16] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @road_text;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      [highway = 'living_street'] {
        text-halo-fill: @road_halo;
        text-repeat-distance: @major-highway-text-repeat-distance;
      }
      [highway = 'pedestrian'] { text-halo-fill: @road_halo; }
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

#paths-text-name {
  [highway = 'track'],
  [highway = 'construction'][construction = 'track'][zoom >= 16] {
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
  [highway = 'steps'],
  [highway = 'construction'][construction = 'bridleway'],
  [highway = 'construction'][construction = 'footway'],
  [highway = 'construction'][construction = 'cycleway'],
  [highway = 'construction'][construction = 'path'],
  [highway = 'construction'][construction = 'steps'] {
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
      [highway = 'steps'] { text-repeat-distance: @minor-highway-text-repeat-distance; }
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
#roads-text-name[highway != 'construction'][zoom>=15] {
  [oneway = 'yes'][oneway_bicycle = 'yes'],
  [oneway='-1'][oneway_bicycle = 'yes'] {
     marker-placement:line;
     marker-max-error: 0.5;
     marker-spacing: 100;
     marker-fill: #252525;
     marker-file: url(symbols/oneway.svg);
     [oneway='-1'] { marker-file: url(symbols/oneway-reverse.svg); }
     [zoom=15] {
        marker-transform: "scale(0.75)";
        marker-spacing: 80;
     }
  }
  [oneway = 'yes'][oneway_bicycle = 'no'],
  [oneway='-1'][oneway_bicycle = 'no'] {
     bike/marker-placement:line;
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


/* ================================================================== */
/* TRAIN STATIONS
/* ================================================================== */

#train_stations[zoom>15]{
  point-file:url('symbols/rail-12.png');
  [zoom>=17] { point-file:url('symbols/rail-18.png'); }
}


/* ================================================================== */
/* BICYCLE ROUTES
/* ================================================================== */

#bicycle_routes_labels[type='icn'][zoom >= 9][width <= 8],
#bicycle_routes_labels[type='ncn'][zoom >= 10][width <= 8],
#bicycle_routes_labels[type='rcn'][zoom >= 11][width <= 8],
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
  [route='bicycle'][type='icn'] {
    shield-fill: @icn-shield-fill;
  }
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

/* ****************************************************************** */
