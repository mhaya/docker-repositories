USE mysql;
DELETE FROM user WHERE user='';
GRANT ALL ON *.* TO eprintsuser@"%" IDENTIFIED BY 'eprintspass';

