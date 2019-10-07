Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
