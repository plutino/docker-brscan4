FROM ubuntu:16.04
MAINTAINER Ke Zhang <plutino@gmail.com>

ENV SCANNER_NAME="venus"
ENV SCANNER_MODEL="DCP-7065DN"
ENV SCANNER_IP_ADDRESS="192.168.1.16"

RUN apt-get update && apt-get -yy upgrade
RUN apt-get -yy install sane-utils ghostscript netpbm sane

ADD drivers /opt/brother/docker_skey/drivers
RUN dpkg -i /opt/brother/docker_skey/drivers/*.deb

RUN mkdir /scans

ADD config /opt/brother/docker_skey/config
ADD scripts /opt/brother/docker_skey/scripts

RUN /bin/bash -c "cfg=`ls /opt/brother/scanner/brscan-skey/brscan-skey-*.cfg`; ln -sfn /opt/brother/docker_skey/config/brscan-skey.cfg $cfg"

#CMD /opt/brother/docker_skey/scripts/start.sh