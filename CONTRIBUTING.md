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
kosmtik plugins --install kosmtik-fetch-remote
```

_Note_: You can use a
[`localconfig.json`](https://github.com/Phyks/cyclosm-cartocss-style/blob/master/INSTALL.md#kosmtik)
file at the root of this repository to use custom PostgreSQL credentials.

You can finally run

```
kosmtik serve project.mml
```

to have a live render at `http://localhost:6789` with auto-reload when you
edit this style.

### CartoCSS

The style is written in CartoCSS. You can find some documentation on CartoCSS
[here](https://cartocss.readthedocs.io/en/latest/) or
[here](https://tilemill-project.github.io/tilemill/docs/manual/carto/).
