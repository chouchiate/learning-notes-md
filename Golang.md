

## Golang

1. Jubo-space-backend

2. Change env variable for GOPATH

   ```bash
   $ # ~/.zshrc
   $ code /.zshrc
   or
   $ # ~/.bash_profile
   $ code /.bash_profile
   export GOPATH=$HOME/go
   export PATH=$PATH:$GOPATH/bin
   
   $ source ~/.zshrc
   or
   $ source ~/.bash_profile
   ```

   

3. Install air

   ```bash
   # install
   $ go get -u github.com/cosmtrek/air
   # use at project where main.go resides
   $ air
   ```

   

4. Install Postgresql

   ```bash
   # install postgresql with homebrew
   $ brew isntall postgresql
   
   # check brew services
   $ brew services list
   $ brew services start postgresql
   # entered postgres bash
   $ psql postgres
   #list db roles
   postgres=# \du
   
   ```

   

5. 透過 SQL 建立名為 `postgres` 的 superuser（預設的 superuser 會是系統的使用者）：

   ```sql
   -- create superuser of "postgres"
   
   CREATE ROLE postgres LOGIN SUPERUSER CREATEDB CREATEROLE REPLICATION BYPASSRLS;
   
   GRANT
   
   ALL
   
   ON ALL TABLES IN SCHEMA "public" TO postgres;
   
   ```

5. **建立 Database**

   

   ```bash
   # exit db bash
   $ createdb jubo_space -O postgres -E utf8
   ```

6. **Check Database is created**

   ```bash
   postgres=# \l
   ```

7. Seed Database

   ```bash
   $ make db-seed
   ```

   

