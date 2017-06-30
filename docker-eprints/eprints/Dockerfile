FROM centos:7

MAINTAINER mhaya@nii.ac.jp

RUN adduser eprints
RUN yum -y install gcc make httpd httpd-devel perl 

COPY ./init.sql /root/
COPY ./initdb.sh /sbin/
COPY entrypoint.sh /sbin/
RUN chmod +x /sbin/entrypoint.sh
RUN chmod +x /sbin/initdb.sh
RUN yum -y install mariadb-server
RUN /sbin/initdb.sh

RUN yum -y install perl-Digest-MD5 perl-Data-Dumper perl-ExtUtils-Embed perl-App-cpanminus perl-DBI perl-CGI perl-XML-Parser perl-DBD-MySQL
COPY ./mod_perl-2.0.10.tar.gz /usr/local/src
RUN cd /usr/local/src/;tar zxvf mod_perl-2.0.10.tar.gz;cd mod_perl-2.0.10;perl Makefile.PL;make;make install
COPY ./mod_perl.conf /etc/httpd/conf.modules.d/ 
RUN cd /usr/local/src/;curl -O http://files.eprints.org/1073/2/eprints-3.3.15.tar.gz; tar zxvf eprints-3.3.15.tar.gz; cd eprints-3.3.15;./configure
RUN cd /usr/local/src/eprints-3.3.15; chown -R root: . ; chmod +x ./install.pl; ./install.pl
RUN su - eprints -c "/opt/eprints3/bin/generate_apacheconf"
RUN sed -i "s/Include /IncludeOptional /g" /opt/eprints3/cfg/apache.conf
RUN echo "Include /opt/eprints3/cfg/apache.conf" > /etc/httpd/conf.modules.d/00perl.conf 

COPY httpd.conf /etc/httpd/conf/httpd.conf


COPY epaadmincreate.sh /sbin/
RUN chmod +x /sbin/epaadmincreate.sh

EXPOSE 80

ENTRYPOINT [ "/sbin/entrypoint.sh" ]
#CMD ["/sbin/init"]
