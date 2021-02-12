#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
./configure \
  --with-libedit \
  --prefix=$PREFIX \
  --with-zlib=$PREFIX \
  --with-ssl-dir=$PREFIX \
  --with-kerberos5=$PREFIX \
  --sbindir=$PREFIX/bin
make -j$CPU_COUNT
make install
