#!/bin/sh

export DEVKITPPC=$TOOLPATH/devkitPPC
export DEVKITPRO=$TOOLPATH

#---------------------------------------------------------------------------------
# Install and build the gamecube crt and libogc
#---------------------------------------------------------------------------------

echo "installing linkscripts ..."
cp `pwd`/dkppc/crtls/*.ld $DEVKITPPC/$target/lib/
#---------------------------------------------------------------------------------
# copy base rulesets
#---------------------------------------------------------------------------------
cp `pwd`/dkppc/rules/gamecube_rules dkppc/rules/base_rules $DEVKITPPC

cd $LIBOGC_SRCDIR
if [ ! -f built-libogc ]
then
  echo "building libogc ..."
  $MAKE
  touch built-libogc
fi

echo "installing libogc ..."
if [ ! -f installed-libogc ]
then
  echo "building libogc ..."
  $MAKE install
  touch installed-libogc
fi


