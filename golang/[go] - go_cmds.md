## [go] - go cmds

### go clean -modcache
This command deletes the cache downloaded along with unpacked code dependencies. These packages can be found in the $GOPATH/pkg/mod directory.

### when to use go clean -modcache
* when we want to remove our downloaded packages. It lets us download packages for reading an excel file; when we run the code. It removes the package.
* when we want to do a major upgrade to the application, and at times we want to remove all downloaded packages.

1. thudercat-space-backend

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

3. Check Go version

   ```bash
   $ go version
   ```



4. Install air

   ```bash
   $ go get -u github.com/cosmtrek/air

   # add to /.bashrc
   $ which air
   # /Users/xxx/go/bin/air
   $ code ~/.bashrc
   $ alias air=$HOME/go/bin/air
   ```



5. Install Postgresql

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



6. 透過 SQL 建立名為 `postgres` 的 superuser（預設的 superuser 會是系統的使用者）：

   ```sql
   -- create superuser of "postgres"

   CREATE ROLE postgres LOGIN SUPERUSER CREATEDB CREATEROLE REPLICATION BYPASSRLS;

   GRANT

   ALL

   ON ALL TABLES IN SCHEMA "public" TO postgres;

   ```

7. **建立 Database**



   ```bash
   # exit db bash
   $ createdb thudercat_space -O postgres -E utf8
   ```

8. **Check Database is created**

   ```bash
   postgres=# \l
   ```

9. Seed Database

   ```bash
   $ make db-seed
   ```



