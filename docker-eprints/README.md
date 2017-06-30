# docker-eprints

結構手抜き。もっと自動化したい。

eprints はFQDNが必要となる。
作業前に /etc/hosts などに適当な名前を登録しておく。

## コンテナ起動

```
docker-compose build
docker-compose up -d
```

## eprintsの初期設定

```
docker exec -it eprints bash
```

```
su - eprints -c "/opt/eprints3/bin/epadmin create"
```

設定変更後は apache を再起動する。

```
/sbin/httpd -k stop
/sbin/httpd -k start
```

詳しい設定方法等は以下サイトを見て。

 http://wiki.eprints.org/w/Main_Page
