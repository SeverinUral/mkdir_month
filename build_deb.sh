#!/bin/bash
# Fomenko A V  2025 (c)

mkdir -pv deb/mkdirMonthes/{DEBIAN/,usr/bin/}

cp -vf mkdir_monthes.py deb/mkdirMonthes/usr/bin/mkdirMonthes
chmod +x deb/mkdirMonthes/usr/bin/mkdirMonthes

echo "Previous version $(ls *.deb | grep -o '[0-9]*.[0-9]*-[0-9]*.[0-9]*')"
read -p "Enter Version (x.x-x.x): " VERSION

rm -rfv *.deb

CONTROL_FILE="Package: mkdirMonthes
Version: $VERSION
Section: graphics
Architecture: all
Priority: optional
Depends: python3
Maintainer: Alex <alexfomg@gmail.com>
Description: Create 12 directories named like #01 Janurey#, #02 Februry# ...
Installed-Size: $(du -sb deb/mkdirMonthes | grep -o '^[0-9]*')" 

echo "$CONTROL_FILE" > deb/mkdirMonthes/DEBIAN/control 

cd deb/

fakeroot dpkg-deb --build mkdirMonthes .

mv *.deb ..

cd ..

rm -rf deb
