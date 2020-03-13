#!/bin/bash


pushd /home/user

npm install -g node-gyp coffeescript

# livescript
node-gyp -g install
# put yelp_uri in back to override downloaded version
npm install -g --unsafe-perm zeromq --zmq-shared
npm install -g --unsafe-perm=true ijavascript configurable-http-proxy solc jp-coffeescript itypescript jp-babel modclean

#jp-livescript

# jupyter --version is breaking installs
# https://github.com/n-riesco/ijavascript/issues/200
# fixed for all but livescript
# jp-livescript-install --install=global

ijsinstall --install=global
its --install=global
jp-coffee-install --install=global
jp-babel-install --install=global

mkdir -p /usr/share/jupyter/kernels
mv /usr/local/share/jupyter/kernels/* /usr/share/jupyter/kernels

if [ -d /home/user/git/ethercalc ] ; then
    pushd /home/user/git/ethercalc
    npm i -g --unsafe-perm=true ethercalc
    popd
fi
popd
