Contributing
============

## Optimizations

* See https://www.openstreetmap.org/user/cquest/diary/397547, `cache-features`
    should be used on all layers having attachments.

    They can be found using the following one-liner:

```bash
ack "::" *.mss | sed 's/::.*//' | sed 's/^.*.\.mss:[0-9]*://' | sed -e 's/^[[:space:]]*//' | sort | uniq
```


## Design contributions

If you are able to help on specific points of the design and may not be
familiar with CartoCSS or may not be able to reproduce the [development
toolchain](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/docs/INSTALL.md),
you are still very much welcome to contribute and give feedback!

We are currently lacking expertise on (among many subjects) icon designs and
color choices to enhance the readability of the map.

The project is using [Github's
issues](https://github.com/cyclosm/cyclosm-cartocss-style/issues) to track
known bugs and improvements. If you spot a specific bug or specific design
decision requiring improvement, please feel free to open a new issue to raise
awareness about it.

We do have a script to render [SVG
exports](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/scripts/render_svg_tile.js)
of the current state of the map, so if working on an SVG file is easier for
you, please get in touch and we can happily provide them.

A realtime chat is available at
[irc://irc.oftc.net/#cyclosm](https://webchat.oftc.net/?randomnick=1&channels=cyclosm&uio=d4).
You can also contact any [team member](https://github.com/orgs/cyclosm/people)
through emails.

## Follow main design principles

Aim to be the main map for a cyclist:
1. Bicycle first
2. For every cyclist

Main map for a cyclist in one's every day life.

Bicycle first: it is a cycle map, so we prioritize cycling information.

Multi bicycle usage (city to country, citybike, roadbike, trekking, gravel, mountain bike).

It's a map to find one's cycle way, bicycle road or low traffic road are the first thing that must be clear. Main cycle infrastructure must be seen at low zoom.

Render to tag, with this map we help and promote cycling tagging.

## Demo website contribution

The source code for the demo website living at
[https://cyclosm.org/](https://cyclosm.org/) is available in [this
repository](https://github.com/cyclosm/cyclosm-website).


## Issues

[Issues](https://github.com/cyclosm/cyclosm-cartocss-style/issues) centralize
the different tasks to achieve for this style. They are labelled:

* [good first
    issue](https://github.com/cyclosm/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
    for any issue which should be easy to solve. These are typically good
    issues to start contributing to this style.
* [new
    feature](https://github.com/cyclosm/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3A%22new+feature%22)
    for any new items to be rendered (not currently rendered).
* [enhancement](https://github.com/cyclosm/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)
    for already rendered items which should be reworked or improved.
* [questions](https://github.com/cyclosm/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3Aquestion)
    for the design choices which are unclear and should be discussed. Feel free
    to take part in the discussion if you have some opinions about the
    subject.

If you start working on an open issue, please comment this issue to state it
so that others will know and not work on the same thing.

When opening an issue about a specific point to improve with this style,
please include the relevant OSM tags (if applicable, typically for new
features to be rendered with the style) as well as an example OSM object (to
help checking the render is correctly added).


## Pull requests

The preferred way of contributing code and styles to this CartoCSS style is by
[forking and opening a Pull Request on
Github](https://help.github.com/articles/fork-a-repo/). If this is difficult
to do for you for any reasons, please feel free to get in touch otherwise
(email for instance) to contribute changes.

When opening a Pull Request, please include one or more screenshots
illustrating the changes made, for easier and faster review. Please include
the location where the screenshots were taken for easier reproducibility.

Please consider updating the `legend.html` file in [this
repository](https://github.com/cyclosm/cyclosm-website) to reflect your latest
changes when submitting a pull request.

Please also run `scripts/generate_taginfo.py` and commit the resulting
`taginfo.json` file before submitting a pull request.

Finally, please list your main modifications in the `CHANGELOG.md` file.

### Useful scripts

When submitting a pull request, please check that the size of the generated
Mapnik XML file (generated with a `kosmtik export` command) does not increase
too much. CartoCSS tends to generate rules for any combination of attributes
when the filters in the `mss` files are too broad, which makes the generation
of Mapnik XML take a lot of time and the resulting file size increase a lot.
See https://github.com/cyclosm/cyclosm-cartocss-style/issues/121 for some
extra details about it.

You can use the `scripts/inspect_mapnik_xml.py` Python script to inspect the
resulting Mapnik XML file and see how much rules are generated for each layer.

If you edit the SQL queries, you can also use the `scripts/tuning_sql.py`
Python script to check how much objects are fetched and the time spent
querying the database.


## Rendering locally / developping the style

### Kosmtik

The easiest way to get a local render and start developping the style is
probably using [Kosmtik](https://github.com/kosmtik/kosmtik).

First, you should follow the [`docs/INSTALL.md`](docs/INSTALL.md) guide to set up a
[PostgreSQL database with OSM
data](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/docs/INSTALL.md#openstreetmap-data),
[install the required
fonts](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/docs/INSTALL.md#fonts) and
[build the required
elevation files](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/docs/INSTALL.md#elevation-data).

_Note:_ If you are working with mainland France, you can use prebuilt
hillshades and extracted elevation lines, ready to be imported in your
database with `osm2pgsql` from https://pub.phyks.me/osm/cyclosm/.

Then, you can [install Kosmtik](https://github.com/kosmtik/kosmtik#install-or-update) as well as the `fetch-remote` plugin:

```
npm -g install kosmtik
kosmtik plugins --install kosmtik-fetch-remote
```

Kosmtik requires Node not above version 8. On Ubuntu/Debian, you can follow
the instructions for Node.js v8.x
[here](https://github.com/nodesource/distributions#debinstall) to install it.

_Note:_ Make sure you have Python installed as well as Mapnik library. On
Ubuntu/Debian, you can use

```
sudo apt-get install python python-dev libmapnik-dev libmapnik3.0-dev
```

You can finally run

```
kosmtik serve project.mml
```

to have a live render at `http://localhost:6789` with auto-reload when you
edit this style.

_Note_: You can use a
[`localconfig.json`](https://github.com/cyclosm/cyclosm-cartocss-style/blob/master/docs/INSTALL.md#kosmtik)
file at the root of this repository to use custom PostgreSQL credentials.

#### Faster rebuild with Magnacarto

The [default CartoCSS implementation](https://github.com/mapbox/carto) is
written in JavaScript. A rewrite in Go exists,
[Magnacarto](https://github.com/omniscale/magnacarto), and it is way faster
(10s compilation time versus 1 min 30s with the JavaScript implementation for
CyclOSM).

Using it should be considered as very **experimental**, many features are
probably not supported in Magnacarto such as `line-offset` for example. You
can use it to easily test and develop on CyclOSM, but please consider checking
the final render with the default `carto` renderer (in JS) before submitting.

First, [download and
install](https://github.com/omniscale/magnacarto#installation) Magnacarto. You
can fetch the binaries from their websites, extract the `tar.gz` archive and
put the directory obtained in your `$PATH` for instance. You can also build
from source.

_Note :_ If you get an error about "invalid flag in #cgo CXXFLAGS" when
running `make install`, this is due to [a recent security measure in
Go](https://github.com/golang/go/wiki/InvalidFlag). A quick and dirty
workaround is to use `CGO_CXXFLAGS_ALLOW=".*" make install`.

Then, install the `magnacarto` plugin in Kosmtik:

```
kosmtik plugins --install kosmtik-magnacarto
```

You can now use Kosmtik with the Magnacarto renderer using the following serve
command:

```
kosmtik serve --renderer magnacarto project.mml
```

_Note:_ There is currently [a
bug](https://github.com/kosmtik/kosmtik/issues/296) in the Kosmtik Magnacarto
renderer. If not already merged, a slightly modified version of the plugin
solving this issue is available
[here](https://github.com/kosmtik/kosmtik-magnacarto/pull/3).


### CartoCSS

The style is written in CartoCSS. You can find some documentation on CartoCSS
[here](https://cartocss.readthedocs.io/en/latest/) or
[here](https://tilemill-project.github.io/tilemill/docs/manual/carto/).


## Generating SVG tiles

You can generate SVG tiles using the `scripts/render_svg_tile.js` script. This
can be useful to work on a specific feature without editing the code and
rebuilding it at each modification.

First, you need to install Mapnik and the Node Mapnik bindings. If you already
have a working Kosmtik, this should be as easy as `cd scripts && npm install
mapnik`.

You can then build the Mapnik XML file for the project using `kosmtik export
project.mml --output mapnik.xml` and then call the
`scripts/render_svg_tile.js` script to render SVG tiles one by one.



## FAQ

### What is the difference between `minzoom` / `maxzoom` in `project.mml` and `zoom` filter in `mss` files?

Styles files handle how the map will be rendered. `[zoom > 10]` means the
targetted item will only be drawn for zooms 11 and beyond.

The `minzoom` / `maxzoom` properties in the `project.mml` file control at
which zoom levels the targetted layer will be available.

Typically, having

```
properties:
  minzoom: 12
```

in the `project.mml` means that no data will be available for this layer for
zooms below 12 (no matter what the styling instructions might be).

In summary, to control when a given feature will be displayed on the map, you
should edit style files. The `minzoom` / `maxzoom` properties in the
`project.mml` file are there to avoid fetching useless data when we are sure
it will not be displayed. Beware to update these properties to ensure data
will be available if you edit the style.

### How do I edit road shields?

Road shields are generated from `road-shields.yml` file using the
`scripts/generate_shields.py` script.

To be able to use this script, you should install the dependencies listed in
`requirements.txt`. This can be done with `pip install -r
scripts/requirements.txt`, ideally in a [virtual
environment](https://docs.python-guide.org/dev/virtualenvs/).

To edit the shields colors, you should edit them in the `road-shields.yml`
file. Then, you can run

```
python scripts/generate_shields.py
```

to regenerate the shields files.


### What is the order in which info is drawn on the map?

Information on the order in which info is drawn on the map can be found in the
[TileMill documentation](https://tilemill-project.github.io/tilemill/docs/guides/symbol-drawing-order/).

For layers, defined in the `project.mml` file, they are added onto the map in
the order in which they are listed in the `project.mml` file. The first layers
appearing in this file are rendered first, meaning that in case of conflicting
items in two layers, the layer appearing first in `project.mml` file will be
rendered.


### Running Kosmtik with a single layer

You can use the `localconfig-only.js` local config for this, in the following
way:

```
LOCALCONFIG_PATH=<your usual localconfig.json> ONLY_LAYER_ID=<comma separated list of layers to keep in Kosmtik> kosmtik serve project.mml --localconfig localconfig-only.js
```


### How to prevent CartoCSS from emitting too much Mapnik rules?

You can track the number of generated rules per layer in the exported Mapnik
XML file using the `scripts/inspect_mapnik_xml.py` Python script. Here are a
few tips to prevent CartoCSS from generating useless rules.

1. If you have to test against multiple values, consider generating a single
   output on the database side. Typically, when testing `bicycle=yes` and
   `bicycle=designated`, CartoCSS will output two rules. This is multiplied by
   all the other conditions (CartoCSS exports one rule per set of possible
   values). If you have 10 zoom conditions beside, this makes 20 (2 possible
   values for `bicycle` and 10 possible values for the zoom level) rules in
   total, so this increases very rapidly. Consider generating a new field
   `is_bicycle` which collapse both values (`yes` and `designated`) to a
   single boolean and have a single value to test against in the style.
