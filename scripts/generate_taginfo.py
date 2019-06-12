#!/usr/bin/env python
"""
Generate taginfo reporting for tags used.

See https://wiki.openstreetmap.org/wiki/Taginfo/Projects.
"""
import argparse
import json
import re

import sql_metadata
import yaml

TAGS_RE = re.compile(r"tags->'([^ ]+?)'", re.IGNORECASE)
OSM2PGSQL_TAGS = [
    'access', 'addr:housename', 'addr:housenumber', 'addr:interpolation',
    'admin_level', 'aerialway', 'aeroway', 'amenity', 'area', 'barrier',
    'bicycle', 'brand', 'bridge', 'boundary', 'building', 'capital',
    'construction', 'covered', 'culvert', 'cutting', 'denomination',
    'disused', 'ele', 'embankment', 'foot', 'generator:source', 'harbour',
    'highway', 'historic', 'horse', 'intermittent', 'junction',
    'landuse', 'layer', 'leisure', 'lock', 'man_made', 'military', 'motorcar',
    'name', 'natural', 'office', 'oneway', 'operator', 'place', 'population',
    'power', 'power_source', 'public_transport', 'railway', 'ref',
    'religion', 'route', 'service', 'shop', 'sport', 'surface', 'toll',
    'tourism', 'tower:type', 'tracktype', 'tunnel', 'water', 'waterway',
    'wetland', 'width', 'wood'
]


taginfo = {
    "data_format": 1,
    "project": {
        "name": "CyclOSM mapnik style (bike-oriented mapnik style)",
        "description": "This files contains all keys used for rendering in CyclOSM carto style.",
        "project_url": "https://github.com/cyclosm/cyclosm-cartocss-style",
        "contact_name": "Lucas Verney (Phyks)",
        "contact_email": "phyks+cyclosm@phyks.me"
    },
    "tags": []
}

parser = argparse.ArgumentParser(description='Export taginfo-like stats about the tags used.')
parser.add_argument('yaml', type=str)
args = parser.parse_args()

with open(args.yaml, 'r') as fh:
    yml = yaml.load(fh, Loader=yaml.FullLoader)

tags = []
for layer in yml['Layer']:
    if 'table' not in layer['Datasource']:
        continue
    sql = layer['Datasource']['table']

    # Get tags from columns
    columns = sql_metadata.get_query_columns(sql)
    columns = [x.split('.')[-1] for x in columns]
    columns = [x for x in columns if x in OSM2PGSQL_TAGS]
    tags.extend(columns)

    # Get tags from tags->'*'
    keys = TAGS_RE.findall(sql)
    for key in keys:
        tags.append(key)

# Filter out duplicates
tags = sorted(set(tags))

for tag in tags:
    taginfo["tags"].append({
        "key": tag,
    })

print(json.dumps(taginfo, indent=4))
