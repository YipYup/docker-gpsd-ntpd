# docker-gpsd-ntpd

GPSd and NTPd inside of a docker container

-----

## Information:

### NO WARRANTY

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS". See the [LICENSE](LICENSE.md) file for details.

### Supported architectures

This container should build successfully on `amd64`, `armhf`, and `aarch64`.

GPSd exposes itself on tcp:2947 for use with external
applications while also making itself available to NTPd in
order to be a time provider for ntpd.

### Running:

Use the docker-compose.yml as standalone or copy the contents into an existing docker-compose.yml file. Be sure to make any adjustments necessary for your enviornment such as adjusting the network configuration, hostname, etc. and etc.

Be sure to edit the `.env` file to set the device parameter to the correct device name for the GPS receiver you are using. An example is provided in `.env.example`.

### Notes

#### A Word About Log Messages

This docker image and the programs GPSd and NTPd are configured with a "most compatible" approach. This means that configurations have
been adjusted to provide multiple options for connectivity for a variety of GPS devices with many protocols. Subsequently NTPd has been
configured to use multiple interface types to the various GPSd devices. Since GPS devices and the standards they support vary, it is
normal and expected that you may see warning and informational messages from the container, complaining that a device wasn't found or
that a protocol isn't supported on a given device.

For example, the output of `docker logs gpsd` shows this line repeated over and over.

```
[gpsd] gpsd:WARN: cycle-start detector failed.
```

This is from a host connected to a VK-162 u-Blox 7 GPS device over GPS.
The warning message is telling us that GPSd is unable to determine the kPPS timing from the attached GPS device. This is because this device does not provide
a kPPS compatible output, despite our configuration of the NTP daemon (NTPd) requesting the kPPS signal from GPSd when it connected to GPSd to request a PPS feed.

This message can be ignored, as it is non-fatal. NTPd will fallback and instead attempt to use a different PPS datasource per the configuration of this container, as is designed and intended when the hardware attached is unable to provide it.

---

#### Notice to users of Cisco Meraki networking gear

Cisco Meraki switches can be knocked offline when activating an NTP server that is connected to the network. The reason is due to a poor default implementation on their part of the DHCP client. Due to the nature of their model of using a Cloud Controller for configuration of their devices, their networking gear attempt is programmed in a way that continuously attempts to act as a DHCP client for each and every network seen and known by the device. This applies to all VLANs and subnets the device sees and passively discovers as traffic traverses the equipment. An unfortunate aspect of this is that their networking gear will attempt to apply any newly seen NTP servers as a "drop in" configuration in the DHCP client returned options... meaning if the device doesn't explicitly receive DHCP Option 42 configuration containing a valid NTP server, then the device will configure itself with an NTP server that it has passively discovered over the network. When the device changes timesources to use the passively discovered NTP source as a drop in for an NTP server that is not present in the DHCP server's response, the offset on the new time source can cause the Cisco Meraki device to panic and go offline, fully shutting down the network until the NTP server is removed from the network and the device no longer can contact it.

This behavior can be controlled and prevented by explicitly defining DHCP Option 42 on all of your DHCP Scope'd network configurations. I recommend setting DHCP Option 42 field to `216.239.35.0, 216.239.35.4, 216.239.35.8, 216.239.35.12` which will provide four redundant Stratum 1 NTP sources from Google's Attomic-Clock time servers, presented via AnyCast routing.

Remember to define DHCP Option 42 for every DHCP Scope which traverses the Cisco Meraki equipment, otherwise the Cisco Meraki device may see a DHCP response with a missing Option 42 and attempt to prepend the missing value with the NTP server it has passively discovered, leading to the offset time and causing the device to panic and go offline.

Further reading on the Cisco Meraki issue with NTP servers on a network while DHCP Option 42 is undefined:
https://support.neat.no/article/meraki-and-ntp-issues-with-neat-firmware/

---

### Recommended Hardware

#### GPS Modules

- **Better**: [SparkFun U-Blox Neo-M9N GPS/GNSS Receiver](https://www.sparkfun.com/products/17285) and [GPS/GNSS Antenna with SMA](https://www.amazon.com/dp/B083D59N55?tag=radardetec0b5-20)
- **Good**: Generic [u-Blox 7 USB GNSS GPS receiver (VK-162)](https://www.amazon.com/dp/B078Y52FGQ?tag=radardetec0b5-20)

---

### Thanks to:

- [kx1t](https://github.com/kx1t) for their assistance with the S6 Overlay service configuration
- [mikenye](https://github.com/mikenye) for their solid base image used in this build
- [johnboy00](https://www.rdforum.org/members/12420/) for their assistance and collaboration on the "carputer" project, and for their amazing app, the ultimate driving companion app, [JBV1](https://jbv1.net/)
- [RADAR Detector Forum](https://www.rdforum.org/) for bringing together a community of passionate civil disobedients.

---

### Further Reading:

#### NTPd:

- [NTP overview](https://en.wikipedia.org/wiki/Network_Time_Protocol)
- [Understanding NTP reach](https://www.linuxjournal.com/article/6812)
- [Official NTPd Manual Documentation](https://linux.die.net/man/8/ntpd)
- [NTPd example config for GPSd](https://wiki.archlinux.org/title/Network_Time_Protocol_daemon)
- [NTPd Internal Drivers](https://www.eecis.udel.edu/~mills/ntp/html/drivers/driver46.html)
- [NTPd reference clock driver syntax explained](https://www.eecis.udel.edu/~mills/ntp/html/refclock.html)
- https://www.berthon.eu/2017/a-time-server-in-a-container-part-1/
- https://www.lammertbies.nl/comm/info/gps-time
- https://openwrt.org/docs/guide-user/services/ntp/gps
- https://www.berthon.eu/2017/a-time-server-in-a-container-part-1/
- https://kb.meinbergglobal.com/kb/time_sync/ntp/start


#### GPSd:
- [GPSd Documentation](https://gpsd.gitlab.io/gpsd/gpsd.html)
- https://gpsd.io/gpsd-time-service-howto.html
- https://lists.gnu.org/archive/html/gpsd-users/2016-06/msg00008.html

---

### License and Copyright

#### Copyright

Copyright ©️ 2023 [YipYup](https://github.com/YipYup). All rights reserved.

#### License

This project is licensed according to the [GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007](LICENSE.md).
