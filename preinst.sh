#!/bin/sh

# Pre Installation

DEBUG=0
if [ -e /tmp/apkg_debug ] ; then
        DEBUG=1
fi
if [ $DEBUG == 1 ] ; then
        echo "APKG_DEBUG: $0 $@" > /dev/console
fi

path_des=$1

#do nothing
