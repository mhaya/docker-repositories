# docker-weko2

## ディレクトリ構造 

```
.
├── README.md
├── db
│   ├── Dockerfile
│   ├── db.env
│   ├── entrypoint.sh
│   ├── init.sql
│   ├── initdb.sh
│   ├── mariadb.repo
│   └── server.cnf
├── docker-compose.yml
└── weko
    ├── Dockerfile
    ├── NetCommons-2.4.2.1.tar.gz
    ├── httpd.conf
    ├── php.ini
    ├── weko2.3.4.tar.gz
    └── wv-1.2.4.tar.gz
```

ディレクトリに無いファイルは下記から入手し、
所定の場所に設置する。

NetCoomons-2.4.2.1.tar.gz: http://www.netcommons.org/

weko2.3.4.tar.gz: http://weko.at.nii.ac.jp/

wv-1.2.4.tar.gz: https://sourceforge.net/projects/wvware/files/wv/1.2.4/

## コンテナ起動

```
docker-compose build
docker-compsoe up -d
```

## 初期設定

http://localhost:8080/

DB関係のパラメータは以下を指定する。

Database:mysql
Database Hostname: db
Database Username: nc2user
Database Password: nc2pass
Database Name    : nc2db

DB関係のパラメータを変更したい場合は以下を編集する。

ref. db/init.sql




docker-compose stop
docker-compose down
docker exec -it db bash
docker exec -it weko bash
docker logs db
docker logs weko
docker ps
docker-compose ps
