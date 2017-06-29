FROM centos:7

MAINTAINER mhaya@nii.ac.jp

RUN yum install -y https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm
RUN yum install -y postgresql96-server postgresql96-client postgresql96-contrib

COPY ./initdb.sh /var/lib/pgsql/9.6/initdb.sh
COPY ./entrypoint.sh /var/lib/pgsql/9.6
COPY ./pg_hba.conf /var/lib/pgsql/9.6
RUN chown postgres:postgres /var/lib/pgsql/9.6/initdb.sh
RUN chmod u+x /var/lib/pgsql/9.6/initdb.sh
RUN chown postgres:postgres /var/lib/pgsql/9.6/entrypoint.sh
RUN chmod u+x /var/lib/pgsql/9.6/entrypoint.sh
USER postgres
RUN /var/lib/pgsql/9.6/initdb.sh


EXPOSE 5432


ENTRYPOINT [ "/var/lib/pgsql/9.6/entrypoint.sh" ]

