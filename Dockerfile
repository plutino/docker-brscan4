FROM ubuntu:16.04
MAINTAINER Ke Zhang <plutino@gmail.com>

RUN apt-get -y update && apt-get -y upgrade && apt-get -y clean
RUN apt-get -y install sane sane-utils ghostscript netpbm x11-common- && apt-get -y clean

ADD drivers /opt/brother/docker_skey/drivers
RUN dpkg -i /opt/brother/docker_skey/drivers/*.deb

ADD config /opt/brother/docker_skey/config
ADD scripts /opt/brother/docker_skey/scripts

RUN cfg=`ls /opt/brother/scanner/brscan-skey/brscan-skey-*.cfg`; ln -sfn /opt/brother/docker_skey/config/brscan-skey.cfg $cfg

ENV SCANNER_NAME="venus"
ENV SCANNER_MODEL="DCP-7065DN"
ENV SCANNER_IP_ADDRESS="192.168.1.16"

#VOLUME /scans
CMD /opt/brother/docker_skey/scripts/start.sh
