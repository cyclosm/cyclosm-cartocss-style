Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

* Render more features at low zoom: land, water and hillshades at zoom 3 and 4. See #494.

## v0.4

* Fix an issue with routes with `state=proposed` not rendered. See #438.
* Remove motorways at low zoom level. See #447.
* Thinner cycle routes and easier to distinguish secondaries / railways at
    medium zooms. See #447.
* Make roads more visible at Z11. See #447.
* Render `admin_level=4` (states / regions) with dash from z4 to avoid miximg
    them up with railways. See #447.
* Fix bicycle shop icon size at zooms 14-15.
* Fix a bug in `highway=motorway_link` color, see #453.
* Rework drinking water icon
* Distinguish toilets with drinking water.
* Distinguish access for toilets and drinking water.
* Add subicon at POI for bicycle services (pump, tool, rental/repair/retail).
* Render islands names. See #456.
* Add flood prone text for `flood_prone=yes` highways. See #374.
* Render all available conditionals, concatenated.
* Truncate cycle junction names. See #381.
* Render mountain pass
* Fix render of healthcare and doctors. See #348.
* Render maxspeed on shared path. See #266.
* Render bicycle give way signs. See #420. **This one requires explicit
    activation through localconfig.**
* Render `sidewalk:{left,right,both}:bicycle` as shared cycle tracks.
    See #464.
* Add cycle route name.
* Render parking amenity and servie road parking aisle, drive-through, driveway smaller.
* Add floor/ground slots bicycle parking.
* Render `amenity=community_centre`, see #306.


## v0.3.7

* Rework protected areas borders
* Better railway rendering at low zooms (z8-10)
* Render bicycle routes without network tag as lcn. See #379.
* Treat `bicycle=use_sidepath` roads as not bikable. See #415.
* Fix a bug making some shops not rendered. See #417.
* Render `barrier=jersey_barrier` the same way as block (tagged as point or
    way). See #382.
* Use a denser pattern for cemetaries.
* Render `amenity=bench`. See #377.
* Render cycleway surface quality rounded. See #400.
* Fix bicycle parking icon not being inside a not convex polygon. See #395.
* Reorder POIs to avoid masking a bicycle-related icon behind a pharmacy icon.
    See #360.
* Render `public_transport=platform` + `shelter=yes` as shelter. See #378.
* Render `surface=unpaved` as unknown surface + minor fixes for surfaces.
    See #367.
* Render `leisure=track`. See #412.
* Render footway areas with a brownish tone. See #370.
* Render linear `highway=ford`. See #424.
* Making ferry routes that can carry bikes more blue.
* Render `lcn` routes tagged on ways directly (and not in a relation). See #430.
* Ensure cycleways are always on top of the `z_order` hierarchy, in particular
    with the bonus given to `railway` tags by osm2pgsql. See #432.
* Render `highway=track` as dark green, instead of dark blue.


## v0.3.6

* Add blue arrows on designated roads. See #304.
* Fix missing wind turbines. See #267.
* Fix incorrect overloading of amenities tags, leading to some amenities not
    being shown. See windmills in #267 for instance.
* Render guidepost and map for cyclists. See #341.
* Render unknown surface. See #345.
* Rework blue / cyan / green colors. See #324.
* Fix a bug with dashed road surface being drawn on top of side cycle track.
    See #136.
* Only render `bicycle:conditional` tag on highways. See #371.
* Make sure cycle network nodes are drawn in many situations (overlaps).
    See #287.
* Whole rework of roads layers processing. Generation of Mapnik XML is now
    much faster and resulting XML file is much smaller. See #364.
* Only render bike stations and low priority POIs names from Z18 and above.
    See #359.
* Only render cycle lanes / busways from Z12. See #354.
* Do not render underground buildings.
* Fix a render issue with labels and amenities. See #362.


## v0.3.5

