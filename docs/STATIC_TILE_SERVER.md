Set up a demo tile server serving static (pre-generated) tiles
==============================================================

This is a complement to the [INSTALL.md](INSTALL.md) documentation.

### Requirements

The following assumes you are using an Ubuntu 18.04 LTS distribution. If you
don't have it at hand, you can get a VM quickly using
[Vagrant](https://www.vagrantup.com/) and the following `Vagrantfile`, then
running `vagrant up`:

```
$ cat Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Use a Ubuntu box
  config.vm.box = "ubuntu/bionic64"

  # VM disk size
  config.disksize.size = '30GB'

  # Forward port for Tegola
  #config.vm.network "forwarded_port", guest: 8080, host: 8080
  # Forward port for Kartotherian
  config.vm.network "forwarded_port", guest: 6533, host: 6533
  config.vm.network "forwarded_port", guest: 6789, host: 6789
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8000"
  end
end
```

In your Ubuntu machine, you can install PostGIS and required OSM tools:

```
vagrant@ubuntu-bionic:~$ sudo apt-get update
vagrant@ubuntu-bionic:~$ sudo apt-get install wget build-essential git unzip curl
vagrant@ubuntu-bionic:~$ sudo apt-get install postgis
vagrant@ubuntu-bionic:~$ sudo apt-get install osm2pgsql osmctools  # OSM tools
vagrant@ubuntu-bionic:~$ sudo apt-get install libmapnik-dev libmapnik3.0  # Mapnik
vagrant@ubuntu-bionic:~$ sudo apt-get install devscripts lintian libipc-sharelite-perl libjson-perl libgd-gd2-perl libwww-perl  # For Tirex
```


### Installing Kosmtik

First, install [Kosmtik](https://github.com/kosmtik/kosmtik) to compile the style to `mapnik.xml` file.

```
vagrant@ubuntu-bionic:~$ cd
vagrant@ubuntu-bionic:~$ git clone https://github.com/kosmtik/kosmtik
vagrant@ubuntu-bionic:~$ npm install
vagrant@ubuntu-bionic:~$ node index.js plugins --install kosmtik-fetch-remote
```


### Installing Tirex

Then, install [Tirex](https://github.com/openstreetmap/tirex/) for tiles rendering.

```
vagrant@ubuntu-bionic:~$ cd
vagrant@ubuntu-bionic:~$ git clone https://github.com/openstreetmap/tirex/
vagrant@ubuntu-bionic:~$ make deb
vagrant@ubuntu-bionic:~$ cd .. && sudo sudo dpkg -i tirex-core_*.deb tirex-backend-mapnik_*_amd64.deb
```

Then, configure it:

```
vagrant@ubuntu-bionic:~$ cat /etc/tirex/renderer/mapnik.conf
#-----------------------------------------------------------------------------
#
#  Konfiguration for Mapnik renderer
#
#  /etc/tirex/renderer/mapnik.conf
#
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#  General configuration
#-----------------------------------------------------------------------------

#  symbolic name
name=mapnik

#  path to executable of renderer
path=/usr/lib/tirex/backends/mapnik

#  UDP port where the master can contact this renderer
#  must be individual for each renderer
port=9331

#  number of processes that should be started
procs=3

#  syslog facility
#syslog_facility=daemon

#  activate this to see debug messages from renderer
#debug=1

#-----------------------------------------------------------------------------
#  Backend specific configuration
#-----------------------------------------------------------------------------

#  Directory with input plugins for mapnik.
plugindir=/usr/lib/mapnik/3.0/input

#  The directory where the Mapnik rendering engine loads its TrueType fonts from.
#  If the style sheet references fonts that are not present here, the renderer will
#  throw an exception.
fontdir=/usr/share/fonts

#  Set this to 1 if you want fonts loaded recursively from directories
#  inside the mapnik_fontdir directory. Defaults to 0.
fontdir_recurse=1

#-- THE END ------------------------------------------------------------------
```

```
vagrant@ubuntu-bionic:~$ cat /etc/tirex/renderer/mapnik/cyclosm.conf
#-----------------------------------------------------------------------------
#
#  Konfiguration for CyclOSM map
#
#  /etc/tirex/renderer/mapnik/cyclosm.conf
#
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#  General configuration
#-----------------------------------------------------------------------------

#  symbolic name of this map
name=CyclOSM

#  tile directory
tiledir=/var/lib/tirex/tiles/cyclosm/

#  minimum zoom level allowed (default 0)
minz=0

#  maximum zoom level allowed (default 17)
maxz=20

#-----------------------------------------------------------------------------
#  Backend specific configuration
#-----------------------------------------------------------------------------

# Name of the Mapnik map configuration XML file.
mapfile=/home/vagrant/cyclosm-cartocss-style/mapnik.xml

#-- THE END ------------------------------------------------------------------
```

### Getting the style

Then, you can clone the style and setup the `localconfig.json` file for Kosmtik.

```
vagrant@ubuntu-bionic:~$ cd
vagrant@ubuntu-bionic:~$ git clone https://github.com/cyclosm/cyclosm-cartocss-style/
vagrant@ubuntu-bionic:~$ cat localconfig.json
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


## Building the tiles

Here is a script you can use to build the tiles. It is currently downloading
and maintaining the database up to date for Ile-de-France, Auvergne,
Nord-Pas-de-Calais, Pays-de-la-Loire and Languedoc-Roussillon administrative
areas. It is pre-generated tiles for Paris, Clermont-Ferrand, Massy/Saclay,
Lille, Le Mans and Montpellier.

```bash
#!/bin/bash
set -e
set -v
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

# Delete all existing tiles
sudo rm -rf /var/lib/tirex/tiles/cyclosm/*

# Fetch latest CyclOSM version
cd cyclosm-cartocss-style
git pull
cd ..

# Download and import OSM data
cd data
t1_idf="$(stat -c %y ile-de-france-latest.osm.pbf || echo '')"
wget -N -q https://download.geofabrik.de/europe/france/ile-de-france-latest.osm.pbf
t2_idf="$(stat -c %y ile-de-france-latest.osm.pbf)"
t1_auvergne="$(stat -c %y auvergne-latest.osm.pbf || echo '')"
wget -N -q https://download.geofabrik.de/europe/france/auvergne-latest.osm.pbf
t2_auvergne="$(stat -c %y auvergne-latest.osm.pbf)"
t1_nord="$(stat -c %y nord-pas-de-calais-latest.osm.pbf || echo '')"
wget -N -q https://download.geofabrik.de/europe/france/nord-pas-de-calais-latest.osm.pbf
t2_nord="$(stat -c %y nord-pas-de-calais-latest.osm.pbf)"
t1_pdll="$(stat -c %y pays-de-la-loire-latest.osm.pbf || echo '')"
wget -N -q https://download.geofabrik.de/europe/france/pays-de-la-loire-latest.osm.pbf
t2_pdll="$(stat -c %y pays-de-la-loire-latest.osm.pbf)"
t1_lr="$(stat -c %y languedoc-roussillon-latest.osm.pbf || echo '')"
wget -N -q https://download.geofabrik.de/europe/france/languedoc-roussillon-latest.osm.pbf
t2_lr="$(stat -c %y languedoc-roussillon-latest.osm.pbf)"
if [ "$t1_idf" != "$t2_idf" ] || [ "$t1_auvergne" != "$t2_auvergne" ] || [ "$t1_nord" != "$t2_nord" ] || [ "$t1_pdll" != "$t2_pdll" ] || [ "$t1_lr" != "$t2_lr" ]; then
    # New file downloaded, reimport in db
    osmium merge auvergne-latest.osm.pbf ile-de-france-latest.osm.pbf languedoc-roussillon-latest.osm.pbf nord-pas-de-calais-latest.osm.pbf pays-de-la-loire-latest.osm.pbf -o all.osm.pbf
    chmod 777 all.osm.pbf
    # Recreate the database, truncate it to save a bit of space
    sudo su postgres -c 'psql -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '"'"'gis'"'"';"'
    sudo su postgres -c 'psql -c "DROP DATABASE gis;"'
    sudo su postgres -c 'psql -c "CREATE DATABASE gis;"'
    sudo su postgres -c 'psql -d gis -c "CREATE EXTENSION hstore; CREATE EXTENSION postgis;"'
    sudo su postgres -c 'osm2pgsql --slim -c -G --hstore -d gis all.osm.pbf'
    rm all.osm.pbf
fi

# Generate Mapnik XML file
cd $SCRIPTPATH
cd kosmtik
node index.js export ../cyclosm-cartocss-style/project.mml --output ../cyclosm-cartocss-style/mapnik.xml

# Restart Tirex to take into account the new Mapnik XML file
sudo systemctl restart tirex-backend-manager && sudo systemctl restart tirex-master

# Sleep a bit, to ensure Tirex server is indeed started again
sleep 10

# Export tiles for Paris
tirex-batch -e "+86000" map=CyclOSM bbox=2.1331,48.7761,2.5608,48.9414 z=0-18
# Export tiles for Clermont-Ferrand
tirex-batch -e "+86000" map=CyclOSM bbox=2.9582,45.7446,3.2197,45.8308 z=0-18
# Export tiles around Massy / Saclay
tirex-batch -e "+86000" map=CyclOSM bbox=2.1186,48.6565,2.3470,48.7582 z=0-18
# Export tiles around Lille
tirex-batch -e "+86000" map=CyclOSM bbox=2.9079,50.5630,3.2787,50.7584 z=0-18
# Export tiles around Le Mans
tirex-batch -e "+86000" map=CyclOSM bbox=-0.0288,47.8696,0.5102,48.0829 z=0-18
# Export tiles around Montpellier
tirex-batch -e "+86000" map=CyclOSM bbox=3.7844,43.5050,4.0117,43.6696 z=0-18
```

You can then serve the generated tiles with a web server (or copy them onto
your web server and serve them from there).
