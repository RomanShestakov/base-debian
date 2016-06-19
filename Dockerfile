FROM debian:jessie
MAINTAINER Roman Shestakov

RUN echo 'deb-src http://http.debian.net/debian jessie main' >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive

#Setup build environment for libpam
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y build-dep pam

RUN export CONFIGURE_OPTS=--disable-audit && cd /root && apt-get -b source pam && dpkg -i libpam-doc*.deb libpam-modules*.deb libpam-runtime*.deb libpam0g*.deb

RUN apt-get clean
RUN rm -rf /root/pam* /root/libpam*
