#!/bin/sh

#stop daemon

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

echo "Stopping SyncoveryCL ... "
echo '##########################  ' $(date) '  ##########################' >> ${SYNCOVERY_HOME}/start.log

PID=$(/bin/ps -eo 'pid,cmd' | grep 'SyncoveryCL' | grep -v grep | awk '{ print $1 }')
[[ ! -n "${PID}" ]] && busybox nohup ${SYNCOVERY_BIN} SET /INI=${SYNCOVERY_HOME}/Syncovery.cfg /STOPTIMER 2>&1 >>${SYNCOVERY_HOME}/stop.log &

sleep 10;

PID=$(/bin/ps -eo 'pid,cmd' | grep 'SyncoveryCL' | grep -v grep | awk '{ print $1 }')
[[ -n "${PID}" ]] && kill ${PID}

echo '##########################  ' $(date) '  ##########################' >> ${SYNCOVERY_HOME}/start.log

