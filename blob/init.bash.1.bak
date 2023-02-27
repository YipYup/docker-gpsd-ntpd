#!/usr/bin/env bash
###############################################################################
# Setup vars to be used for this init script
###############################################################################
declare -rx DOCKER_FILES_INTERNAL_SOURCE_DIR=/usr/docker-src-rootfs/
export DOCKER_FILES_INTERNAL_SOURCE_DIR
###############################################################################
# Backup the gpsd default config file
###############################################################################
echo "Checking if the /etc/default/gpsd file exists..."
if [[ -f /etc/default/gpsd ]]; then
    echo "GPSd default config file exists. We will check to see if it has been"
    echo "backed up yet..."
    if [[ ! -f /etc/default/gpsd.orig ]]; then
        echo "No backup of it exists. Attempting to create a backup..."
        cp /etc/default/gpsd /etc/default/gpsd.orig || echo "Failed to copy /etc/default/gpsd to /etc/default/gpsd.orig" && exit 1
        echo "Successfully made a backup of /etc/default/gpsd at /etc/default/gpsd.orig"
        echo "Continuing..."
        true
    else
        echo "A backup of /etc/default/gpsd already exists at /etc/default/gpsd.orig. Proceeding..."
        true
    fi
    true
else
    echo "GPSD default config file is missing. Now exiting..."
    exit 1
fi
###############################################################################
# Backup the GPSD socket configuration file
###############################################################################
echo "Checking if the /usr/lib/systemd/system/gpsd.socket file exists..."
if [[ -f /usr/lib/systemd/system/gpsd.socket ]]; then
    echo "gpsd socket config file exists..."
    echo "Now checking if a backup of gpsd socket file exists..."
    if [[ ! -f /root/.gpsd.socket.bak ]]; then
        cp /usr/lib/systemd/system/gpsd.socket /root/.gpsd.socket.bak || echo "Failed to copy /usr/lib/systemd/system/gpsd.socket to /root/.gpsd.socket.bak" && exit 1
        echo "Successfully made a backup of /usr/lib/systemd/system/gpsd.socket at /root/.gpsd.socket.bak"
        echo "Continuing..."
        true
    else
        echo "A backup of /usr/lib/systemd/system/gpsd.socket already exists at /root/.gpsd.socket.bak"
        echo "Continuing..."
        true
    fi
    true
else
    echo "GPSD default config file is missing. Now exiting..."
    exit 1    
fi
###############################################################################
# Make GPSd listen on any IP address for IPv6 and IPv4
###############################################################################
sed -i.orig -e 's/ListenStream\=\[::1\]:2947/ListenStream\=\[::\]:2947/' -e 's/ListenStream\=127.0.0.1:2947/ListenStream\=0.0.0.0:2947/' /usr/lib/systemd/system/gpsd.socket
###############################################################################
# Backup NTPd service file
###############################################################################
if [[ -f /lib/systemd/system/ntp.service ]]; then
    echo "ntp default config file exists..."
    echo "Now checking if backup of default gpsd file exists..."
    if [[ ! -f /root/.ntp.service.bak ]]; then
        cp /lib/systemd/system/ntp.service /root/.ntp.service.bak || echo "Failed to copy /lib/systemd/system/ntp.service to /root/.ntp.service.bak" && exit 1
        echo "Successfully made a backup of /lib/systemd/system/ntp.service at /root/.ntp.service.bak"
        echo "Continuing..."
        true
    else
        echo "A backup of /lib/systemd/system/ntp.service already exists at /root/.ntp.service.bak"
        echo "Continuing..."
        true
    fi
    true
else
    echo "ntp default config file is missing. Now exiting..."
    exit 1    
fi
###############################################################################
# Edit NTPd service file to disable the PrivateTmp file and make it accessible.
###############################################################################
sed -i.orig -e 's/PrivateTmp=true/#PrivateTmp=true/' /lib/systemd/system/ntp.service

###############################################################################
# Copy gpsd config file from source directory
###############################################################################
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}gpsd /etc/default/ || echo "Failed to copy ${DOCKER_FILES_INTERNAL_SOURCE_DIR}gpsd to /etc/default/gpsd" && exit 1

###############################################################################
# run GPSd
###############################################################################
