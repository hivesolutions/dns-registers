FROM ubuntu:latest
MAINTAINER Hive Solutions

EXPOSE 53

ADD bemisc.com /etc/bind/dns_registers/bemisc.com
ADD configuration /etc/bind/dns_registers/configuration
ADD hive /etc/bind/dns_registers/hive

RUN apt-get update && apt-get install -y -q bind9
RUN echo "include \"/etc/bind/dns_registers/configuration/hive.conf\";" >> /etc/bind/named.conf

CMD /usr/sbin/named
