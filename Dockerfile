FROM ghcr.io/sdr-enthusiasts/docker-baseimage:qemu
RUN declare -rx DEBIAN_FRONTEND=noninteractive && \
declare -rx NEEDRESTART_MODE=a && \
export DEBIAN_FRONTEND && \
export NEEDRESTART_MODE && \
apt update && \
apt remove unattended-upgrades -y && \
apt install --no-install-recommends gpsd gpsd-clients python-gps ntp ntpdate -y && \
apt upgrade -y && \
apt autoremove -y && \
apt autoclean && \
tee /etc/default/gpsd > /dev/null <<TEXT1
DEVICES="/dev/ttyACM0"
GPSD_OPTIONS="-bGn"
GPSD_SOCKET="/var/run/gpsd.sock"
ListenStream=0.0.0.0:2947
TEXT1
COPY ./filesource /path/fileDest
EXPOSE 2947
#ENTRYPOINT ["/bin/sh", "-c", "/sbin/syslogd -S -O - -n & exec /usr/sbin/gpsd -N -n -G ${*}","--"]
