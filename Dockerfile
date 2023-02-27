#FROM ghcr.io/sdr-enthusiasts/docker-baseimage:qemu
#FROM ghcr.io/serversideup/s6-overlay:ubuntu-22.04-v2.0.4
ARG S6_OVERLAY_VERSION=3.1.4.1
FROM serversideup/s6-overlay:ubuntu-22.04-v2.0.4
RUN bash -c 'declare -rx DEBIAN_FRONTEND=noninteractive && \
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
apt autoclean'
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
# Copy in files
COPY --chown=root:root ./rootfs/ /
# Expose gpsd port tcp://2947
EXPOSE 2947
# Launch init (s6-overlay) when starting container
ENTRYPOINT [ "/init", "--" ]
