#!/usr/bin/env bash
###############################################################################
# Setup vars to be used for this init script
###############################################################################
declare -rx DOCKER_FILES_INTERNAL_SOURCE_DIR=/usr/docker-src-rootfs/
export DOCKER_FILES_INTERNAL_SOURCE_DIR
###############################################################################
# copy files needed for GPSd
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}etc/default/gpsd /etc/default/gpsd
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}usr/lib/systemd/system/gpsd.socket
# copy files needed for NTP
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}etc/ntp.conf /etc/ntp.conf
cp ${DOCKER_FILES_INTERNAL_SOURCE_DIR}lib/systemd/system/ntp.service