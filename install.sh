#!/bin/sh

# Installation

DEBUG=0
if [ -e /tmp/apkg_debug ] ; then
        DEBUG=1
fi
if [ $DEBUG == 1 ] ; then
        echo "APKG_DEBUG: $0 $@" > /dev/console
fi

path_src=$1
path_des=$2

[ -z $path_src ] && path_src=$(dirname $0)
[ -z $path_des ] && path_des=/mnt/HD/HD_a2/Nas_Prog/Syncovery
[ ! -d $path_des ] && mkdir -p $path_des

SYNCOVERY_VERSION=$(cat ${path_src}/apkg.rc | grep 'Version:' | awk '{print $2}')
SYNCOVERY_TARFILE=SyncoveryCL32-ARM-${SYNCOVERY_VERSION}-Web.tar.gz

# Try to download SyncoveryCL32-ARM-7 tarfile, from web site
cd ${path_src}
curl -O https://www.syncovery.com/release/${SYNCOVERY_TARFILE}

if [ -z ${SYNCOVERY_TARFILE} ]; then
	echo 'Syncovery file does not exist!'
	echo 'Error on downloading Syncovery file!'
	exit 1
fi

# Copy files to installation path
cp -R ${path_src} ${path_des}

cd ${path_des}

# Uncompress Syncovery tarfile
tar xzf ${SYNCOVERY_TARFILE}

chmod a+x ${path_des}/SyncoveryCL

#SYNCOVERY_HOME=/mnt/HD_a4/.Syncovery
SYNCOVERY_HOME=${path_des}/.Syncovery
SYNCOVERY_BIN=${path_des}/SyncoveryCL

mkdir -p ${SYNCOVERY_HOME}/Logs
mkdir -p ${SYNCOVERY_HOME}/Database
mkdir -p ${SYNCOVERY_HOME}/Tmp

# Set LogFolder
${SYNCOVERY_BIN} SET /INI=${SYNCOVERY_HOME}/Syncovery.cfg /LogFolder=${SYNCOVERY_HOME}/Logs

# Set Database Path
${SYNCOVERY_BIN} SET /INI=${SYNCOVERY_HOME}/Syncovery.cfg /DatabasePath=${SYNCOVERY_HOME}/Database

# Set Webserver parameters
${SYNCOVERY_BIN} SET /INI=${SYNCOVERY_HOME}/Syncovery.cfg /WEBSERVER=localhost /WEBPORT=8999
# Username/Password = default / pass

# Change owner files and permissions
chown -R root:root ${path_des}
chmod -R a+rw ${SYNCOVERY_HOME}

# Creates a 1GB swapfile
[ ! -f $path_des/.swapfile.swp ] && { dd if=/dev/zero of=$path_des/.swapfile.swp bs=10M count=100 ; mkswap $path_des/.swapfile.swp; }
