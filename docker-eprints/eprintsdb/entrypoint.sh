#!/bin/bash

set -e
set -x

[ "$(ls -A /var/lib/mysql)" ] && echo "Running with existing database in /var/lib/mysql" || ( echo 'Populate initial db'; tar xpzvf /root/default_mysql.tar.gz )

/usr/libexec/mysqld -u mysql

 
