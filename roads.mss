/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom>=5][zoom<=8] {
  [type='motorway'] { line-color: @motorway_line; }
  [type='trunk'] { line-color: @trunk_line; }
  [zoom=5] {
    [type='motorway'] { line-width: 0.4; }
    [type='trunk'] { line-width: 0.2; } }
  [zoom=6] {
    [type='motorway'] { line-width: 0.5; }
    [type='trunk'] { line-width: 0.25; } }
  [zoom=7] {
    [type='motorway'] { line-width: 0.6; }
    [type='trunk'] { line-width: 0.3; } }
  [zoom=8] {
    [type='motorway'] { line-width: 1; }
    [type='trunk'] { line-width: 0.5; } }
}

/* At mid-level scales start to show primary and secondary routes
as well. */

#roads_med[zoom>=9][zoom<=10] {
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; }
  [type='secondary'] { line-color: @secondary_line; }
  [type='tertiary'] { line-color: @standard_line; }
  [zoom=9] {
    [type='motorway'],[type='trunk'] { line-width: 1.4; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.6; }
  }
  [zoom=10] {
    [type='motorway'],[type='trunk'] { line-width: 1.8; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.8; }
  }
}

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */
@rdz11_maj: 1.6; @rdz11_med: 0.8; @rdz11_min: 0.4;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 4;   @rdz14_med: 2.5; @rdz14_min: 1.6;
@rdz15_maj: 6;   @rdz15_med: 4;   @rdz15_min: 2;
@rdz16_maj: 8;   @rdz16_med: 6;   @rdz16_min: 4;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;

/* ---- Casing ----------------------------------------------- */

#roads_high::outline[zoom>=11][zoom<=20],
#tunnel[render='1_outline'][zoom>=11][zoom<=20],
#bridge[render='1_outline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-cap: round;
  [bridge=1],
  [tunnel=1] {
    line-cap: butt;
  }
  line-join: round;
  line-color: @standard_case;
  [bridge=1] { line-color: @standard_case * 0.8; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case * 0.8; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case * 0.8; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case * 0.8; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [cycleway='lane'],
  [cycleway='opposite_lane'] {
    line-color: @cycle_lane_case;
  }
  [cycleway='track'],
  [cycleway='opposite_track'] {
    line-color: @cycle_track_case;
    line-dasharray: 3,3;
    line-cap: butt;
  }
  [cycleway='share_busway'],
  [cycleway='opposite_share_busway'] {
    line-color: @cycle_busway_case;
  }
  [stylegroup='railway'] {
    line-color: fadeout(@land,50%);
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [tunnel=1] { line-dasharray: 3,3; }        
  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz11_med + 1.6; }
    [stylegroup='minorroad']{ line-width: @rdz11_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz12_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz12_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz13_min + 2; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz14_min + 2; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + 2; }
    [stylegroup='service']  { line-width: @rdz15_min / 3 + 2; }
    [stylegroup='pedestrian']   { line-width: @rdz15_min / 4 + 2; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 1.5 + 2; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 2.5; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + 2; }
    [stylegroup='service']  { line-width: @rdz16_min / 3 + 2; }
    [stylegroup='pedestrian']   { line-width: @rdz16_min / 4 + 2; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 2 + 2; }
  }
  [zoom>=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + 3; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 2.5; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + 2; }
    [stylegroup='service']  { line-width: @rdz17_min / 3 + 2; }
    [stylegroup='pedestrian']   { line-width: @rdz17_min / 4 + 2; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 3 + 4; } // 3 + 4
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + 4; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 4; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + 3.5; }
    [stylegroup='service']  { line-width: @rdz18_min / 3 + 3.5; }
    [stylegroup='pedestrian']   { line-width: @rdz18_min / 4 + 2; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 4 + 6; }
  }
}

