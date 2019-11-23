/* ****************************************************************** */
/* OSM BRIGHT                                                         */
/*                                                                    */
/* Part of the colors used here are coming from                       */
/* https://github.com/karlwettin/tilemill-style-hydda                 */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

/* The lighten() calls below compensate for the extra opacity from the hillshades. */
@land:              #eee5dc;
@grass:             #c2debd;
@meadow:            #e2eecb;
@park:              #c2debd;
@cemetery:          #D6DED2;
@wooded:            #95bd84;
@heath:             #b2c068;
@farmland:          #fbf0e3;
@water:             #8ecbeb;
@religious:         #ded4b2;
@military:          #f55;
@quarry:            #c5c3c3;

@nature_reserve:    #05620e;

@building:          #e4dfdb;
@hospital:          #e0e0e0;
@school:            #e0e0e0;
@sports:            #e0e0e0;
@stadium:           @land * 0.97;
@pitch:             @park * 0.97;
@track:             @park * 0.96;

@residential:       @land * 1.05;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #EEE;

@power-line: #888;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@pedestrian_area_fill:   #dce3e0;

@cycle_lane_case:   #0000ff;
@cycle_track_case:  #0000ff;
@cycle_busway_case: #0000ff;

@aeroway:           #ddd;

@surfaceDarker1: 10%;
@surfaceLighter1: 20%;
@surfaceDarker2: 20%;
@surfaceLighter2: 30%;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,34%);

@country_text:      #222;
@country_halo:      @place_halo;

@state_text:        #222;
@state_halo:        @place_halo;

@city_text:         #222;
@city_halo:         @place_halo;

@town_text:         #222;
@town_halo:         @place_halo;

@poi_text:          #666;

@road_text:         #222;
@road_halo:         #fff;

@other_text:        #666;
@other_halo:        @place_halo;

@locality_text:     #aaa;
@locality_halo:     @land;

@ferry-route: #66f;
@ferry-route-text: @ferry-route;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #444;
@village_halo:      @place_halo;

@placenames: #111;
@placenames-light: #444;

@standard-halo-radius: 1;
@standard-halo-fill: rgba(255,255,255,0.6);
@standard-font-size: 10;
@standard-wrap-width: 30;
@standard-line-spacing-size: -1.5;

@shield-size: 10;
@shield-line-spacing: -1.5;
@shield-spacing: 760;
@shield-repeat-distance: 400;
@shield-margin: 40;
@shield-face-name: @sans;
@shield-clip: false;
@shield-size-z16: 11;
@shield-line-spacing-z16: -1.65;
@shield-size-z18: 12;
@shield-line-spacing-z18: -1.80;

@major-highway-text-repeat-distance: 50;
@minor-highway-text-repeat-distance: 10;

@contours-halo-fill: rgba(0, 0, 0, 0.3);
@contours-font-size: 8;
@contours-larger-font-size: 9;
@contours-position-tolerance: 100;
@contours-small-spacing: 200;
@contours-spacing: 800;
@contours-small-min-path-length: 200;
@contours-min-path-length: 300;
@contours-max-char-angle-delta: 10;
@contours-fill: #ffa970;
@contours-stroke: #c45700;

/* ================================================================== */
/* POIs COLORS
/* ================================================================== */
@bicycle_parking_line: 	#fff;
@secured_bicycle_parking_line: #edd502;
@bicycle_parking_fill: 	#0000ff;
@motorcycle_parking_line:  #fff;
@secured_motorcycle_parking_line: @secured_bicycle_parking_line;
@motorcycle_parking_fill:  #0050ff;

@natural_volcano: #980000;

@bicycle-amenity: #006ac3;
@bicycle-rental: #ac39ac;
@marina-text: #576ddf;
@nobike-transportation-icon: #444444;
@transportation-icon: #0092da;
@transportation-text: #0066ff;
@trainstation-icon: #555;
@trainstation-text: #555;
@man-made-icon: #666666;
@accommodation-icon: #004b00;
@accommodation-text: @accommodation-icon;
@gastronomy-icon: #a27834;
@gastronomy-text: darken(@gastronomy-icon, 5%);
@amenity-water: #007ae2;
@amenity-brown: #734a08;
@memorials: @amenity-brown;
@man-made-icon: #666666;
@culture: @amenity-brown;
@health-color: #444444;
@religious-icon: #000000;
@shop-icon: #bd5400;
@shop-text: darken(@shop-icon, 5%);
@public-service: @amenity-brown;
@leisure-green: darken(@park, 60%);
@airtransport: #8461C4;
@landform-color: #d08f55;

/* ****************************************************************** */
