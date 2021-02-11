#!/bin/bash

PACKAGE="flexibee-client"
LATESTURL=`curl -q https://www.flexibee.eu/podpora/stazeni-flexibee/stazeni-ekonomickeho-systemu-flexibee-linux/?client=true | grep _all.deb | awk -F'"' '{print $6}' | head -n 1`
LATESTPKG=`basename $LATESTURL`


VERSION=`echo $LATESTPKG | awk -F_ '{print $2}'`
#REVISION=`cat debian/revision | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`

echo XXXXXXXXXXXXXXXXXXXXXXXXXX Building $VERSION

mkdir debian/tmp

curl -v $LATESTURL > debian/tmp/${PACKAGE}_${VERSION}_all.deb

cd debian/tmp
ar -x ${PACKAGE}_${VERSION}_all.deb
tar xzvf control.tar.gz
tar xzvf data.tar.gz
cd ..

#CHANGES=`git log -n 1 | tail -n+5`

CHANGES="Build ${VERSION}"

cd ..
dch -b -v $VERSION --package $PACKAGE $CHANGES
