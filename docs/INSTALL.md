Getting started
===============

This document describes how to manually configure your system for running CyclOSM. This guide is the recommended approach to run and develop CyclOSM.

> There is also a quick, platform independent setup for a development environment, without the need to install and configure tools by hand, follow a Docker installation guide in [DOCKER.md](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/docs/DOCKER.md).

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

_Note_: Be careful if you use a Lua script with `osm2pgsql` as it might
drop nodes with no tags except the `hstore` tags column (typically, a
`cycleway=asl` node).

**Important**: If you plan on enabling CLPC / bicycle give way signs render
(see below), make sure to include the `--slim` option in your `osm2pgsql`
command, to ensure temporary tables are created in database and store the raw
details about relations (especially table `planet_osm_rels`).

Create sql views used by cyclosm style:

```
psql -d osm --file=views.sql
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
sudo apt-get install fonts-dejavu-core fonts-noto fonts-noto-color-emoji fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted fonts-hanazono ttf-unifont
```

It might be useful to have a more recent version of the fonts for [rare
non-latin scripts](#non-latin-scripts). The current upstream font release has
also some more scripts and style variants than in the Ubuntu package. It can be
installed [from
source](https://github.com/googlei18n/noto-fonts/blob/master/FAQ.md#where-are-the-fonts).

You might want to install these fonts from `sid` to ensure having latest
version.

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



## Elevation data

This part of the guide is heavily based on the very good documentation from
[OpenTopoMap](https://github.com/der-stefan/OpenTopoMap/blob/master/mapnik/HOWTO_DEM.md).
This part will guide you through generating the required data and import
elevation lines into a PostgreSQL database for the render.

First, you should install `gdal` and `geotiff` tools. On Ubuntu/Debian, this
can be done using

```
sudo apt-get install gdal-bin python-gdal geotiff-bin
```

We will also need
[`phyghtmap`](http://katze.tfiu.de/projects/phyghtmap/) to generate
the elevation lines (contours). On Ubuntu/Debian, you can download the Debian
package on their [download page](http://katze.tfiu.de/projects/phyghtmap/#Download) and run

```
sudo dpkg -i phyghtmap*.deb
sudo apt-get --fix-broken install  # To ensure missing dependencies are installed
```

We will be running everything from now on in the `dem` folder.

### Download some elevation data

NASA provides elevation data from the [Shuttle Radar Topography Mission (SRTM)](https://wiki.openstreetmap.org/wiki/SRTM). Files from SRTMv3 can be downloaded from [the NASA EarthData website](https://search.earthdata.nasa.gov/search/granules?p=C204582034-LPDAAC_ECS&q=srtm) after creating an account. To easily download all the required tiles for the area you want covered, you can use `phyghtmap` (here downloading for the entire world):

```
phyghtmap --download-only --srtm=3 --srtm-version=3 --earthexplorer-user=<NASA-USERNAME> --earthexplorer-password=<NASA-PASSWORD> --hgtdir=./dem/hgt -a -180:-85.05112877980659:180:85.05112877980659
```

### Create hillshades

You can now reproject it into WGS84 projection, using:

```
gdalwarp -s_srs EPSG:4269 -t_srs "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" -r bilinear <IN.tif> <PROJ.tif>
```

You can now create semi-transparent hillshades using the ramp provided in
`dem/shade.ramp` and GDAL:

```
gdaldem hillshade -co compress=lzw -compute_edges <PROJ.tif> <HILLSHADE.tif>
gdaldem color-relief <HILLSHADE.tif> -alpha shade.ramp <SEMI-TRANSPARENT-HILLSHADE.tif>
```

And build a VRT file for your semi-transparent hillshades

```
gdalbuildvrt dem/shade.vrt <SEMI-TRANSPARENT-HILLSHADE.tif>
```

Note that hillshades are disabled by default in the style. You can enable them
by using a block such as the following one in Kosmtik `localconfig.json` (see
below for more details):

```
  {
    "where": "Layer",
    "if": {
      "id": "hillshade"
    },
    "then": {
      "properties.status": "on"
    }
  }
```


### Create the contour lines database

Run phyghtmap and generate contours (this step can take quite a few tens of
minutes):

```
wget http://download.geofabrik.de/europe/france.poly
phyghtmap --polygon=france.poly -j 2 -s 10 -0 --source=view3 --max-nodes-per-tile=0 --max-nodes-per-way=0 --pbf
# Remove now useless files
rm -r hgt
rm france.poly
```

_Note_: You can use any other polygon from Geofabrik. The previous command
will generate elevation lines for the whole France area.

The output of this will be in a OpenStreetMap Protocolbuffer Binary Format
called something like
`lon-6.30_9.90lat41.26_51.33_view3.osm.pbf`.

We will load the contours into a database called `contours`.  If a `contours` database exists already, you will need to drop it and recreate it first.

```
sudo -u postgres createdb data
sudo -u postgres psql data -c 'CREATE EXTENSION postgis;'
```

Load the data into the contours database:

```
sudo -u postgres osm2pgsql --slim -d data --cache 5000 --style ./contours.style ./*.osm.pbf
rm ./*.osm.pbf
```

Note that due to historical reasons, we have specific requirements for the
contours table, which is not exactly given by the output of `phyghtmap` /
`osm2pgsql`.
Therefore, you should probably update the `project.mml` and `base.mss` file or
edit the generated table. Main differences are:
* We are using a table named `contours` instead of `planet_osm_line`.
* We are having a geometry field named `geometry` instead of `way` (this
    appears both in the SQL query and in the `Datasource.geometry_field` field).

Note that contours are disabled by default in the style. You can enable them
by using a block such as the following one in Kosmtik `localconfig.json` (see
below for more details):

```
  {
    "where": "Layer",
    "if": {
      "class": "contours"
    },
    "then": {
      "properties.status": "on"
    }
  }
```


## Kosmtik

You can use [`Kosmtik`](https://github.com/kosmtik/kosmtik) to develop on this
style. You can use the `kosmtik-fetch-remote`
[plugin](https://github.com/kosmtik/kosmtik#known-plugins) to handle
downloading remote preprocessed shapefiles automatically. Information on
setting up Kosmtik is available in the [`CONTRIBUTING.md`](../CONTRIBUTING.md)
file.

You can also use a
[`localconfig.json`](https://github.com/kosmtik/kosmtik#example-of-a-json-file)
file put in the root of this directory to overload parts of the `project.mml`
file. For instance, if you want to use a database named `gis` with credentials,
you can use

```
[
  {
    "where": "Layer",
    "if": {
      "Datasource.type": "postgis"
    },
    "then": {
      "Datasource.password": "gis",
      "Datasource.user": "gis",
      "Datasource.host": "localhost"
    }
  },
  {
    "where": "Layer",
    "if": {
      "Datasource.dbname": "osm"
    },
    "then": {
      "Datasource.dbname": "gis"
    }
  }
]
```

You can also generate a Mapnik XML configuration file using Kosmtik and the
`localconfig.json` file with:

```
kosmtik export path/to/cyclosm-cartocss-style/project.mml --output path/to/cyclosm-cartocss-style/mapnik.xml
```

which you can then use in [Tirex](https://github.com/openstreetmap/tirex),
[mod_tile](https://wiki.openstreetmap.org/wiki/Mod_tile) or any other tile
queue manager.


## Rendering CLPC / bicycle give way relations

If you want to render bicycle give way relations, you should ensure your
osm2pgsql setup is building a `planet_osm_rels` table storing relations and
this one stays available after initialization of the whole database.

Then, you can enable the layer with a Kosmtik local config file such as:

```json
  {
    "where": "Layer",
    "if": {
      "id": "clpc"
    },
    "then": {
      "properties.status": "on"
    }
  }
```


## Useful tweaks for production setup

Here are a few useful tweaks for running CyclOSM in a production setup, such
as on [https://cyclosm.org/](https://cyclosm.org/).

### Database indexes

A few databases indexes can help speed up the queries to the PostgreSQL
database. On [https://cyclosm.org/](https://cyclosm.org/), we are currently
using:

* all the indexes defined in the [`osmfr-cartocss`
    style](https://github.com/cquest/osmfr-cartocss/blob/9a7543eaee34fbb551e45550f3a14a7473639b17/create_index.sh).

* an additional index for the bicycle routes:

```
create index planet_osm_bicycle_routes on planet_osm_line using gist(way) where route='bicycle' OR route='mtb';
```

* an additional index for the ferry lines:

```
create index planet_osm_line_ferry on planet_osm_line using gist (way) where route = 'ferry';
```


## Notes

This guide is based on the
[`openstreetmap-carto`](https://github.com/gravitystorm/openstreetmap-carto/blob/master/INSTALL.md)
installation guide.
