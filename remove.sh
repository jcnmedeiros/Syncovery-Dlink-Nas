#!/bin/sh

# Erase Package

DEBUG=0
if [ -e /tmp/apkg_debug ] ; then
        DEBUG=1
fi
if [ $DEBUG == 1 ] ; then
        echo "APKG_DEBUG: $0 $@" > /dev/console
fi

path=$1

${path}/stop.sh

echo "Remove $path"
rm -rf $path
