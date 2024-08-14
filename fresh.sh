#!/bin/bash

PACKAGE="flexibee-client"


LATEST_PAGE_URL="https://www.flexibee.eu/podpora/stazeni-flexibee/stazeni-ekonomickeho-systemu-flexibee-linux/"
CURRENT_FLEXIBEE_VERSION=$(curl -s $LATEST_PAGE_URL | grep -oP 'flexibee-client_\K\d+\.\d+\.\d+' | sort -V | tail -n 1)
CURRENT_FLEXIBEE_VERSION_YEAR=$(echo $CURRENT_FLEXIBEE_VERSION | cut -d. -f1)
CURRENT_FLEXIBEE_VERSION_MAJOR=$(echo $CURRENT_FLEXIBEE_VERSION | cut -d. -f2)
LATESTPKG="flexibee-client_${CURRENT_FLEXIBEE_VERSION}_all.deb"
DOWNLOAD_URL="https://download.flexibee.eu/download/$CURRENT_FLEXIBEE_VERSION_YEAR.$CURRENT_FLEXIBEE_VERSION_MAJOR/$CURRENT_FLEXIBEE_VERSION/$LATESTPKG"


#REVISION=`cat debian/revision | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`

echo XXXXXXXXXXXXXXXXXXXXXXXXXX Preparing $PACKAGE version $CURRENT_FLEXIBEE_VERSION

mkdir -p debian/tmp

# Find all deb files in different versions than $CURRENT_FLEXIBEE_VERSION and delete them
find debian/tmp -name "flexibee-client_*.deb" ! -name "flexibee-client_${CURRENT_FLEXIBEE_VERSION}_all.deb" -exec rm -f {} +

if [ ! -f debian/tmp/${LATESTPKG} ]; then
    curl $DOWNLOAD_URL -o debian/tmp/${LATESTPKG}
fi

cd debian/tmp

ar -x ${LATESTPKG}
tar xzf control.tar.gz
tar xzf data.tar.gz
cd ..

#CHANGES=`git log -n 1 | tail -n+5`

CHANGES="Build ${CURRENT_FLEXIBEE_VERSION}"

cd ..
dch -b -v $CURRENT_FLEXIBEE_VERSION --package $PACKAGE $CHANGES

echo XXXXXXXXXXXXXXXXXXXXXXXXXX Ready for build - $PACKAGE version $CURRENT_FLEXIBEE_VERSION
