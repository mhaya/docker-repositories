#!/bin/bash

set -e
set -x

mysql_install_db

chown -R mysql:mysql /var/lib/mysql

/usr/libexec/mysqld -u mysql &
mysql_pid=$!

until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

# create initial database
mysql < /root/init.sql

mysqladmin shutdown

wait $mysql_pid

# backup initial database
tar czvf /root/default_mysql.tar.gz /var/lib/mysql