* Only display supermarket labels from Z17 (was from Z16). See #323.
* Add line-cap round for cycleway/path to avoid empty spaces. See #224.
* Fix a bug with area label rendered below line barrier. See #321.
* Render name of farmyards. See #264.
* Render glaciers, scrubs and spring. See #229, #327
* Fix a bug with some protected areas labels not rendered. See #329.
* Render `highway=bridleway|footway` + `bicycle=designated` as a shared path. See #215.
* Render indoor paths in faded color. See #334.
* Render `mtb:scale` and `mtb:scale:imba`. See #336.
* Render railway at low zooms. See #317
* Improve density of city names in countryside at Z10/Z11. See #195.
* Render inner tube vending machine. See #315.
* Darken administrative boundaries to make them easier to see. See #343.
* Render bicycle parking areas. See #322.


## v0.3.4

* Render `amenity=charging_station` designed for bicycles. Fix #290.
* Fix an issue with handling of bicycle node networks, leading to some
    regional routes not being drawn in France. See #297.
* Fix a typo leading to residential roads not being visible at zoom 12.
    See #302.
* Fix noisy cycle routes at low zoom levels by using `ST_Simplify` with lower
    tolerance instead of `ST_SnapToGrid`. See #253.
* Render cinema, theatre, library, casino and change. See #300.
* Fix ferry route rendered over place labels in low zooms. See #313.
* Render administrative boundaries. See #209.
* Properly render national parks. See #37.
* Remove useless `ST_IsValid` check in some layers. See #316.
* Fix ref not rendered for trunk and motorway. See #294.
* Add conditional text along the way for
    bicycle|vehicle|access|motor_vehicle:conditional. See #65.
* Lighten tunnel roads, including cycleways. See #298.


## v0.3.3

* Render `highway=trunk` as bikeable by default, fix #258.
* Fix some missing oneway arrows on cycleways and paths. See #257.
* Fix a bug with `æerialway` layer, rendering it at all zoom levels.
* Fix some SQL queries to ensure the geographic index can be fully used and
    restore performances.
* Fix a bug where `military` areas where not visible when combined with
    `landuse`.
* Hide regional cycling network (part of a node network) at zooms 8 to 10.
    This improves a lot the current render in the Netherlands.
* Give bridges for large roads a border to emphasize the roads overlaps.
* Fix a bug with incorrect two-ways arrows being shown on `highway=footway`.
    See #289.
* Tourism viewpoint labels where still labeled in brown. Fixed, see #263.
* Fix cycleways being hidden by primary roads along a tunnel. See #278.
* Render subway station from z14 instead of Z12, to avoid too much
    stations in large cities. Fix #262.
* Render halt train station, fix #272.
* Draw roads at Z9 / Z10 with better contrast with the background. Fix #255.
* Simpler MTB quality surface scheme, which should be more readable.
* Render new landuses: allotments, natural sand/beach/dune and wetland,
    natural scree/shingle and bare_rock.
* Render access/bicycle=private roads as not bikable (grey). Fix #259.
* Improve bikability check for the render by taking into account `vehicle`
    tag.
* Draw motorroads as not cyclable, fix #291.


## v0.3.2

* Fill in grey roads without bicycle access, see #236.
* Rework secured bicycle parking icon, see #228.
* More values for ramps in stairs taken into account, see #248.
* `gravel` surface is now considered as ok for trekking bikes, see #242.
* Fix an issue where non-latin characters might not be rendered for text
    in bold or italic fonts, see #241.
* Render `man_made=water_tap` + `drinking_water=yes` as a drinking water
    point, see #244.
* Bugfix: fix missing oneway arrow on dedicated cycleway / path / footway,
    see #231.
