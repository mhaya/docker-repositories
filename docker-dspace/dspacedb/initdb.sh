#!/bin/bash

set -e
set -x

/usr/pgsql-9.6/bin/initdb --encoding=UTF8 --no-locale -D /var/lib/pgsql/9.6/data
/usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/9.6/data start
postgres_pid=$!

until /usr/pgsql-9.6/bin/pg_isready  > /dev/null 2> /dev/null; do
  echo -n "."; sleep 0.2
done

psql -c "CREATE USER dspace WITH PASSWORD 'dspace';"
createdb --username=postgres --owner=dspace --encoding=UNICODE dspace
psql --username=postgres dspace -c "CREATE EXTENSION pgcrypto;"

/usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/9.6/data stop

mv /var/lib/pgsql/9.6/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses='*'/g" /var/lib/pgsql/9.6/data/postgresql.conf


wait $postgres_pid

tar czvf /var/lib/pgsql/9.6/pgdata.tar.gz /var/lib/pgsql/9.6/data

