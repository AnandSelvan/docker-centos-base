FROM centos

MAINTAINER Keiji Matsuzaki <futoase@gmail.com>

# setup network
# reference from https://github.com/dotcloud/docker/issues/1240#issuecomment-21807183
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

RUN yum -y update
RUN yum -y upgrade
RUN yum -y install ntp
RUN cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN ntpdate -s pool.ntp.org
ADD ./template/ntp.conf /etc/ntp.conf
RUN chkconfig ntpdate on
RUN chkconfig ntpd on
ADD ./template/ntpd.sh /root/ntpd.sh
RUN chmod +x /root/ntpd.sh

CMD ["/root/ntpd.sh"]
