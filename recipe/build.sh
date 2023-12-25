#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
autoreconf -vfi
./configure \
  --with-libedit \
  --prefix=$PREFIX \
  --with-zlib=$PREFIX \
  --with-ssl-dir=$PREFIX \
  --with-kerberos5=$PREFIX \
  --sbindir=$PREFIX/bin \
  --with-security-key-builtin
make -j$CPU_COUNT
# make install generate keys for the host which is not what we want
make install-nokeys
