## Dockerize_Mongodb_and_Couchdb



## Couchdb

```
0. Download latest CouchDb Image
    * docker pull couchdb
1. Make sure jubo-box/server contains couch.env
    
2. Check if couchdb installed in machine
    * sudo dpkg -l | grep couchdb
3. Uninstall it !
    * sudo apt-get autoremove --purge couchdb
4. Use docker-compose up to deploy
```



```
$ docker run -d --name my-couchdb -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -p 5984:5984 couchdb:latest
```

## Mongodb

```bash
$ docker run --name some-mongo -e MONGO_INITDB_ROOT_USERNAME=jello -e MONGO_INITDB_ROOT_PASSWORD=world -e MONGO_INITDB_DATABASE=testdb -d -p 27017:27017 mongo:latest --auth
```

### Connect Mongodb through docker compose network

```
$ docker run -it --network some-network --rm mongo mongo --host some-mongo test
```

### Login mongo shell with admin role 

```
mongo -u jello
//enter password
```

### Create user with R/RW rights 

```bash
> use admin
> db.createUser({
  user: 'user-name',
  pwd: 'some-password',
  roles: [{
    role: 'readWrite',
    db: 'db-name'
  }]
})
```

### Switch to Application db

```bash
> use db-name
```

### Create Collection

```bash
> db.createCollection("mycollection")
```

### Create Colletion with Options

```bash
> db.createCollection("mycol", { capped: true, size: 6142800, max: 10000 } )
```

### Insert a document

```
> db.movie.insert({"name":"tutorials point"})
```





### Sample Mongo yml

```
# Use root/example as user/password credentials
version: '3.1'

services:

  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
```









