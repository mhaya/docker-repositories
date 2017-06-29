FROM centos:7

MAINTAINER mhaya@nii.ac.jp

RUN yum install -y wget maven ant postgresql tomcat
RUN cd /usr/local/src; wget "https://github.com/DSpace/DSpace/releases/download/dspace-6.0/dspace-6.0-src-release.tar.gz"
RUN useradd -m dspace
RUN cd /usr/local/src; tar zxvf dspace-6.0-src-release.tar.gz

RUN cd /usr/local/src/dspace-6.0-src-release/dspace/config/;cp local.cfg.EXAMPLE local.cfg
RUN cd /usr/local/src/dspace-6.0-src-release/dspace/config/;sed -i "s/localhost:5432/dspacedb:5432/g" *.cfg 
RUN mkdir /dspace ; chown -R dspace:dspace /dspace
RUN cd /usr/local/src/dspace-6.0-src-release/dspace/ ; mvn package
RUN sed -i 's/localhost:5432/dspacedb:5432/g' /usr/local/src/dspace-6.0-src-release/dspace/target/dspace-installer/config/*.cfg
COPY ./init.sh /root/init.sh
RUN chmod +x /root/init.sh ; /root/init.sh
#RUN cd /usr/local/src/dspace-6.0-src-release/dspace/target/dspace-installer/; ant init_installation init_configs install_code copy_webapps init_geolite
#RUN cd /usr/local/src/dspace-6.0-src-release/dspace/target/dspace-installer/; ant fresh_install
#RUN chown -R tomcat:tomcat /dspace/
#RUN cp -r /dspace/webapps/* /usr/share/tomcat/webapps/

COPY ./createadmin.sh /sbin/createadmin.sh
RUN chmod +x /sbin/createadmin.sh

COPY ./testdb.sh /sbin/testdb.sh
RUN chmod +x /sbin/testdb.sh

#COPY ./entrypoint.sh /sbin/entrypoint.sh
#RUN chmod +x /sbin/entrypoint.sh

USER tomcat
CMD ["/usr/libexec/tomcat/server","start"]

#ENTRYPOINT [ "/sbin/entrypoint.sh" ]
