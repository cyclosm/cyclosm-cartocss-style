#!/usr/bin/env node
/**
 * This is a script to export a specific tile (X, Y, Z) location as an SVG
 * file.
 *
 * First, install the Node Mapnik bindings by running `npm install mapnik` in
 * this script directory.
 *
 * Ensure to build a Mapnik XML file from the project.mml prior to running this
 * script. This can be done using Kosmtik:
 * kosmtik export project.mml --output mapnik.xml
 * in the root of this repository.
 *
 * You can then call this script to render some tiles as SVG.
 *
 * Command-line arguments:
 *    - X, the X position to render.
 *    - Y, the Y position to render.
 *    - Z, the zoom at which rendering should be done.
 *    - OUT_FILE, the path to the output SVG file.
 *
 * The X and Y coordinates can be found by looking at the tile URL. The tile
 * URL is always in the form …/{Z}/{X}/{Y}. For example, for
 * https://c.tile.openstreetmap.org/13/4166/3018.png, Z = 13, X = 4166 and Y = 3018.
 *
 * This script is built a lot on Kosmtik code (https://github.com/kosmtik/kosmtik).
 */
var path = require('path');
var process = require('process');
var mapnik = require('mapnik');

// register fonts and datasource plugins
mapnik.register_default_fonts();
mapnik.register_default_input_plugins();

if (process.argv.length < 6) {
  console.error('Usage: ' + process.argv[0] + ' ' + process.argv[1] + ' X Y Z OUT_FILE');
  process.exit(1);
}

var x = +process.argv[2];
var y = +process.argv[3];
var z = +process.argv[4];
var out_file = process.argv[5];

function sinh(x) {
  var y = Math.exp(x);
  return (y - 1/y) / 2;
}

function zoomXYToLatLng(z, x, y) {
  var n = Math.pow(2.0, z);
  var lonDeg = x / n * 360.0 - 180.0;
  var latRad = Math.atan(sinh(Math.PI * (1 - 2 * y / n)));
  var latDeg = latRad * 180.0 / Math.PI;
  return [latDeg, lonDeg];
}

function setupBounds() {
  var xy1 = zoomXYToLatLng(z, x, y);
  var xy2 = zoomXYToLatLng(z, x + 1, y + 1);
  return {
    maxY: xy1[0],
    minX: xy1[1],
    minY: xy2[0],
    maxX: xy2[1],
  };
}

var map = new mapnik.Map(256, 256);
console.log('Using Mapnik file ' + path.join(__dirname, '../mapnik.xml') + '.');
map.load(path.join(__dirname, '../mapnik.xml'), function(err,map) {
  if (err) throw err;
  var bounds = setupBounds();
  console.log(bounds);

  var DEFAULT_OUTPUT_PROJECTION = '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs +over';
  var projection = new mapnik.Projection(DEFAULT_OUTPUT_PROJECTION);

  map.zoomToBox(projection.forward([bounds.minX, bounds.minY, bounds.maxX, bounds.maxY]));

  map.renderFileSync(out_file, { format: 'svg' });
  console.log('Tile exported as ' + out_file + '.');
});
