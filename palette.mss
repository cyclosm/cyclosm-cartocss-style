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

@land:              #e0e0e0;
@water:             #3ebcef;
@grass:             #E6F2C1;
@beach:             #FFEEC7;
@park:              #c2debd;
@cemetery:          #D6DED2;
@wooded:            #C3D9AD;
@agriculture:       #F2E8B6;

@building:          #cfcfcf;
@hospital:          #e0e0e0;
@school:            #e0e0e0;
@sports:            #e0e0e0;


@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #EEE;

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

@pedestrian_area_fill:   #f6f6f6;

@cycle_lane_case:   #0000ff;
@cycle_track_case:  #0000ff;
@cycle_busway_case: #0000ff;

@aeroway:           #ddd;

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

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #555;
@village_halo:      @place_halo;

@placenames: #222;
@placenames-light: #777777;

@standard-halo-radius: 1;
@standard-halo-fill: @other_halo;
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

/* ================================================================== */
/* POIs COLORS
/* ================================================================== */
@bicycle_parking_line: 	#fff;
@bicycle_parking_fill: 	#0000ff;
@motorcycle_parking_line:  #fff;
@motorcycle_parking_fill:  #ff0000;

@natural_volcano: #980000;

@marina-text: #576ddf;
@transportation-icon: #0092da;
@man-made-icon: #666666;
@accommodation-icon: @transportation-icon;
@gastronomy-icon: #C77400;
@amenity-brown: #734a08;
@memorials: @amenity-brown;
@man-made-icon: #666666;
@culture: @amenity-brown;
@health-color: #BF0000;
@religious-icon: #000000;
@public-service: @amenity-brown;
@leisure-green: darken(@park, 60%);
@airtransport: #8461C4;
@landform-color: #d08f55;

/* ****************************************************************** */
