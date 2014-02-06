FROM centos

MAINTAINER Keiji Matsuzaki <futoase@gmail.com>

RUN yum -y update
RUN yum -y upgrade
RUN yum -y install ntp
RUN cp -p /usr/share/zoneinfo/UTC /etc/localtime
RUN ntpdate -s pool.ntp.org
ADD ./template/ntp.conf /etc/ntp.conf
RUN chkconfig ntpdate on
RUN chkconfig ntpd on
