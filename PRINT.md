Printing CyclOSM maps
=====================

Here are an how-to guide to print your own maps with a CyclOSM render.

*Disclaimer*: Print map styles are very different from screen oriented map
styles. To print maps, nothing can beat a dedicated map style. However,
CyclOSM can be used as a "good enough" approach to generate printed maps.

For a quick and easy setup to print CyclOSM maps, you can use this
[MapOSMatic](https://maposmatic.osm-baustelle.de/) instance, which supports
CyclOSM render.

The best approach is probably to use [Nik4](https://github.com/Zverik/Nik4)
which supports a lot of options to easily handle paper format, resolution etc.
They have a really nice [documentation](https://github.com/Zverik/Nik4/blob/master/README.md)
as well as a complete help from the `nik4.py -h` command.


## Printing a CyclOSM map with a route

CyclOSM style has a specific hidden `route` layer which can be directly used
by Nik4 to [print a map with a
route](https://github.com/Zverik/Nik4/blob/master/README.md#print-a-route).

Assuming you have a working setup with Kosmtik and you [generated a Mapnik
XML](INSTALL.md#kosmtik) file with

```bash
kosmtik export path/to/cyclosm-cartocss-style/project.mml --output path/to/cyclosm-cartocss-style/mapnik.xml
```

you can use a variant of

```bash
nik4.py --ppi 300 -a 4 --fit route --add-layers route path/to/cyclosm-cartocss-style/mapnik.xml output.png --vars gpxRoute=/tmp/route.gpx
```

to generate a PNG image with the CyclOSM background and your route. In this
last command,

* `-a 3` to generate an A3 paper format map,
* `--ppi 300` to generate the map with a resolution of 300 dots per inch, good
    for printing,
* `--fit route` to fit the whole GPX trace on the map,
* `--add-layers route` to enforce the hidden `route` layer (for the GPX track)
    to be drawn,
* `/path/to/cyclosm-cartocss-style/mapnik.xml` is the path to the generated
    Mapnik XML file,
* `output.png` is the path to the generated PNG file,
* `--vars gpxRoute=/tmp/route.gpx` tells Mapnik to draw the `/tmp/route.gpx`
    GPX track on the map.

You can also edit the [gpx.mss](gpx.mss) file to customize the render of the track.
