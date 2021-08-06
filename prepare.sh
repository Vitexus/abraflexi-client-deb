#!/bin/bash

PACKAGE="flexibee-client"


rm -rf debian/data data

mkdir -p orig
cd orig
../flexibee-downloader client ${VERSION}
ls -la
ar -x ${PACKAGE}_${VERSION}_all.deb
cd ..
#cd debian
#tar xzvf ../orig/control.tar.gz
#cd ..
mkdir data
cd data
tar xzvf ../orig/data.tar.gz
cd ..

#CHANGES=`git log -n 1 | tail -n+5`

CHANGES="Build ${VERSION}"

dch -b -v $VERSION --package $PACKAGE $CHANGES
