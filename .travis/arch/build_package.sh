#!/usr/bin/env bash

# Find the right sources dir path
SOURCES_DIR=`realpath $0`
SOURCES_DIR=`dirname ${SOURCES_DIR}`

sudo docker build -t build/arch ${SOURCES_DIR}
sudo docker run -v ${PWD}:/sources build/arch \
    /bin/bash -c "cp /sources/.travis/arch/PKGBUILD . && makepkg"