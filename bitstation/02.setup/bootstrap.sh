#!/bin/sh
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_DIR/environment.sh

echo "Running from directory $GIT_DIR as user "`whoami`
echo "Doing initial installation"
echo "Installing misc"
$GIT_DIR/git/setup-git.sh misc

# install python first so that ijavascript dependencies
# are met
echo "Installing npm packages"
if [ -d /home/user/git/etherpad-lite ] ; then
pushd /home/user/git/etherpad-lite
make
if [ -d src/node_modules ] ; then
pushd src/node_modules
modclean -r
popd
fi
popd
fi

echo "Installing R packages"
/tmp/install-r-pkgs.sh


echo "Set up ipython"
mkdir -p $MY_HOME/ipython
cp -r $WEB_DIR/home/examples $MY_HOME/examples

echo "Set up R"
mkdir -p $MY_HOME/R
cp -r $WEB_DIR/home/R/* $MY_HOME/R
