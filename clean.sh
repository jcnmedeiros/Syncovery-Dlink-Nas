#!/bin/sh

# clean process during installation of plugin

DEBUG=0
if [ -e /tmp/apkg_debug ] ; then
        DEBUG=1
fi
if [ $DEBUG == 1 ] ; then
        echo "APKG_DEBUG: $0 $@" > /dev/console
fi

path=$(dirname $0)

# remove link for web folder

rm -r /var/www/Syncovery
