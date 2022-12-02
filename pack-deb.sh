#!/bin/bash

set -e

# create dirs
mkdir -p eupnea-utils/DEBIAN
mkdir -p eupnea-utils/usr/bin
mkdir -p eupnea-utils/etc/eupnea

# Clone the postinstall repo
git clone --depth=1 https://github.com/eupnea-linux/postinstall-scripts.git --branch=move-to-packages

# move postinstall scripts into package
mv postinstall-scripts/scripts eupnea-utils/usr/bin

# move postinstall configs into package
mv postinstall-scripts/configs eupnea-utils/etc/eupnea

# copy debian control files into package
cp control eupnea-utils/DEBIAN

# create package
dpkg-deb --build --root-owner-group eupnea-utils
