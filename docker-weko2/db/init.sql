INSTALL PLUGIN mroonga SONAME 'ha_mroonga.so';
CREATE FUNCTION last_insert_grn_id RETURNS INTEGER SONAME 'ha_mroonga.so';
CREATE FUNCTION mroonga_snippet RETURNS STRING SONAME 'ha_mroonga.so';
CREATE FUNCTION mroonga_command RETURNS STRING SONAME 'ha_mroonga.so';
CREATE FUNCTION mroonga_escape RETURNS STRING SONAME 'ha_mroonga.so';

CREATE DATABASE nc2db DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mysql;
DELETE FROM user WHERE user='';
GRANT ALL ON nc2db.* TO nc2user@"%" IDENTIFIED BY 'nc2pass';