#roads_high::outline_right[zoom>=11][zoom<=20][cycleway_right='lane'],
#roads_high::outline_right[zoom>=11][zoom<=20][cycleway_right='opposite_lane'],
#roads_high::outline_right[zoom>=11][zoom<=20][cycleway_right='track'],
#roads_high::outline_right[zoom>=11][zoom<=20][cycleway_right='opposite_track'],
#roads_high::outline_right[zoom>=11][zoom<=20][cycleway_right='share_busway'],
#roads_high::outline_right[zoom>=11][zoom<=20][cycleway_right='opposite_share_busway'] {
  /* -- colors & styles -- */
  line-cap: round;
  line-join: round;

  [cycleway_right='lane'],
  [cycleway_right='opposite_lane'] {
    line-color: @cycle_lane_case;
  }
  [cycleway_right='track'],
  [cycleway_right='opposite_track'] {
    line-color: @cycle_track_case;
    line-dasharray: 3,3;
    line-cap: butt;
  }
  [cycleway_right='share_busway'],
  [cycleway_right='opposite_share_busway'] {
    line-color: @cycle_busway_case;
  }

  /* widths */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + 1; line-offset: 1; }
    [stylegroup='mainroad'] { line-width: @rdz11_med + 0.8; line-offset: 0.8; }
    [stylegroup='minorroad']{ line-width: @rdz11_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + 1; line-offset: 1; }
    [stylegroup='mainroad'] { line-width: @rdz12_med + 1; line-offset: 1; }
    [stylegroup='minorroad']{ line-width: @rdz12_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + 1; line-offset: 1; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + 1; line-offset: 1; }
    [stylegroup='minorroad']{ line-width: @rdz13_min + 1; line-offset: 1; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj + 1; line-offset: 1; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + 1; line-offset: 1; }
    [stylegroup='minorroad']{ line-width: @rdz14_min + 1; line-offset: 1; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + 1.25; line-offset: 1.25; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + 1; line-offset: 1; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + 1; line-offset: 1; }
    [stylegroup='service']  { line-width: @rdz15_min / 3 + 1; line-offset: 1; }
    [stylegroup='pedestrian']   { line-width: @rdz15_min / 4 + 1; line-offset: 1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 1.5 + 1; line-offset: 1; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + 1.25; line-offset: 1.25; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 1.25; line-offset: 1.25; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + 1; line-offset: 1; }
    [stylegroup='service']  { line-width: @rdz16_min / 3 + 1; line-offset: 1; }
    [stylegroup='pedestrian']   { line-width: @rdz16_min / 4 + 1; line-offset: 1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 2 + 1;  line-offset: 1; }
  }
  [zoom>=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + 1.5; line-offset: 1.5; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 1.25; line-offset: 1.25; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + 1; line-offset: 1; }
    [stylegroup='service']  { line-width: @rdz17_min / 3 + 1; line-offset: 1; }
    [stylegroup='pedestrian']   { line-width: @rdz17_min / 4 + 1; line-offset: 1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 3 + 2; line-offset: 2; } // 3 + 2
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + 2; line-offset: 2; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 2; line-offset: 2; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + 1.75; line-offset: 1.75; }
    [stylegroup='service']  { line-width: @rdz18_min / 3 + 1.75; line-offset: 1.75; }
    [stylegroup='pedestrian']   { line-width: @rdz18_min / 4 + 1; line-offset: 1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 4 + 3; line-offset: 3; }
  }
}

