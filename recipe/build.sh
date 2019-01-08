#!/bin/bash
set -ex

export CFLAGS="$CFLAGS -I$PREFIX/include -L$PREFIX/lib"
export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"

autoreconf

./configure --prefix=$PREFIX \
            --with-zlib-prefix=$PREFIX

#make -j${CPU_COUNT} ${VERBOSE_AT}
make ${VERBOSE_AT}
make check
make install

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
