#!/bin/bash
# Fomenko A V  2025 (c)

cp -vf mkdir_monthes.py deb/mkdirMonthes/usr/bin/mkdirMonthes

chmod +x deb/mkdirMonthes/usr/bin/mkdirMonthes

echo "Previous $(grep '^Version:' deb/mkdirMonthes/DEBIAN/control)"
echo "Enter new version (x.x-x.x):"
read VERSION

rm -rfv deb/mkdirMonthes/DEBIAN/control 

CONTROL_FILE="Package: mkdirMonthes
Version: $VERSION
Section: graphics
Architecture: all
Priority: optional
Depends: python3
Maintainer: Alex <alexfomg@gmail.com>
Description: Programm for sorting shots by creation date
Installed-Size: $(du -sb deb/mkdirMonthes | grep -o '^[0-9]*')" 

echo "$CONTROL_FILE" > deb/mkdirMonthes/DEBIAN/control 

cd deb/
./make_deb.sh 
