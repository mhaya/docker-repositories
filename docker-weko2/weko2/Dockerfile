FROM centos:7

MAINTAINER mhaya@nii.ac.jp

# install httpd
RUN yum install -y httpd
COPY ./httpd.conf /etc/httpd/conf/httpd.conf

# install yum repositories
RUN yum install -y wget
## epel
RUN wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
RUN rpm -ivh epel-release-7-10.noarch.rpm
## remi
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN rpm -ivh remi-release-7.rpm
## nux-dextop
RUN wget http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
RUN rpm -ivh nux-dextop-release-0-5.el7.nux.noarch.rpm

# install PHP
RUN yum -y install --enablerepo=remi gd-last
RUN yum -y install --enablerepo=remi-php56 php php-devel php-mbstring 
RUN yum -y install --enablerepo=remi-php56 php-mysqlnd php-gd php-pear php-pecl-apcu php-xml
COPY ./php.ini /etc/php.ini

#
RUN yum -y install poppler poppler-utils
RUN yum -y install ImageMagick
RUN yum -y install mecab mecab-ipadic
RUN yum -y install ffmpeg
## wv
RUN yum -y install make glib2-devel libgsf libgsf-devel gcc gcc-c++ elinks
COPY ./wv-1.2.4.tar.gz /usr/local/src/wv-1.2.4.tar.gz
RUN cd /usr/local/src; tar zxvf wv-1.2.4.tar.gz
RUN cd /usr/local/src/wv-1.2.4;./configure;make;make install
## xlhtml
RUN wget http://repo.iotti.biz/CentOS/6/x86_64/xlhtml-0.5-17.el6.lux.1.x86_64.rpm
RUN yum -y localinstall xlhtml-0.5-17.el6.lux.1.x86_64.rpm
## qpdf
RUN yum -y install qpdf
RUN yum -y install mlocate
RUN updatedb

# deploy NetCommons & WEKO
COPY ./NetCommons-2.4.2.1.tar.gz /usr/local/src/NetCommons-2.4.2.1.tar.gz
RUN cd /usr/local/src;tar zxvf NetCommons-2.4.2.1.tar.gz
RUN ln -s /usr/local/src/NetCommons-2.4.2.1 /var/www/nc2
COPY ./weko2.4.0.tar.gz /usr/local/src/weko2.4.0.tar.gz
RUN cd /usr/local/src;tar zxvf weko2.4.0.tar.gz
RUN ln -s /usr/local/src/repository /var/www/nc2/html/webapp/modules/repository
RUN chown -R apache:apache /var/www/nc2 
RUN chown -h apache:apache /var/www/nc2/html/webapp/modules/repository

EXPOSE 80
CMD /usr/sbin/httpd -DFOREGROUND
