Getting started
===============

This document describes how to manually configure your system for running
CyclOSM.

## Requirements

You will need, to use this style:

* PostgreSQL
* PostGIS
* osm2pgsql

On Ubuntu/Debian, these can be installed with

```
sudo apt-get install postgresql-9.6 postgis osm2pgsql
```

## OpenStreetMap data

You need OpenStreetMap data loaded into a PostGIS database. These stylesheets
expect a database generated with `osm2pgsql` using the pgsql backend (table
names of `planet_osm_point`, etc), the default database name (`osm`).

Start by creating the database

```
sudo -u postgres createuser -s $USER
createdb osm
```

Enable PostGIS and hstore extensions with

```
psql -d osm -c 'CREATE EXTENSION postgis; CREATE EXTENSION hstore;'
```

then grab some OSM data. It's probably easiest to grab an PBF of OSM data from
[Geofabrik](https://download.geofabrik.de/). Once you've done that, import with
osm2pgsql:

```
osm2pgsql -c -G --hstore -d osm ~/path/to/data.osm.pbf
```

## Shapefiles

This style requires some preprocessed shapefiles for some features. They are
listed in the `project.mml` file. You can either download them manually or rely
on `Kosmtik` to handle this for you for a developement setup (see below).

## Fonts

The stylesheet uses Noto, an openly licensed font family from Google with
support for multiple scripts. The stylesheet uses Noto's "Sans" style where
available. If not available, this stylesheet uses another appropriate style of
the Noto family. The "UI" version is used where available, with its vertical
metrics which fit better with Latin text.

DejaVu Sans is used as an optional fallback font for systems without Noto Sans.
If all the Noto fonts are installed, it should never be used. Noto Naskh Arabic
UI is used an an optional fallback font for systems without Noto Sans Arabic.

Hanazono is used a fallback for seldom used CJK characters that are not covered
by Noto.

Unifont is used as a last resort fallback, with it's excellent coverage, common
presence on machines, and ugly look.

### Installation on Ubuntu/Debian

On Ubuntu 16.04 or Debian Testing you can download and install most of the
required fonts

```
sudo apt-get install fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted fonts-hanazono ttf-unifont
```

Noto Emoji Regular can be downloaded [from the Noto Emoji
repository](https://github.com/googlei18n/noto-emoji).

It might be useful to have a more recent version of the fonts for [rare
non-latin scripts](#non-latin-scripts). The current upstream font release has
also some more scripts and style variants than in the Ubuntu package. It can be
installed [from
source](https://github.com/googlei18n/noto-fonts/blob/master/FAQ.md#where-are-the-fonts).

DejaVu is packaged as `fonts-dejavu-core`.

### Installation on other operation systems

The fonts can be downloaded here:

* [Noto homepage](https://www.google.com/get/noto/) and [Noto github repositories](https://github.com/googlei18n?utf8=%E2%9C%93&q=noto)
* [DejaVu homepage](http://dejavu-fonts.org/)
* [Hanazono homepage](http://fonts.jp/hanazono/)
* [Unifont homepage](http://unifoundry.com/)

After the download, you have to install the font files in the usual way of your
operation system.

### Non-latin scripts

For proper rendering of non-latin scripts, particularly those with complicated
diacritics and tone marks the requirements are

* FreeType 2.6.2 or later for CJK characters

* A recent enough version of Noto with coverage for the scripts needed.


## Kosmtik

You can use [`Kosmtik`](https://github.com/kosmtik/kosmtik) to develop on this
style. You can use the `kosmtik-fetch-remote`
[plugin](https://github.com/kosmtik/kosmtik#known-plugins) to handle
downloading remote preprocessed shapefiles automatically. Information on
setting up Kosmtik is available in the [`CONTRIBUTING.md`](CONTRIBUTING.md)
file.

You can also use a
[`localconfig.json`](https://github.com/kosmtik/kosmtik#example-of-a-json-file)
file put in the root of this directory to overload parts of the `project.mml`
file. For instance, if you want to use a database named `gis` with credentials,
you can use

```
{
  "where": "Layer",
    "if": {
      "Datasource.type": "postgis"
    },
    "then": {
      "Datasource.dbname": "gis",
      "Datasource.password": "gis",
      "Datasource.user": "gis",
      "Datasource.host": "localhost"
    }
}
```

You can also generate a Mapnik XML configuration file using Kosmtik and the
`localconfig.json` file with:

```
kosmtik export path/to/cyclosm-cartocss-style/project.mml --output path/to/cyclosm-cartocss-style/mapnik.xml
```

which you can then use in [Tirex](https://github.com/openstreetmap/tirex) or
any other tile queue manager.

## Notes

This guide is based on the
[`openstreetmap-carto`](https://github.com/gravitystorm/openstreetmap-carto/blob/master/INSTALL.md)
installation guide.
