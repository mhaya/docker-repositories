#!/bin/bash

set -e
set -x

/etc/init.d/mysql start

until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

mysql < /root/init.sql

wait `cat /var/run/mysqld/mysqld.pid`

/etc/init.d/mysql stop
tar czvf /root/default_mysql.tar.gz /var/lib/mysql

