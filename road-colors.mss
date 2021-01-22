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

@cycle-fill: #0000ce;
@cycle_lane_case:   @cycle-fill;
@cycle_track_case:  @cycle-fill;
@cycle_busway_case: @cycle-fill;
@mixed-cycle-fill: #0060ff;
@path-fill: #007360;
@footway-fill: #7a5b36;
@footway-tunnel-fill: #dcc3a6;
@footway_area_fill: #f3e5d0;
@bridleway-fill: #741e18;
@icn-overlay: #ff00ff;
@icn-shield-fill: #f6f6f6;
@lcn-overlay: #0000ff;
@lcn-shield-fill: #f6f6f6;
@motorway-trunk-case: #f6f6f6;
@motorway-trunk-cycle-fill: #f4c3c3;
@motorway-trunk-fill: #d4d4d4;
@mtb-overlay: #d15000;
@mtb-shield-fill: #f6f6f6;
@ncn-overlay: #aa00ff;
@ncn-shield-fill: #f6f6f6;
@primary-case: #d8b267;
@primary-fill: #f4dfc3;
@rail-line: #888888;
@rcn-overlay: #5500ff;
@rcn-shield-fill: #f6f6f6;
@secondary-case: #b1bb5d;
@secondary-fill: #f6f8d2;
@standard-case: #888;
@standard-fill: #f6f6f6;
@standard-nobicycle: #d4d4d4;
@tertiary-case: #777;
@pedestrian-case: #bbb;
@pedestrian-fill: @speedWalk-fill;
@pedestrian_area_fill:   #dce3e0;
@speed32-fill: #aff1f1;
@speed20-fill: #bbffba;
@speedWalk-fill: #ddffba;
@nomotor-fill: #62ff96;
@track-fill: #114021;
@track-light1: lighten(@track-fill, 30%);
@track-light2: lighten(@track-fill, 50);

@bridge_case: #666;
@bridge_path_case: @land;

@aeroway: #ddd;

@surfaceDarker1: 10%;
@surfaceLighter1: 20%;
@surfaceDarker2: 20%;
@surfaceLighter2: 30%;
