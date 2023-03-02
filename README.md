# docker-gpsd
GPSd and NTPd inside of docker

GPSd exposes itself on 2947, while also making itself
available to NTPd in order to be a timeserver to ntpd.

### Thanks to:
- [kx1t](https://github.com/kx1t) for their assistance with the S6 Overlay service configuration
- [mikenye](https://github.com/mikenye) for their solid base image used in this build
- [johnboy00](https://www.rdforum.org/members/12420/) for their assistance and collaboration on the "carputer" project, and for their amazing app, the ultimate driving companion app, [JBV1](https://jbv1.net/)
- [RADAR Detector Forum](https://www.rdforum.org/) for bringing together a community of passionate civil disobedients.

### Information:

#### NTPd:
- NTP overview: https://en.wikipedia.org/wiki/Network_Time_Protocol
- Understanding NTP reach: https://www.linuxjournal.com/article/6812
- NTPd Documentation: https://linux.die.net/man/8/ntpd
- NTP config for GPSd: https://wiki.archlinux.org/title/Network_Time_Protocol_daemon
- https://www.eecis.udel.edu/~mills/ntp/html/drivers/driver46.html
- https://www.berthon.eu/2017/a-time-server-in-a-container-part-1/
- https://www.lammertbies.nl/comm/info/gps-time
- https://openwrt.org/docs/guide-user/services/ntp/gps

#### GPSd:
- GPSd Documentation at https://gpsd.gitlab.io/gpsd/gpsd.html
