FROM hivesolutions/alpine:latest
MAINTAINER Hive Solutions

EXPOSE 53/udp

ADD bemisc.com /etc/bind/dns_registers/bemisc.com
ADD configuration /etc/bind/dns_registers/configuration
ADD hive /etc/bind/dns_registers/hive

RUN apk update && apk add bind
RUN echo "include \"/etc/bind/dns_registers/configuration/bemisc.com.conf\";" >> cat /etc/bind/named.conf.authoritative
RUN echo "include \"/etc/bind/dns_registers/configuration/hive.conf\";" >> cat /etc/bind/named.conf.authoritative

CMD ["/usr/sbin/named", "-g"]
