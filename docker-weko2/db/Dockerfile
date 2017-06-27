FROM centos:7

MAINTAINER mhaya@nii.ac.jp

COPY ./mariadb.repo /etc/yum.repos.d/mariadb.repo
COPY ./init.sql /root/
COPY ./initdb.sh /root/
COPY entrypoint.sh /root/

RUN chmod 700 /root/initdb.sh
RUN chmod 700 /root/entrypoint.sh

RUN yum -y install MariaDB-server MariaDB-client
COPY ./server.cnf /etc/my.cnf.d/server.cnf

RUN /root/initdb.sh
EXPOSE 3306

ENTRYPOINT [ "/root/entrypoint.sh" ]

