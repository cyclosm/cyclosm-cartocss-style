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
@scrub:             #c8d7ab;
@farmland:          #fbf0e3;
@water:             #8ecbeb;
@glacier:           #ddecec;
@religious:         #ded4b2;
@military:          #f55;
@quarry:            #c5c3c3;
@sand:              #f5e9c6;
@bare_ground:       #eee5dc;
@hedge:             #add19e;

@nature_reserve:    #05620e;

@building:          #e4dfdb;
@hospital:          #e0e0e0;
@school:            #e0e0e0;
@sports:            #e0e0e0;
@stadium:           @land * 0.97;
@pitch:             @park * 0.97;
@track:             @park * 0.96;
@bicycle-leisure-track-fill: #bbaeb8;

@residential:       @land * 1.05;
@commercial:        #ded8dd;
@industrial:        @land * 0.96;
@parking:           #EEE;

@power-line: #888;

@admin-boundaries: #888;
@state-boundaries: #333;


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

@conditional-text: #ff2701;

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
@shield-spacing: 900;
@shield-repeat-distance: 700;
@shield-margin: 40;
@shield-face-name: @sans;
@shield-clip: false;
@shield-size-z16: 11;
@shield-line-spacing-z16: -1.65;
@shield-size-z18: 12;
@shield-line-spacing-z18: -1.80;

@major-highway-text-repeat-distance: 300;
@minor-highway-text-repeat-distance: 150;

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
@bicycle_parking_fill: 	#0000ce;
@motorcycle_parking_line:  #fff;
@secured_motorcycle_parking_line: @secured_bicycle_parking_line;
@motorcycle_parking_fill:  #0060ff;

@natural_volcano: #980000;

@bicycle-amenity: #ac39ac;
@bicycle-rental: #006ac3;
@marina-text: #576ddf;
@nobike-transportation-icon: #444444;
@transportation-icon: #0092da;
@transportation-text: #0066ff;
@trainstation-icon: #555;
@trainstation-text: #555;
@accommodation-icon: #004b00;
@accommodation-text: @accommodation-icon;
@gastronomy-icon: #666;
@gastronomy-text: darken(@gastronomy-icon, 5%);
@shop-icon: #666;
@shop-text: darken(@shop-icon, 5%);
@amenity-water: #3b029a;
@amenity-common: #666;
@memorials: @amenity-common;
@man-made-icon: #666;
@culture: @amenity-common;
@health-color: #444;
@religious-icon: #333;
@public-service: @amenity-common;
@leisure-green: darken(@park, 60%);
@airtransport: @amenity-common;
@landform-color: #d08f55;

/* ****************************************************************** */
