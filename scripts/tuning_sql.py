#!/usr/bin/env python
"""
Taken from https://github.com/cquest/osmfr-cartocss/blob/master/tuning/tuning.py
"""
import argparse
import json
import time
import sys

import prettytable
import psycopg2
import yaml


parser = argparse.ArgumentParser(description='Analyse database queries from the CartoCSS style')
parser.add_argument('yaml', type=str)
parser.add_argument('--zoom', type=int, default=16)
parser.add_argument('--lon', type=float, default=2.35)
parser.add_argument('--lat', type=float, default=48.85)
parser.add_argument('--layer', type=str, default=None)
parser.add_argument('--filter-db', action='append')
parser.add_argument('--db', type=str, default='gis')
parser.add_argument('--user', type=str, default='gis')
parser.add_argument('--password', type=str, default='gis')
parser.add_argument('--host', type=str, default='localhost')
parser.add_argument('--port', type=int, default=5432)
parser.add_argument('--explain', type=bool, default=False)
args = parser.parse_args()

# Useful constants
scale = int(559082264.0 / (2 ** args.zoom))
# estimate bbox and pixel_width / height
# equator length in meters / number of X tiles * 8 (per metatile)
width = float(40000 * 1000) / (2 ** args.zoom) * 8
bbox = (
    "st_transform(st_envelope(st_buffer(st_geogfromtext('SRID=4326;POINT(%s %s)'), %s)::geometry), 3857)" %
    (args.lon, args.lat, width / 2)
)
pixel_width = width * 10 / 2048

with open(args.yaml, 'r') as fh:
    yml = yaml.load(fh, Loader=yaml.FullLoader)

pg = psycopg2.connect(
    "dbname=%s user=%s password=%s host=%s port=%s" %
    (args.db, args.user, args.password, args.host, args.port)
)
db = pg.cursor()

temps = 0
objets = 0
req_max = 0
req = ''
layers = 0
points_total = 0

table = prettytable.PrettyTable()
table.field_names = ['Time (ms)', '#lines fetched', 'Layer', '#fields fetched',
                     'Size (text format, in kB)', '#points']
table_rows = []
for l in yml['Layer']:
    if (
            ('status' not in l or l['status'])
            and ('properties' not in l or 'status' not in l['properties'] or l['properties']['status'])
            and ('properties' not in l or 'minzoom' not in l['properties'] or args.zoom >= l['properties']['minzoom'])
            and ('properties' not in l or 'maxzoom' not in l['properties'] or args.zoom <= l['properties']['maxzoom'])
            and ('zoom_min' not in l or args.zoom >= l['zoom_min'])
            and ('zoom_max' not in l or args.zoom <= l['zoom_max'])
    ):
        if (
                'table' in l['Datasource']
                and (args.layer is None or l['id'] == args.layer)
                and (args.filter_db is None or l['Datasource']['dbname'] in args.filter_db)
        ):
            layers += 1
            sql = l['Datasource']['table']
            sql = sql.replace('!bbox!', bbox)
            sql = sql.replace('!pixel_width!', str(pixel_width))
            sql = sql.replace('!pixel_height!', str(pixel_width))
            sql = sql.replace('!scale_denominator!', str(scale))
            sql = "SELECT data.*, octet_length(data.*::text) FROM (SELECT ST_nPoints(way), * FROM " + sql + " where way && " + bbox + ") AS data"

            print('Layer %s:' % l['id'])
            print(''.join('=' for _ in 'Layer %s:' % l['id']))
            print(sql)

            start = time.time()
            try:
                db.execute(sql)
                rows = db.fetchall()
                points = 0
                for row in rows:
                    points = points + row[0]
                duration = int((time.time() - start) * 1000)
                print('Duration: %sms\n' % duration)
                table_rows.append([
                    duration,
                    db.rowcount,
                    l['id'],
                    len(rows[0]) if rows else 0,
                    sum([x[-1] for x in rows]) // 1000,
                    points
                ])
                temps = temps + time.time() - start
                if time.time() - start > req_max:
                    req = sql
                    req_max = time.time() - start
                objets = objets + db.rowcount
                points_total = points_total + points

                if args.explain:
                    # EXPLAIN !
                    print()
                    db.execute("EXPLAIN (analyze, format text) " + sql)
                    explain = db.fetchall()
                    for i in explain:
                        print(i[0])
            except KeyboardInterrupt:
                import sys
                sys.exit(1)
            except Exception as e:
                print(str(e))
                pg.rollback()
                table_rows.append(['?', '?', l['id'], '?', '?', '?'])
                continue

table_rows = sorted(table_rows, key=lambda x: x[0] if x[0] != '?' else 0, reverse=True)
for row in table_rows:
    print(row)
    table.add_row(row)

print('Summary:\n========')
print(table)
print("TOTAL: %s layers in %sms with %s objets" % (layers, int(temps*1000), objets))
