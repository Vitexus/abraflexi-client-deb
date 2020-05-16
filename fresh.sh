#!/bin/bash

PACKAGE="flexibee-client"
LATESTURL=`curl -q https://www.flexibee.eu/podpora/stazeni-flexibee/stazeni-ekonomickeho-systemu-flexibee-linux/?client=true | grep _all.deb | awk -F'"' '{print $6}' | head -n 1`
LATESTPKG=`basename $LATESTURL`


VERSION=`echo $LATESTPKG | awk -F_ '{print $2}'`
#REVISION=`cat debian/revision | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`

echo XXXXXXXXXXXXXXXXXXXXXXXXXX Building $VERSION

curl -v $LATESTURL > orig/${PACKAGE}_${VERSION}_all.deb

#echo wget $LATESTURL 
#wget -d -v -c $LATESTURL -O orig/${PACKAGE}_${VERSION}_all.deb


rm -rf debian/data data

mkdir -p orig
cd orig
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
