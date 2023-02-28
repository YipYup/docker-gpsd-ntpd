# docker-gpsd
GPSd and NTPd inside of docker

GPSd exposes itself on 2947, while also making itself
available to NTPd in order to be a timeserver to ntpd.

### Thanks to:
- [kx1t](https://github.com/kx1t) for their assistance with the S6 Overlay service configuration
- [johnboy00](https://www.rdforum.org/members/12420/) for their assistance and collaboration on the "carputer" project, and for their amazing app, the ultimate driving companion app, [JBV1](https://play.google.com/store/apps/details?id=com.johnboysoftware.jbv1)
- [RADAR Detector Forum](https://www.rdforum.org/) for bringing together a community of passionate civil disobedients.

### Information:

#### NTPd:
- NTP overview: https://en.wikipedia.org/wiki/Network_Time_Protocol
- Understanding NTP reach: https://www.linuxjournal.com/article/6812
- NTPd Documentation: https://linux.die.net/man/8/ntpd
- NTP config for GPSd: https://wiki.archlinux.org/title/Network_Time_Protocol_daemon

#### GPSd:
- GPSd Documentation at https://gpsd.gitlab.io/gpsd/gpsd.html