#!/bin/bash
PACKAGE="flexibee"
SRC="$PACKAGE-client.svg"
DIR="debian/$PACKAGE-client/usr/share/icons/hicolor"

resolutions='16 32 48 64 128 255 512'

for resolution in $resolutions
do
    echo $resolution
    mkdir -p $DIR/${resolution}x${resolution}/
    inkscape -z -w ${resolution} -h ${resolution} $SRC -o $DIR/${resolution}x${resolution}/$PACKAGE.png
done
mkdir -p $DIR/scalable
cp $SRC $DIR/scalable/$PACKAGE.svg 
echo All done