#roads_high::outline_left[zoom>=11][zoom<=20][cycleway_left='lane'],
#roads_high::outline_left[zoom>=11][zoom<=20][cycleway_left='opposite_lane'],
#roads_high::outline_left[zoom>=11][zoom<=20][cycleway_left='track'],
#roads_high::outline_left[zoom>=11][zoom<=20][cycleway_left='opposite_track'],
#roads_high::outline_left[zoom>=11][zoom<=20][cycleway_left='share_busway'],
#roads_high::outline_left[zoom>=11][zoom<=20][cycleway_left='opposite_share_busway'] {
  /* -- colors & styles -- */
  line-cap: round;
  line-join: round;

  [cycleway_left='lane'],
  [cycleway_left='opposite_lane'] {
    line-color: @cycle_lane_case;
  }
  [cycleway_left='track'],
  [cycleway_left='opposite_track'] {
    line-color: @cycle_track_case;
    line-dasharray: 3,3;
    line-cap: butt;
  }
  [cycleway_left='share_busway'],
  [cycleway_left='opposite_share_busway'] {
    line-color: @cycle_busway_case;
  }

  /* widths */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + 1; line-offset: -1; }
    [stylegroup='mainroad'] { line-width: @rdz11_med + 0.8; line-offset: -0.8; }
    [stylegroup='minorroad']{ line-width: @rdz11_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + 1; line-offset: -1; }
    [stylegroup='mainroad'] { line-width: @rdz12_med + 1; line-offset: -1; }
    [stylegroup='minorroad']{ line-width: @rdz12_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + 1; line-offset: -1; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + 1; line-offset: -1; }
    [stylegroup='minorroad']{ line-width: @rdz13_min + 1; line-offset: -1; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj + 1; line-offset: -1; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + 1; line-offset: -1; }
    [stylegroup='minorroad']{ line-width: @rdz14_min + 1; line-offset: -1; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='pedestrian']   { line-width: 0; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + 1.25; line-offset: -1.25; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + 1; line-offset: -1; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + 1; line-offset: -1; }
    [stylegroup='service']  { line-width: @rdz15_min / 3 + 1; line-offset: -1; }
    [stylegroup='pedestrian']   { line-width: @rdz15_min / 4 + 1; line-offset: -1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 1.5 + 1; line-offset: -1; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + 1.25; line-offset: -1.25; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 1.25; line-offset: -1.25; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + 1; line-offset: -1; }
    [stylegroup='service']  { line-width: @rdz16_min / 3 + 1; line-offset: -1; }
    [stylegroup='pedestrian']   { line-width: @rdz16_min / 4 + 1; line-offset: -1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 2 + 1;  line-offset: -1; }
  }
  [zoom>=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + 1.5; line-offset: -1.5; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 1.25; line-offset: -1.25; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + 1; line-offset: -1; }
    [stylegroup='service']  { line-width: @rdz17_min / 3 + 1; line-offset: -1; }
    [stylegroup='pedestrian']   { line-width: @rdz17_min / 4 + 1; line-offset: -1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 3 + 2; line-offset: -2; } // 3 + 2
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + 2; line-offset: -2; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 2; line-offset: -2; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + 1.75; line-offset: -1.75; }
    [stylegroup='service']  { line-width: @rdz18_min / 3 + 1.75; line-offset: -1.75; }
    [stylegroup='pedestrian']   { line-width: @rdz18_min / 4 + 1; line-offset: -1; }
    [stylegroup='cycle']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 4 + 3; line-offset: -3; }
  }
}


