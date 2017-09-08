create database fedora3;
create user 'fedoraAdmin'@'%' identified by 'password';
grant all on fedora3.* to 'fedoraAdmin'@'%';
alter database fedora3 default character set utf8;
alter database fedora3 default collate utf8_bin;
flush privileges;


