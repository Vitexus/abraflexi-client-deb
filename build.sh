#!/bin/bash
VERSION="2021.6.1"

dch -v $VERSION "Build ${VERSION}"

dpkg-buildpackage -i -us -uc -b

