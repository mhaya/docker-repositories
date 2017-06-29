#docker-dspace

## コンテナ起動

```
docker-compose build
docker-compose up -d
```

## データベースの初期化（コンテナ起動後一回限り） 

```
docker exec -it dspace /sbin/testdb.sh
```

## 管理者の作成

```
docker exec -it dspace /sbin/createadmin.sh
```

## アクセス

- http://localhost:8080/xmlui/
- http://localhost:8080/jspui/

