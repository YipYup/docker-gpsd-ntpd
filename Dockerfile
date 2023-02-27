#FROM ghcr.io/sdr-enthusiasts/docker-baseimage:qemu
FROM ghcr.io/serversideup/s6-overlay:ubuntu-22.04-v2.0.4
RUN declare -rx DEBIAN_FRONTEND=noninteractive && \
declare -rx NEEDRESTART_MODE=a && \
export DEBIAN_FRONTEND && \
export NEEDRESTART_MODE && \
apt update && \
apt remove unattended-upgrades -y && \
apt install --no-install-recommends \
gpsd \
gpsd-clients \
ntp \
ntpdate \
tzdata \
-y && \
apt upgrade -y && \
apt autoremove -y && \
apt autoclean && \
systemctl stop ntp && \
systemctl stop gpsd && \
systemctl disable ntp && \
systemctl disable gpsd && \
# Copy in files
COPY --chown=root:root ./rootfs/ /
# Expose gpsd port tcp://2947
EXPOSE 2947
# Launch init (s6-overlay) when starting container
ENTRYPOINT [ "/init", "--" ]
