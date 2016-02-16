FROM hivesolutions/alpine:latest
MAINTAINER Hive Solutions

EXPOSE 53/udp

ADD bemisc.com /etc/bind/dns_registers/bemisc.com
ADD configuration /etc/bind/dns_registers/configuration
ADD hive /etc/bind/dns_registers/hive

RUN apk update && apk add bind
RUN cp -p /etc/bind/named.conf.authoritative /etc/bind/named.conf
RUN sed -i 's/listen-on { 127.0.0.1; };/listen-on { any; };/g' /etc/bind/named.conf
RUN sed -i 's/listen-on-v6 { none; };/listen-on-v6 { any; };/g' /etc/bind/named.conf
RUN echo "include \"/etc/bind/dns_registers/configuration/bemisc.com.conf\";" >> /etc/bind/named.conf
RUN echo "include \"/etc/bind/dns_registers/configuration/hive.conf\";" >> /etc/bind/named.conf

CMD ["/usr/sbin/named", "-g"]
