#!/bin/bash

vim --version | grep 8
if [ $? = 0 ]; then
    exit 0
    fi

cd /tmp/vim-master/src/
./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp=yes \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config \
--enable-luainterp=yes \
--enable-gui=gtk2 \
--enable-cscope \
--prefix=/home/vim
make
make install
