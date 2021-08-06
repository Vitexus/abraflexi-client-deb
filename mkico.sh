#!/bin/bash
PACKAGE="flexibee"
SRC="$PACKAGE-client.svg"
DIR="debian/$PACKAGE-client/usr/share/icons/hicolor"

resolutions='16 32 48 64 128 255 512'

inkscap -V
if [ `inkscape -V | awk '{print $2}'| awk -F. '{print $1}'` -eq 0 ]; then
    command="inkscape -z "
else
    command="inkscape"
fi

for resolution in $resolutions
do
    echo ${resolution}x${resolution}
    mkdir -p $DIR/${resolution}x${resolution}/
    echo ${command} -w ${resolution} -h ${resolution} $SRC -e $DIR/${resolution}x${resolution}/$PACKAGE.png
    ${command} -w ${resolution} -h ${resolution} $SRC -e $DIR/${resolution}x${resolution}/$PACKAGE.png
done
mkdir -p $DIR/scalable
cp $SRC $DIR/scalable/$PACKAGE.svg 
echo All done
