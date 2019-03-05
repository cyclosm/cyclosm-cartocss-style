CyclOSM
=======

This is a [CartoCSS](https://carto.com/developers/styling/cartocss/) style
designed with cycling in mind.

[![Build Status](https://api.travis-ci.org/cyclosm/cyclosm-cartocss-style.svg?branch=master)](https://travis-ci.org/cyclosm/cyclosm-cartocss-style)

**Note:** This is currently a Work In Progress.

## Features

Render:

* Cycleways track, lanes, cycle-bus lanes
* Motor oneway - two way for bicycle
* Cycle routes (local, regional, national, international)
* Parking for bicycle (or motorcycle parking open to bicycle)
* Steps with bicycle friendly ramp
* Bicycle shop and repair stations
* First aid amenities : shelter, hospital, pharmacy, police station, water, food store
* Travel amenities : camping, hotel, train station, museum, picnic table, peaks...
* Emphasis on low speed roads (<= 30km/h)
* Elevation curves and shading
* Smoothness of the roads
* Traffic calming
* …

A full list of rendered features is available in [the
legend](https://cyclosm.github.io/cyclosm-cartocss-style/legend.html).

## Demonstration

A demonstration of this style for some French areas (Paris, Clermont-Ferrand and Lille, up to zoom level 18) is
available at [https://tiles.phyks.me/](https://tiles.phyks.me/).

## Getting started

Getting started instructions are available in [`INSTALL.md`](INSTALL.md) file.

## Contributing

Some getting started information for contributing is available in
[`CONTRIBUTING.md`](CONTRIBUTING.md) file.


## Licenses

This style is based on the [Mapbox
OSM-Bright](https://github.com/mapbox/osm-bright/commit/f1c8780cd7fe9d707fca693a82fdca38b7a98936)
style, which is licensed under BSD-3-Clause license.

The contours and elevation lines render is based on the very good work and
code available from [OpenTopoMap](https://github.com/der-stefan/OpenTopoMap).

The colors used in the `palette.mss` file are based on the
[Hydda](https://github.com/karlwettin/tilemill-style-hydda/tree/bb27f0a9cad1920e19ae8febd39f6f9328369e6f)
style, licensed under Apache License 2.0.

The icons in `symbols/osm-bright-gl-style` are taken from the [OSM Bright GL
style](https://github.com/openmaptiles/osm-bright-gl-style/tree/327e1b41987893b958e3aae06abc2cc7363dc5aa/icons)
and are licensed under Creative Commons BY 4.0.

The icons in `symbols/openstreetmap-carto` are taken from the
[OpenStreetMap-carto](https://github.com/gravitystorm/openstreetmap-carto)
style and are licensed under CC0 public domain.

The icons in `symbols/osmandapp` are taken from the
[OsmAnd app resources](https://github.com/osmandapp/OsmAnd-resources).
