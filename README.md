# docker-gpsd
GPSd and NTPd inside of a docker container

-----

## Information:

### Supported architectures
This container should build successfully on `amd64`, `armhf`, and `aarch64`.

GPSd exposes itself on tcp:2947 for use with external
applications while also making itself available to NTPd in
order to be a time provider for ntpd.

---

### Recommended Hardware

#### GPS Modules
- Better: SparkFun U-Blox NEO-M9N Breakout Board with USB-C and SMA Connector
- Good: Generic U-Blox 7 USB GNSS receiver

---

### Thanks to:
- [kx1t](https://github.com/kx1t) for their assistance with the S6 Overlay service configuration
- [mikenye](https://github.com/mikenye) for their solid base image used in this build
- [johnboy00](https://www.rdforum.org/members/12420/) for their assistance and collaboration on the "carputer" project, and for their amazing app, the ultimate driving companion app, [JBV1](https://jbv1.net/)
- [RADAR Detector Forum](https://www.rdforum.org/) for bringing together a community of passionate civil disobedients.

---

### Further Reading:

#### NTPd:
- NTP overview: https://en.wikipedia.org/wiki/Network_Time_Protocol
- Understanding NTP reach: https://www.linuxjournal.com/article/6812
- NTPd Documentation: https://linux.die.net/man/8/ntpd
- NTP config for GPSd: https://wiki.archlinux.org/title/Network_Time_Protocol_daemon
- https://www.eecis.udel.edu/~mills/ntp/html/drivers/driver46.html
- https://www.berthon.eu/2017/a-time-server-in-a-container-part-1/
- https://www.lammertbies.nl/comm/info/gps-time
- https://openwrt.org/docs/guide-user/services/ntp/gps
- https://www.berthon.eu/2017/a-time-server-in-a-container-part-1/

#### GPSd:
- GPSd Documentation at https://gpsd.gitlab.io/gpsd/gpsd.html
- https://gpsd.io/gpsd-time-service-howto.html
- https://lists.gnu.org/archive/html/gpsd-users/2016-06/msg00008.html

---

### License and Copyright

#### Copyright
Copyright ©️ 2023 [YipYup](https://github.com/YipYup). All rights reserved.

#### License
This project is licensed according to the [GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007](LICENSE.md).
