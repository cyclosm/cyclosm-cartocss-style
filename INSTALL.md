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



## Elevation data

This part of the guide is heavily based on the very good documentation from
[OpenTopoMap](https://github.com/der-stefan/OpenTopoMap/blob/master/mapnik/HOWTO_DEM.md).
This part will guide you through generating the required data and import
elevation lines into a PostgreSQL database for the render.

First, you should install `gdal`. On Ubuntu/Debian, this can be done using

```
sudo apt-get install gdal-bin python-gdal
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

NASA provides elevation data from the [Shuttle Radar Topography Mission (SRTM)](https://dds.cr.usgs.gov/srtm/version2_1/). The easiest way to download the data is probably to use [viewfinderpanoramas.org](http://www.viewfinderpanoramas.org/Coverage%20map%20viewfinderpanoramas_org3.htm). Download all the required tiles for the area you want covered and put them in the `dem` folder at the root of this repository.

### Create hillshades

First, let us fill the voids in the HGT data and convert to TIFF files:

```
cd dem
# Unzip downloaded files
for zipfile in *.zip; do unzip $zipfile; done
rm *.zip
# Convert all HGT files to TIF
for hgtfile in */*.hgt; do gdal_fillnodata.py $hgtfile $hgtfile.tif && rm $hgtfile; done
```

Then, let us merge `.tif`s into one large `.tif`.

```
gdal_merge.py -n 32767 -co BIGTIFF=YES -co TILED=YES -co COMPRESS=LZW -co PREDICTOR=2 -o raw.tif */*.hgt.tif
# Delete all the extracted folders, no longer needed
find . ! -path . -type d | xargs rm -r
```

The `raw.tif` is the full resolution DEM. This data will be passed through
gdal to create the contours and hillshades. We should now reproject it into
Mercator projection, interpolate and shrink:

```
gdalwarp -co BIGTIFF=YES -co TILED=YES -co COMPRESS=LZW -co PREDICTOR=2 -t_srs "+proj=merc +ellps=sphere +R=6378137 +a=6378137 +units=m" -r bilinear -tr 5000 5000 raw.tif warp-5000.tif
gdalwarp -co BIGTIFF=YES -co TILED=YES -co COMPRESS=LZW -co PREDICTOR=2 -t_srs "+proj=merc +ellps=sphere +R=6378137 +a=6378137 +units=m" -r bilinear -tr 1000 1000 raw.tif warp-1000.tif
gdalwarp -co BIGTIFF=YES -co TILED=YES -co COMPRESS=LZW -co PREDICTOR=2 -t_srs "+proj=merc +ellps=sphere +R=6378137 +a=6378137 +units=m" -r bilinear -tr 500 500 raw.tif warp-500.tif
gdalwarp -co BIGTIFF=YES -co TILED=YES -co COMPRESS=LZW -co PREDICTOR=2 -t_srs "+proj=merc +ellps=sphere +R=6378137 +a=6378137 +units=m" -r bilinear -tr 90 90 raw.tif warp-90.tif
# raw.tif is no longer needed
rm raw.tif
```

Note the `gdalwarp` arguments:

* `-co BIGTIFF=YES`: if output > 4 GB
* `-co TILED=YES`: intern tiles
* `-co COMPRESS=LZW -co PREDICTOR=2`: lossless compression with prediction
* `-t_srs "+proj=merc +ellps=sphere +R=6378137 +a=6378137 +units=m"`: convert into Mercator
* `-r cubicspline`: interpolation for `tr < 90 m`, bilinear for `tr > 90 m`
* `-tr 30 30`: desired resolution in meters

We can now create hillshades for different zoom levels:

```
gdaldem hillshade -z 7 -compute_edges -co COMPRESS=JPEG warp-5000.tif hillshade-5000.tif
gdaldem hillshade -z 7 -compute_edges -co BIGTIFF=YES -co TILED=YES -co COMPRESS=JPEG warp-1000.tif hillshade-1000.tif
gdaldem hillshade -z 5 -compute_edges -co BIGTIFF=YES -co TILED=YES -co COMPRESS=JPEG warp-500.tif hillshade-500.tif
gdaldem hillshade -z 5 -compute_edges -co BIGTIFF=YES -co TILED=YES -co COMPRESS=JPEG warp-90.tif hillshade-30m-jpeg.tif
```

_Note_: `gdaldem` and `gdalwarp` have problems compressing huge files while
generation. You can compress those afterwards by using `gdal_translate -co
compress=…`


### Create the contour lines database

Run phyghtmap and generate contours (this step can take quite a few tens of
minutes):

```
phyghtmap -o contour --max-nodes-per-tile=0 -s 10 -0 --pbf warp-90.tif
```

_Note_: `phyghtmap` is using a lot of memory and only works on small extracts.
It is better to run it on each unzipped folder separately and stitch together
the resulting pbf files with `osmconvert` or `osmium` before running
`osm2pgsql`.

The output of this will be in a OpenStreetMap Protocolbuffer Binary Format
called something like
`contour_lon-126.00_-117.00lat38.00_50.00_local-source.osm.pbf`. At this
point, we no longer need the `warp-*.tif` files, you can remove them with

```
rm warp-*.tif
```

We will load the contours into a database called `contours`.  If a `contours` database exists already, you will need to drop it and recreate it first.

```
sudo -u postgres createdb contours
sudo -u postgres psql contours -c 'CREATE EXTENSION postgis;'
```

Load the data into the contours database:

```
sudo -u postgres osm2pgsql --slim -d contours --cache 5000 --style ./contours.style ./contour*.pbf
rm ./contour*.pbf
```


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

which you can then use in [Tirex](https://github.com/openstreetmap/tirex) or
any other tile queue manager.

## Notes

This guide is based on the
[`openstreetmap-carto`](https://github.com/gravitystorm/openstreetmap-carto/blob/master/INSTALL.md)
installation guide.
