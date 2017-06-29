#!/bin/bash


cd /usr/local/src/dspace-6.0-src-release/dspace/target/dspace-installer/
ant init_installation && ant init_configs && ant install_code && ant -Dwars=true copy_webapps && ant init_geolite

chown -R tomcat:tomcat /dspace/
rm -rvf /usr/share/tomcat/webapps/*
cp -r /dspace/webapps/* /usr/share/tomcat/webapps/

#cp -f /dspace/config/dspace.cfg config/dspace.cfg
#ant -Ddspace.configuration=/dspace/config/dspace.cfg test_database
#ant fresh_install

#echo "db.cleanDisabled = false" >> /dspace/config/dspace.cfg