#roads_high[zoom>=11][zoom<=20],
#tunnel[render='3_inline'][zoom>=11][zoom<=20],
#bridge[render='3_inline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-color: @standard_fill;
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    [tunnel=1] { line-color: lighten(@motorway_fill, 10%); }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { line-color: lighten(@trunk_fill, 10%); }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { line-color: lighten(@primary_fill, 10%); }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    [tunnel=1] { line-color: lighten(@secondary_fill, 10%); }
  }
  [stylegroup='railway'] {
    line-color: @rail_line;
    line-dasharray: 1,1;
    [type='subway'] { line-opacity: 0.67; }
    [zoom>15] { line-dasharray: 1,2; } 
  }
  [stylegroup='cycle'] {
    line-color: @cycle_fill;
    line-width: 0;
  }
  [stylegroup='pedestrian'] {
    line-color: @pedestrian_fill;
    line-width: 0;
  }
  [stylegroup='service'],
  [stylegroup='minorroad'] {
    line-width: 0;
  }
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='pedestrian'] {
    line-join: round;
  }
  [stylegroup='cycle'] {
    line-join: round;
  }
  [tunnel=1] {
    line-cap: butt;
  }
  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj; }
    [stylegroup='mainroad'] { line-width: @rdz11_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: 0.2; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj; }
    [stylegroup='mainroad'] { line-width: @rdz12_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: 0.4; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='mainroad'] { line-width: @rdz13_med; }
    [stylegroup='minorroad']{ line-width: @rdz13_min; }
    [stylegroup='service']  { line-width: @rdz13_min / 3; }
    [stylegroup='pedestrian']   { line-width: @rdz13_min / 4; line-dasharray: 1,1; }
    [stylegroup='cycle']   { line-width: @rdz13_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: 0.8; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: @rdz14_med; }
    [stylegroup='minorroad']{ line-width: @rdz14_min; }
    [stylegroup='service']  { line-width: @rdz14_min / 3; }
    [stylegroup='pedestrian']   { line-width: @rdz14_min / 4; line-dasharray: 1,1; }
    [stylegroup='cycle']   { line-width: @rdz14_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: 1; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']  { line-width: @rdz15_min / 3; }
    [stylegroup='pedestrian']   { line-width: @rdz15_min / 4; line-dasharray: 1,1; }
    [stylegroup='cycle']   { line-width: @rdz15_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: 1.5; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='service']  { line-width: @rdz16_min / 3; }
    [stylegroup='pedestrian']   { line-width: @rdz16_min / 4; line-dasharray: 2,1; }
    [stylegroup='cycle']   { line-width: @rdz16_min / 4; line-dasharray: 2,1; }
    [stylegroup='railway']  { line-width: 2; }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj; }
    [stylegroup='mainroad'] { line-width: @rdz17_med; }
    [stylegroup='minorroad']{ line-width: @rdz17_min; }
    [stylegroup='service']  { line-width: @rdz17_min / 3; }
    [stylegroup='pedestrian']   { line-width: @rdz17_min / 4; line-dasharray: 2,2; }
    [stylegroup='cycle']   { line-width: @rdz17_min / 4; line-dasharray: 2,2; }
    [stylegroup='railway']  { line-width: 3; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj; }
    [stylegroup='mainroad'] { line-width: @rdz18_med; }
    [stylegroup='minorroad']{ line-width: @rdz18_min; }
    [stylegroup='service']  { line-width: @rdz18_min / 2; }
    [stylegroup='pedestrian']   { line-width: @rdz18_min / 4; line-dasharray: 3,3; }
    [stylegroup='cycle']   { line-width: @rdz18_min / 4; line-dasharray: 3,3; }
    [stylegroup='railway']  { line-width: 4; }
  }
}

/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'][zoom>=14][zoom<=20],
#bridge[render='2_line'][zoom>=14][zoom<=20]{
  /* -- colors & styles -- */
  [stylegroup='pedestrian'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='cycle'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @land;
    line-join: round;
  }
  /* -- widths -- */
  [zoom=14] {
    [stylegroup='pedestrian']   { line-width: @rdz14_min / 4 + 1; }
    [stylegroup='cycle']   { line-width: @rdz14_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1 + 1; }
  }
  [zoom=15] {
    [stylegroup='pedestrian']   { line-width: @rdz15_min / 4 + 1; }
    [stylegroup='cycle']   { line-width: @rdz15_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1.5 + 1; }
  }
  [zoom=16] {
    [stylegroup='pedestrian']   { line-width: @rdz16_min / 4 + 1; }
    [stylegroup='cycle']   { line-width: @rdz16_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 2 + 1; }
  }
  [zoom=17] {
    [stylegroup='pedestrian']   { line-width: @rdz17_min / 4 + 3; }
    [stylegroup='cycle']   { line-width: @rdz17_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 3 + 2; }
  }
  [zoom>=18] {
    [stylegroup='pedestrian']   { line-width: @rdz18_min / 4 + 3; }
    [stylegroup='cycle']   { line-width: @rdz18_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 4 + 3; }
  }
}

/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom=14] { marker-width:@rdz14_min * 1.1; }
  [zoom=15] { marker-width:@rdz15_min * 1.1; }
  [zoom=16] { marker-width:@rdz16_min * 1.1; }
  [zoom=17] { marker-width:@rdz17_min * 1.1; }
  [zoom>=18] { marker-width:@rdz18_min * 1.1; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'] {
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:2; }
    [zoom=16]{ line-width:3; }
    [zoom=17]{ line-width:4; }
    [zoom>17]{ line-width:5; }
  }
}

/* ================================================================== */
/* BICYCLE ROUTES
/* ================================================================== */
#bicycle_routes {
  line-width: 10;
  line-opacity: 0.4;

  [type='icn'] {
    line-color: @icn_overlay;
  }
  [type='ncn'] {
    line-color: @ncn_overlay;
  }
  [type='rcn'] {
    line-color: @rcn_overlay;
  }
  [type='lcn'] {
    line-color: @lcn_overlay;
  }
}

/******************************************************************* */
