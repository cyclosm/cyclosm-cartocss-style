#!/usr/bin/env python
"""
Script to generate a set of highway colors to be stored in
road-colors-generated.mss.

Handles color for roads and bike routes.

Adapted from
https://github.com/gravitystorm/openstreetmap-carto/blob/86196d204a65d6c115c387eecb7a37a1837c4350/scripts/generate_road_colors.py.
Licensed under CC0 license.
"""

import argparse
import os
import sys
import yaml

from collections import OrderedDict, namedtuple

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))


def load_settings():
    """Read the settings from YAML."""
    with open(os.path.join(SCRIPT_DIR, '../road-colors.yml'), 'r') as fh:
        return yaml.load(fh)


def main():
    settings = load_settings()

    # Print a warning about the nature of these definitions.
    print("/* This is generated code, do not change this file manually.             */")
    print("/*                                                                       */")
    print("/* To change these definitions, alter road-colors.yml and run:           */")
    print("/*                                                                       */")
    print("/*   ./scripts/generate_road_colors.py | tee road-colors-generated.mss   */")
    print("/*                                                                       */")

    out = []
    for road_type, colors in settings.get('mss', {}).items():
        for name, color in colors.items():
            out.append(
                "@{road_type}-{name}: {color};".format(
                    road_type=road_type,
                    name=name,
                    color=color
                )
            )
    print('\n'.join(sorted(out)))


if __name__ == "__main__":
    main()
