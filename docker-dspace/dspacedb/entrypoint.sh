#!/bin/bash

set -e
set -x

[ "$(ls -A /var/lib/pgsql/9.6/data)" ] && echo "Running with existing database in /var/lib/pgsql/9.6/data" || ( echo 'Populate initial db'; tar xpzvf /var/lib/pgsql/9.6/pgdata.tar.gz )

/usr/pgsql-9.6/bin/postgres -D /var/lib/pgsql/9.6/data

