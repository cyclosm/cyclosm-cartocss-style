#!/usr/bin/env python
"""
Script to generate highway and bike routes shields as SVG files in
symbols/shields.

Taken from
https://github.com/gravitystorm/openstreetmap-carto/blob/86196d204a65d6c115c387eecb7a37a1837c4350/scripts/generate_shields.py
Licensed under CC0 license.
"""

# Generate highway shields as SVG files in symbols/shields.

from __future__ import print_function
import copy
import itertools
import lxml.etree
import math
import os
import yaml

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))


def load_settings():
    """Read the settings from YAML."""
    with open(os.path.join(SCRIPT_DIR, '../road-shields.yml'), 'r') as fh:
        return yaml.load(fh, Loader=yaml.FullLoader)


def main():
    settings = load_settings()

    namespace = 'http://www.w3.org/2000/svg'
    svgns = '{' + namespace + '}'
    svgnsmap = {None: namespace}

    config = {}
    config['base'] = {}

    config['base']['min_width'] = 1
    config['base']['min_height'] = 1
    config['base']['max_width'] = 11
    config['base']['max_height'] = 4
    config['base']['additional_sizes'] = ['base', 'z16', 'z18']

    # font_height and font_width are determined by trial and error
    config['base']['rounded_corners'] = 2
    config['base']['font_height'] = 12.1
    config['base']['font_width'] = 6.2
    config['base']['padding_x'] = 4
    config['base']['padding_y'] = 2
    config['base']['stroke_width'] = 1

    # Fall back colours used if no colours are defined in road-colours.yaml for a road type.
    config['base']['fill'] = '#f1f1f1'
    config['base']['stroke_fill'] = '#c6c6c6'

    config['global'] = {}

    config['global']['types'] = settings.get('shield', {}).keys()
    config['global']['output_dir'] = '../symbols/shields/' # specified relative to the script location

    # changes for different size versions
    config['z16'] = {}
    config['z18'] = {}

    config['z16']['font_width'] = 6.1
    config['z16']['font_height'] = 14.1
    config['z18']['font_width'] = 6.9
    config['z18']['font_height'] = 15.1

    output_dir = os.path.join(SCRIPT_DIR,
                              os.path.dirname(config['global']['output_dir']))
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for shield_type in config['global']['types']:
        # merge base config and specific styles
        vars = copy.deepcopy(config['base'])
        from_settings = settings.get('shield', {}).get(shield_type, {})
        for option, value in from_settings.items():
            vars[option] = value

        for height, width in itertools.product(
                range(vars['min_height'], vars['max_height'] + 1),
                range(vars['min_width'], vars['max_width'] + 1)
        ):
            for shield_size in vars['additional_sizes']:
                specific_vars = copy.deepcopy(vars)
                if shield_size != 'base':
                    for option in config.get(shield_size, []):
                        specific_vars[option] = config[shield_size][option]
                    for option in vars.get(shield_size, []):
                        specific_vars[option] = vars[shield_size][option]

                shield_width = specific_vars.get(
                    'shield_width',
                    (2 * specific_vars['padding_x']
                     + math.ceil(specific_vars['font_width'] * width))
                )
                shield_height = specific_vars.get(
                    'shield_height',
                    (2 * specific_vars['padding_y']
                     + math.ceil(specific_vars['font_height'] * height))
                )

                svg = lxml.etree.Element('svg', nsmap=svgnsmap)
                svg.set('width', '100%')
                svg.set('height', '100%')
                svg.set(
                    'viewBox',
                    '0 0 %d %d' %
                    (
                        shield_width + specific_vars['stroke_width'],
                        shield_height + specific_vars['stroke_width']
                    )
                )

                offset_x = 0
                offset_y = 0
                if specific_vars['stroke_width'] > 0:
                    offset_x = specific_vars['stroke_width'] / 2.0
                    offset_y = specific_vars['stroke_width'] / 2.0

                shield = lxml.etree.Element(svgns + 'rect')
                shield.set('x', str(offset_x))
                shield.set('y', str(offset_y))
                shield.set('width', str(shield_width))
                shield.set('height', str(shield_height))
                if specific_vars['rounded_corners'] > 0:
                    shield.set('rx', str(specific_vars['rounded_corners']))
                    shield.set('ry', str(specific_vars['rounded_corners']))
                shield.set('id', 'shield')

                stroke = ''
                if specific_vars['stroke_width'] > 0:
                    stroke = 'stroke:' + specific_vars['stroke_fill'] + ';stroke-width:' + str(specific_vars['stroke_width']) + ';'

                shield.set('style', 'fill:' + specific_vars['fill'] + ';' + stroke)

                svg.append(shield)

                filename = shield_type + '_' + str(width) + 'x' + str(height)
                if shield_size != 'base':
                    filename = filename + '_' + shield_size

                filename = filename + '.svg'

                # save file
                try:
                    path = os.path.join(
                        output_dir,
                        filename
                    )
                    with open(path, 'w') as shieldfile:
                        shieldfile.write(
                            lxml.etree.tostring(
                                svg,
                                encoding='utf-8',
                                xml_declaration=True,
                                pretty_print=True
                            ).decode('utf-8')
                        )
                except IOError:
                    print('Could not save file %s.' % filename)
                    continue

if __name__ == "__main__":
    main()
