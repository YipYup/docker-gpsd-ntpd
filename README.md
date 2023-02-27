# docker-gpsd
GPSd and NTPd inside of docker

GPSd exposes itself on 2947, while also making itself
available to NTPd in order to be a timeserver to ntpd.

Thanks to:
- [kx1t](https://github.com/kx1t) for their assistance with the S6 Overlay service configuration
- [johnboy00](https://www.rdforum.org/members/12420/) for their assistance and collaboration on the "carputer" project, and for their amazing app, the ultimate driving companion app, [JBV1](https://play.google.com/store/apps/details?id=com.johnboysoftware.jbv1)