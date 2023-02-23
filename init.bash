#!/usr/bin/env bash
#####
# Backup gpsd default config file
if [[ -f /etc/default/gpsd ]]; then
    echo "gpsd default config file exists..."
    echo "Now checking if backup of default gpsd file exists..."
    if [[ ! -f /etc/default/gpsd.orig ]]; then
        $(which cp) /etc/default/gpsd /etc/default/gpsd.orig || echo "Failed to copy /etc/default/gpsd to /etc/default/gpsd.orig" && exit 1
    else
        true
    fi
else
    echo "GPSD default config file is missing."
    exit 1    
fi
#####
# Backup GPSD socket configuration file
if [[ -f /usr/lib/systemd/system/gpsd.socket ]]; then
    echo "gpsd default config file exists..."
    echo "Now checking if backup of default gpsd file exists..."
    if [[ ! -f /root/.gpsd.socket.bak ]]; then
        /usr/bin/cp /usr/lib/systemd/system/gpsd.socket /root/.gpsd.socket.bak || echo "Failed to copy /usr/lib/systemd/system/gpsd.socket to /root/.gpsd.socket.bak" && exit 1
    else
        true
    fi
else
    echo "GPSD default config file is missing."
    exit 1    
fi
#####
# Make GPSd listen on any IP address for IPv6 and IPv4
sed -i.orig -e 's/ListenStream\=\[::1\]:2947/ListenStream\=\[::\]:2947/' -e 's/ListenStream\=127.0.0.1:2947/ListenStream\=0.0.0.0:2947/' /usr/lib/systemd/system/gpsd.socket
#####
# Backup NTPd service file
if [[ -f /lib/systemd/system/ntp.service ]]; then
    echo "ntp default config file exists..."
    echo "Now checking if backup of default gpsd file exists..."
    if [[ ! -f /root/.ntp.service.bak ]]; then
        /usr/bin/cp /lib/systemd/system/ntp.service /root/.ntp.service.bak || echo "Failed to copy /lib/systemd/system/ntp.service to /root/.ntp.service.bak" && exit 1
    else
        true
    fi
else
    echo "ntp default config file is missing."
    exit 1    
fi

#
# Edit NTPd service file to disable the PrivateTmp file and make it accessible.
sed -i.orig -e 's/PrivateTmp=true/#PrivateTmp=true/' /lib/systemd/system/ntp.service