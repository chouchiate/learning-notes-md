## [PostgreSql] Setup 學習筆記

#### 安裝 postgreSQL

```bash
# macOS Homebrew
$ brew install postgresql
# start service
$ brew services start postgresql
# stop servie
$ brew services stop postgresql
```
#### 建立使用者

```bash
# 登入 DB
$ psql postgres

```

* 透過 SQL 建名 `postgres` 的 superuser 

```sql
-- create superuser of "postgres"
CREATE ROLE postgres LOGIN SUPERUSER CREATEDB CREATEROLE REPLICATION BYPASSRLS;
GRANT
ALL
ON ALL TABLES IN SCHEMA "public" TO postgres;
```

* 建立 Database

```bash
createdb db_name -0 postgres -E utf8
```



### 安裝 Docker PostgreSql

#### Environment Variables

- POSTGRES_PASSWORD
- POSTGRES_USER
- POSTGRES_DB
- POSTGRES_INITDB_ARGS
- POSTGRES_HOST_AUTH_METHOD
- PGDATA
- 





###  安裝 Postico

* https://eggerapps.at/postico/
* 

### Connect Through Cloud Sql Proxy

```bash
# Download for Mac Os
$ curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
# make it executable
$ chmod +x cloud_sql_proxy
# run it (google-cloud-sdk must setup properly first)
$ cloud_sql_proxy -instances=<project>:<location>:<db_name>=tcp:5432

```

