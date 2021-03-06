#!/bin/bash
# These are all of the packages that need to be installed before bootstrap
# is run
# 
# Note that all apache modules should have already been installed
# in the bootstrap image.  Otherwise you will have the system attempt
# to reload httpd which causes the httpd connection to go down
#
# dokuwiki also needs to be in bootstrap for the same reasons
set -e -v

if [ -e /tmp/proxy.sh ]; then
    source /tmp/proxy.sh
fi

if grep -q '^7 ' /etc/version
then export RDKAFKA=
else  export RDKAFKA=librdkafka-devel
fi


dnf --setopt=install_weak_deps=False --best install -v -y \
    --nodocs --allowerasing \
      gcc-c++ \
      make \
      r-quantlib \
      pkgconfig\(libczmq\) \
      zeromq-devel \
      giflib-devel \
      cmake \
      python3-tornado \
      python3-mglob \
      python3-pytz \
      python3-devel \
      readline-devel \
      lapack-devel \
      python3-pandas \
      python3-numpy \
      python3-numpy-devel \
      python3-tables \
      python3-fs \
      python3-scipy \
      python3-qstk \
      python3-scikits-learn \
      python3-rpy2 \
      python3-xlwt \
      python3-xlrd \
      python3-gevent \
      python3-sqlalchemy \
      python3-sympy \
      python3-pillow \
      python3-lxml \
      python3-mistune \
      python3-cryptography \
      python3-pyasn1 \
      python3-pyglet \
      python3-py4j \
      python3-mysql \
      python3-wheel \
      curl-devel \
      icu-devel \
      libpcre-devel \
      liblzma-devel \
      libbzip2-devel \
      zeromq-devel \
      ta-lib-devel \
      libxml2-devel \
      make \
      python3-cairo-devel \
      jpeg-devel \
      java-devel \
      openmpi-devel \
      libssh2-devel \
      ruby-devel \
      libtool \
      automake \
      autoconf \
      swig \
      protobuf-devel \
      unwind-devel \
      graphviz-devel \
      glpk-devel \
      glpk \
      llvm-devel \
      llvm \
      $RDKAFKA \
      libumfpack-devel \
      hdf5-devel \
      libxt-devel \
      libmagick-devel \
      cargo \
      lib64git2-devel \
      pybind11-devel \
      gzip \
      ncurses \
      nss \
      nspr \
      passwd \
      tar \
      xeus-devel \
      xtl-devel \
      'pkgconfig(Magick++)' \
      spack \
      spack-repos \
      dnf

# xeus-devel for r juniper

# nss/nspr to prevent poppler from pulling in firefox
# cargo for gifski
# libxt-devel for R cairo
# libmagick-devel for R magick
# git-devel for git2r
# pybind11 for onnx

# glpk for swiglpk
# llvm-devel for pyfolio
# kafka for tributary?
#      python3-quantlib
# ruby-sass for ethercalc
#zeromq-devel for R kernel
#libxml2-devel for RCurl
#unzip for R devtool builds
#cffi for caravel
#cairo for jupyterlab_bokeh.git or jpeg-devel
# llvm for numba
# openmpi-devel for horvod
# libssh2-devel for git2r ssh transport

#cmake is for building shiny-server
#tornado and mglob is for ipython
#readline-devel, python-devel, lapack-devel are for Rpy
# python-backports-ssl_match_hostname is a require of python-urllib3 which
#    is required by cloud-init

# For ipython we including 
# python-pandas
# python-tables
# python-scipy

# python-mistune is needed by jupyter-nbconvert but the autorequires
# seems broken

# curl-devel is needed for Rcurl
# icu-i18n-devel is needed for Rpy

#python-cythong is for Finance-Python

#gcc-c++ is needed for ethercalc
#make is needed for ethercalc

# Compression libraries needed for Rpy

# sox to play sounds for algobroker
# pillow is for toyplot
# lxml for matta
# zeromq-utils are necessary for IRkernel
# pyasn1 for jupyter extensions
