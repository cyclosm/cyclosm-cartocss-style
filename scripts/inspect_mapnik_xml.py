#!/usr/bin/env python
"""
Based on https://github.com/cquest/osmfr-cartocss/blob/master/tuning/cleanxml.py.
"""
import argparse
import re

import prettytable


parser = argparse.ArgumentParser(description='Analyse number of rules in Mapnik styles')
parser.add_argument('mapnik_xml', type=str, help='Mapnik XML file to inspect.')
args = parser.parse_args()

stylename_re = re.compile(r'^ +<Style.*?name="(\S+)".*?>')
rule_re = re.compile(r'^ +<Rule')

stylename = None
rules = {}

with open(args.mapnik_xml, 'r') as xml:
    for l in xml:
        stylename_match = stylename_re.match(l)
        if stylename_match:
            stylename = stylename_match.group(1)
            rules[stylename] = 0

        rule_match = rule_re.match(l)
        if rule_match and stylename:
            rules[stylename] += 1

table = prettytable.PrettyTable()
table.field_names = ['Style name', '# of rules']
for k, v in rules.items():
    table.add_row([k, v])
table.sortby = table.field_names[1]
table.reversesort = True
print(table)
