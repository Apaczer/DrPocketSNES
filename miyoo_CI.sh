#!/bin/bash

export SDKC=/opt/miyoo/usr
export PATH=$PATH:${SDKC}/bin
export TARGETMACH=arm-linux
export BUILDMACH=i686-pc-linux-gnu
export CROSS=arm-linux
export CC=${CROSS}-gcc
export LD=${CROSS}-ld
export AS=${CROSS}-as
export CXX=${CROSS}-g++
export STRIP=${CROSS}-strip
make
