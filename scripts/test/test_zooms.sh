#!/bin/bash
# render 21 zooms z[0-20] for testing regression purpose.
# usage : test_zooms.sh [extension file name]
# For testing don't use extension, it will generate images with xxx-test-$extension.png
# For generating ref you can use "ref" as extenion.
# mapnik.xml file must be present in ../.. (root folder)

extension=test


if [ $# -eq 1 ]
  then
    extension=$1
fi

echo "Use extension $extension"

perffile="perf_result_$extension.txt"

 # parser.add_argument('-o', '--outputfile', help='output filename default=prefix-zval-xval-yval.png, "-" for stdout')
now=$(date)
echo "" >> $perffile
echo "New run at $now:" >> $perffile
gitShowHead=$(git show -s HEAD)
echo "git show HEAD: $gitShowHead" >> $perffile
gitStatus=$(git status -b --porcelain -uno)
echo "git status: $gitStatus" >> $perffile


i=0
while [ $i -ne 21 ] ; do

  echo -n "z$i " >> $perffile
  python ../render_single_tile.py -c $i 48.85889 2.34765 -s ../../mapnik.xml -t -o "$i-48.85889-2.34765-$extension.png" >> $perffile

  i=$(($i + 1))
done
