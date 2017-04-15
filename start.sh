#!/bin/sh

#start daemon

DEBUG=0
if [ -e /tmp/apkg_debug ] ; then
        DEBUG=1
fi
if [ $DEBUG == 1 ] ; then
        echo "APKG_DEBUG: $0 $@" > /dev/console
fi

path=$(dirname $0)

SYNCOVERY_HOME=${path}/.Syncovery
SYNCOVERY_BIN=${path}/SyncoveryCL

PID=$(/bin/ps -eo 'pid,cmd' | grep 'SyncoveryCL' | grep -v grep | awk '{ print $1 }')
if [[ -n "${PID}" ]]; then
	echo "Already running PID=${PID} ... "
	exit 0
fi

busybox nohup ${SYNCOVERY_BIN} SET /INI=${SYNCOVERY_HOME}/Syncovery.cfg 2>&1 >${SYNCOVERY_HOME}/start.log &

# Enable swap
SWP=$(cat /proc/swaps | grep "$path/.swapfile.swp")
[ -z "$SWP" ] && swapon $path/.swapfile.swp;
