#!/usr/bin/env bash
###############################################################################
# Setup vars to be used for this init script
###############################################################################
declare -rx DOCKER_FILES_INTERNAL_SOURCE_DIR=/usr/docker-src-rootfs/
export DOCKER_FILES_INTERNAL_SOURCE_DIR
###############################################################################
# copy files needed for GPSd
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}etc/default/gpsd /etc/default/gpsd
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}usr/lib/systemd/system/gpsd.socket /usr/lib/systemd/system/gpsd.socket
# copy files needed for NTP
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}etc/ntp.conf /etc/ntp.conf
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}lib/systemd/system/ntp.service /lib/systemd/system/ntp.service
# Copy files for DHCP client that is prepending our NTP configuration
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}etc/systemd/network/10-eth0.network /etc/systemd/network/10-eth0.network
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}etc/systemd/network/10-wlan0.network /etc/systemd/network/10-wlan0.network
systemctl daemon-reload
systemctl restart gpsd
systemctl restart ntp