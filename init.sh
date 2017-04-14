#!/bin/sh

# Init, run on NAS boot process

DEBUG=0
if [ -e /tmp/apkg_debug ] ; then
        DEBUG=1
fi
if [ $DEBUG == 1 ] ; then
        echo "APKG_DEBUG: $0 $@" > /dev/console
fi

path_des=$1

# link for images
[ ! -d /var/www/Syncovery ] && ln -sf ${path_des}/web /var/www/Syncovery
