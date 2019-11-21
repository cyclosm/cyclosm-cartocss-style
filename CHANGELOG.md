Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

* Fill in grey roads without bicycle access, see #236.
* Rework secured bicycle parking icon, see #228.
* More values for ramps in stairs taken into account, see #248.
* `gravel` surface is now considered as ok for trekking bikes, see #242.

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