* Rework some icons, change color to emphasize bicycle POIs (see #169, #207
    and #185).
* Pedestrian areas are now rendered in gray.
* Fix quality surface tag overloading: smoothness > tracktype > surface
    (see #243).
* Render cycleways in tunnel, see #234.
* Fix `z_order` value for bridges, ensure cycleways are always on top of
    the main road on bridges. See #192.
* Building heights (pseudo 3D effect) was badly computed in mod_tile. Moving
    away from this algorithm and simply rendering them as polygons with
    contours now, see #212.
* Render `man_made=monitoring_station` + `monitoring:bicycle=yes`, see #246.
* Fix forest tree icons being rendered on top of buildings. See #223.
* Render `aerialway`. See #256.
* Drop road shields and place the ref of the roads along them. Fix #197.
* Render motorways where cycling is allowed in very pale red. Fix #203.

## v0.3.1

* Some roads with `motor_vehicle=no` were no longer in cyan due to a logical
    error, this is now fixed. See #222.
* Better rendering of cycleways on bridges, to avoid them being drawn below
    the associated highway.
* Make pedestrian streets smaller at high zoom.
* Steps are now rendered the same color as footway.
* Surface is shown from Z14, to have track surfaces at this zoom.
* Traffic lights are now rendered from Z18 instead of Z17.
* Buildings 3D effect is now rendered from Z18 instead of Z17.

## v0.3

* Use a slightly lighter blue color for shared bicycle/motorcycle parkings
    (and avoid using red which was too visible).
* Fix a bug with the text of a bicycle parking with limited access not being
    drawn with the correct opacity.
* Fix cyclestreets not rendered in blue if they had a maxspeed below 30 (bad
    priority of cyclestreet vs maxspeed).
* Handles `cyclestreet` as well as `bicycle_road` the same way.
* Render `cycleway=shared_lane` in the same way as a shared busway. Both are
    third-quality cycle infrastructure.
* Ignore `tunnel=culvert` waterways, #204.
* Render `amenity=bank` and `amenity=atm` at high zoom levels (Z18 / Z19). #149
* Add an icon for fords, see #147.
* Render `shop=sports` even if no bicycle specific tags on it, see #163.
* Fix a bug leading to `oneway:bicycle=no` not being rendered sometimes.
* Fix correct overloading of surface and smoothness (`surface=sett` +
    `smoothness=horrible` for instance).
* Render `amenity=place_of_worship`, see #164.
* Render more landuse like `vineyrad`, `orchard`, `quarry`, etc. Rework the
    cemetery render. See #194 for the full details.
* Distinguish covered bicycle/motorcycle parkings, #166.
* Render `highway=raceway`, see #191.
* Render `surface=paving_stones` as asphalt, good for any kind of bikes. See #214.
* Rework cycle routes render, fix opacity and emphasize them at low zooms. See #160, #182, #201.
* Take into account overloading of access tags to better decide whether a
    road is shared with motor vehicles or not. See #210.
* Render oriented cycleways (`cycleway:left|right:oneway`). See #119.
* Bidirectional cycleways tagged directly on highway are now larger as
    well. See #119.
* Add some casing on bridges to clarify which linear ways (footways,
    cycleways, bridleways and paths) are on top of which other. See #137.
* Render wood and forest tree types. See #92.
* Now uses a semi-transparent layer for hillshading.


## v0.2

* Draw crossings and traffic calming only from Z18 (was Z17 before).
* Lighter farmland color, better distinction between meadows and wood colors.
* Higher contrast for names and minor roads.
* Slightly fade footway and bridleway
* Buildings were semi-transparent, resulting in greenish buildings in wooden
    areas. This is fixed.
* No longer render tunnel waterways.
* Render bicycle routes labels above ferry routes labels.
* Fix incorrect rendering of some area labels (was appearing at one of the
    area point).
* Now rendering `highway=path` with `bicycle=designated` almost as a
    `cycleway` and if there is `segregated=yes`, then as a `cycleway` with a
    footway border.
* Fix for missing oneway arrow on `highway=path` with a `oneway:bicycle=yes`
* Footways/pedestrian/tracks/paths are rendered on top of major highways,
    see https://github.com/cyclosm/cyclosm-cartocss-style/issues/154.


## v0.1

First deployed version on https://www.cyclosm.org/ before the SOTM 2019.
