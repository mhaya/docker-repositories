FROM centos:7

MAINTAINER mhaya@nii.ac.jp

COPY ./init.sql /root/
COPY ./initdb.sh /sbin/
COPY entrypoint.sh /sbin/

RUN chmod +x /sbin/entrypoint.sh
RUN chmod +x /sbin/initdb.sh

RUN yum -y install mariadb-server

RUN /sbin/initdb.sh
EXPOSE 3306

ENTRYPOINT [ "/sbin/entrypoint.sh" ]

#CMD ["/sbin/init"]
