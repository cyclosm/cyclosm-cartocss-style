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

@motorway_line:     #f6f6f6;
@motorway_fill:     #c0ccc4;
@motorway_case:     #f6f6f6;

@trunk_line:        #f6f6f6;
@trunk_fill:        #c0ccc4;
@trunk_case:        #f6f6f6;

@primary_line:      #c0ccc4;
@primary_fill:      #f6f6f6;
@primary_case:      #c0ccc4;

@secondary_line:    #c0ccc4;
@secondary_fill:    #f6f6f6;
@secondary_case:    #c0ccc4;

@standard_line:     #f6f6f6;
@standard_fill:     #f6f6f6;
@standard_case:     #f6f6f6;

@pedestrian_line:   @standard_line;
@pedestrian_area_fill:   #f6f6f6;
@pedestrian_fill:   #ff0000;
@pedestrian_case:   @land;


@cycle_lane_case:   #0000ff;
@cycle_track_case:  #0000ff;
@cycle_busway_case: #0000ff;

@cycle_line:        @standard_line;
@cycle_fill:        #0000ff;
@cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

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


/* ================================================================== */
/* AMENITIES COLORS
/* ================================================================== */
@bicycle_parking_line: 	#fff;
@bicycle_parking_fill: 	#0000ff;
@motorcycle_parking_line:  #fff;
@motorcycle_parking_fill:  #ff0000;


/* ================================================================== */
/* BICYCLE ROUTES COLORS
/* ================================================================== */
@icn_overlay: #0b910b;
@ncn_overlay: #ff0000;
@rcn_overlay: #b42dff;
@lcn_overlay: #0000ff;

/* ****************************************************************** */
