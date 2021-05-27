## [PostgreSql] Setup 學習筆記

#### 安裝 postgreSQL

```bash
# macOS Homebrew
$ brew install postgresql
$ brew services start postgresql


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

