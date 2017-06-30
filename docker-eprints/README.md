# docker-eprints

手抜き。もっと自動化したい。

eprints はFQDNが必要となる。
作業前に /etc/hosts などに適当な名前を登録しておく。

## コンテナ起動

```
docker-compose build
docker-compose up -d
```

## 初期設定 



```
docker exec -it eprints bash
```

```
su - eprints -c "/opt/eprints3/bin/epadmin create"
```

- Hostname: FQDNを指定する

データベースユーザとパスワードは以下のようにする。

- Database User: eprintsuser
- Database Password: eprintpass

変更する場合は、eprints/init.sql を編集する。


設定変更後、 apache を再起動する。

```
/sbin/httpd -k restart
```

詳しい設定方法等は以下サイトを見て。

 http://wiki.eprints.org/w/Main_Page
