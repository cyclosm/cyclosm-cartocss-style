Building the legend
===================

There is a fake OpenStreetMap world in the `fakeworld.osm` file under the
`legend/` folder. This file can be loaded and edited with any OSM editor (such
as JOSM). You should edit this file if you want to edit the legend.

In order to build the legend, best idea is to work as you would to customize
the CyclOSM style. That is, first run

```
osm2pgsql --slim -c -G --hstore -d fakegis legend/fakeworld.osm
```

to import the fake world in a `fakegis` database (to be created before in
PostgreSQL, with extensions `postgis` and `hstore`).

Then, you can run (copy and edit the `legend/localconfig.json` according to your
database credentials)

```
kosmtik serve project.mml --localconfig legend/localconfig.json
```

to run a Kosmtik instance with the fake world.


The fake world for the legend is located around coordinates (0, 0) which you
can see at http://localhost:6789/cyclosm-cartocss-style/#18/0/0.
