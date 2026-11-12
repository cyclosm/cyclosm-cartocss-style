#!/usr/bin/env python3
"""Regression tests for the documented GDAL hillshade colour-relief pipeline.

Run with: python3 -m unittest discover -s scripts/tests -p 'test_hillshade_nodata.py'
Requires the GDAL Python bindings. No OSM database or downloaded DEM is needed.
"""
import pathlib
import struct
import tempfile
import unittest

from osgeo import gdal


RAMP = pathlib.Path(__file__).resolve().parents[2] / 'dem' / 'shade.ramp'


class HillshadeNoDataTest(unittest.TestCase):
    def setUp(self):
        gdal.UseExceptions()
        self.directory = tempfile.TemporaryDirectory()
        self.root = pathlib.Path(self.directory.name)

    def tearDown(self):
        self.directory.cleanup()

    def colour_relief(self, values, nodata=None):
        source = gdal.GetDriverByName('MEM').Create('', len(values), 1, 1, gdal.GDT_Byte)
        band = source.GetRasterBand(1)
        if nodata is not None:
            band.SetNoDataValue(nodata)
        band.WriteRaster(0, 0, len(values), 1, bytes(values))
        result = gdal.DEMProcessing(
            '', source, 'color-relief', format='MEM',
            colorFilename=str(RAMP), addAlpha=True,
        )
        return [list(result.GetRasterBand(i).ReadRaster()) for i in range(1, 5)]

    def test_missing_hillshade_is_transparent(self):
        # gdaldem hillshade reserves 0 for missing elevation data.
        result = self.colour_relief([0, 0, 181], nodata=0)
        self.assertEqual(result[3], [0, 0, 0])

    def test_valid_shadows_and_highlights_are_preserved(self):
        result = self.colour_relief([64, 128, 150, 178, 182, 220, 255], nodata=0)
        self.assertEqual(result[3], [192, 140, 96, 0, 0, 96, 128])
        self.assertEqual(result[0], [0, 0, 0, 0, 255, 255, 255])

    def test_zero_is_not_reclassified_without_nodata_metadata(self):
        # The special nv entry must not discard a valid black sample.
        result = self.colour_relief([0, 64])
        self.assertEqual(result[3], [220, 192])

    def test_documented_dem_to_hillshade_pipeline(self):
        width, height = 32, 16
        source = gdal.GetDriverByName('GTiff').Create(
            str(self.root / 'dem.tif'), width, height, 1, gdal.GDT_Int16,
        )
        source.SetGeoTransform((0, 1, 0, height, 0, -1))
        band = source.GetRasterBand(1)
        band.SetNoDataValue(-32768)
        values = [-32768 if x < width // 2 else 100 + 5 * x + 3 * y
                  for y in range(height) for x in range(width)]
        band.WriteRaster(0, 0, width, height, struct.pack('<' + 'h' * len(values), *values))
        source = None
        hillshade = gdal.DEMProcessing(
            str(self.root / 'hillshade.tif'), str(self.root / 'dem.tif'),
            'hillshade', computeEdges=True,
        )
        self.assertEqual(hillshade.GetRasterBand(1).GetNoDataValue(), 0)
        result = gdal.DEMProcessing(
            str(self.root / 'colour-relief.tif'), hillshade, 'color-relief',
            colorFilename=str(RAMP), addAlpha=True,
        )
        result = None
        vrt = gdal.BuildVRT(str(self.root / 'shade.vrt'), [str(self.root / 'colour-relief.tif')])
        vrt = None
        result = gdal.Open(str(self.root / 'shade.vrt'))
        alpha = result.GetRasterBand(4)
        missing_alpha = list(alpha.ReadRaster(0, 0, width // 2, height))
        self.assertEqual(missing_alpha, [0] * (width // 2 * height))
        valid_alpha = list(alpha.ReadRaster(width // 2 + 2, 2, width // 2 - 4, height - 4))
        self.assertTrue(any(value > 0 for value in valid_alpha))


if __name__ == '__main__':
    unittest.main()
