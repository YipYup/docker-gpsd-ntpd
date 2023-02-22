FROM ghcr.io/sdr-enthusiasts/docker-baseimage:base
RUN declare -rx DEBIAN_FRONTEND=noninteractive && declare -rx NEEDRESTART_MODE=a && export DEBIAN_FRONTEND && export NEEDRESTART_MODE && apt update && apt upgrade -y && apt autoremove -y && apt autoclean && apt install gpsd
EXPOSE 2947
#ENTRYPOINT ["/bin/sh", "-c", "/sbin/syslogd -S -O - -n & exec /usr/sbin/gpsd -N -n -G ${*}","--"]
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/sbin/gpsd -N -n -G ${*}","--"]
