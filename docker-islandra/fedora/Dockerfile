FROM ubuntu:14.04

MAINTAINER mhaya@nii.ac.jp

RUN apt-get -y update
RUN echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y software-properties-common
RUN  add-apt-repository ppa:webupd8team/java

RUN apt-get update
RUN apt-get install -y oracle-java8-installer mysql-server-5.6
COPY ./init.sql /root/
COPY ./initdb.sh /root/

RUN chmod 700 /root/initdb.sh

RUN wget http://downloads.sourceforge.net/fedora-commons/fcrepo-installer-3.5.jar



CMD ["/sbin/init"]
