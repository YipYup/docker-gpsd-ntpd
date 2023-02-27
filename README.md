# docker-gpsd
GPSd and NTPd inside of docker

GPSd exposes itself on 2947, while also making itself
available to NTPd in order to be a timeserver to ntpd.

Thanks to:
@kx1t for assistance with the S6 Overlay service configuration
