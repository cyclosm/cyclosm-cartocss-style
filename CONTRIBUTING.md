Contributing
============

## Issues

[Issues](https://github.com/Phyks/cyclosm-cartocss-style/issues) centralize
the different tasks to achieve for this style. They are labelled:

* [good first
    issue](https://github.com/Phyks/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
    for any issue which should be easy to solve. These are typically good
    issues to start contributing to this style.
* [new
    feature](https://github.com/Phyks/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3A%22new+feature%22)
    for any new items to be rendered (not currently rendered).
* [enhancement](https://github.com/Phyks/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)
    for already rendered items which should be reworked or improved.
* [questions](https://github.com/Phyks/cyclosm-cartocss-style/issues?q=is%3Aissue+is%3Aopen+label%3Aquestion)
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


## Rendering locally / developping the style

### Kosmtik

The easiest way to get a local render and start developping the style is
probably using [Kosmtik](https://github.com/kosmtik/kosmtik).

First, you should follow the [INSTALL.md](INSTALL.md) guide to set up a
[PostgreSQL database with OSM
data](https://github.com/Phyks/cyclosm-cartocss-style/blob/master/INSTALL.md#openstreetmap-data)
and [install the required
fonts](https://github.com/Phyks/cyclosm-cartocss-style/blob/master/INSTALL.md#fonts).

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
[`localconfig.json`](https://github.com/Phyks/cyclosm-cartocss-style/blob/master/INSTALL.md#kosmtik)
file at the root of this repository to use custom PostgreSQL credentials.

#### Faster rebuild with Magnacarto

The [default CartoCSS implementation](https://github.com/mapbox/carto) is
written in JavaScript. A rewrite in Go exists,
[Magnacarto](https://github.com/omniscale/magnacarto), and it is way faster
(10s compilation time versus 1 min 30s with the JavaScript implementation for
CyclOSM).

Using it should be considered as experimental. You can use it to easily test
and develop on CyclOSM, but please consider checking the final render with the
default `carto` renderer (in JS) before submitting.

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
renderer. The workaround is to remove [this
line](https://github.com/kosmtik/kosmtik/blob/master/src/back/ProjectServer.js#L32)
in Kosmtik code. Note that this prevents having auto-reload feature.
Therefore, whenever you modify a stylesheet file, you should manually quit and
restart the Kosmtik server.


### CartoCSS

The style is written in CartoCSS. You can find some documentation on CartoCSS
[here](https://cartocss.readthedocs.io/en/latest/) or
[here](https://tilemill-project.github.io/tilemill/docs/manual/carto/).


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

### How do I edit road colors or road shields?

Road colors and shields are generated from `road-colors.yml` file using the
`scripts/generate_road_colors.py` and `scripts/generate_shields.py` scripts.

To be able to use these scripts, you should install the dependencies listed in
`requirements.txt`. This can be done with `pip install -r
scripts/requirements.txt`, ideally in a [virtual
environment](https://docs.python-guide.org/dev/virtualenvs/).

To edit road colors, you should edit them in the `road-colors.yml` file. Then,
you can run

```
python scripts/generate_road_colors.py | tee road-colors-generated.mss
```

to regenerate the style file.


To edit the shields colors, you should edit them in the `road-colors.yml`
file. Then, you can run

```
python scripts/generate_road_colors.py | tee road-colors-generated.mss
python scripts/generate_shields.py
```

to regenerate the shields files and corresponding style sheets.

### What is the order in which info is drawn on the map?

Information on the order in which info is drawn on the map can be found in the
[TileMill documentation](https://tilemill-project.github.io/tilemill/docs/guides/symbol-drawing-order/).

For layers, defined in the `project.mml` file, they are added onto the map in
the order in which they are listed in the `project.mml` file. The first layers
appearing in this file are rendered first, meaning that in case of conflicting
items in two layers, the layer appearing first in `project.mml` file will be
rendered.
