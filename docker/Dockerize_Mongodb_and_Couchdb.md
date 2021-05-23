## Dockerize_Mongodb_and_Couchdb



## Couchdb

```bash
0. Download latest CouchDb Image
    * docker pull couchdb
1. Make sure jubo-box/server contains couch.env
    
2. Check if couchdb installed in machine
    * sudo dpkg -l | grep couchdb
3. Uninstall it !
    * sudo apt-get autoremove --purge couchdb
4. Use docker-compose up to deploy
```

### CouchDb (Docker) Production Deployment

0. Download latest Couchdb Image

   ```bash
   $ docker pull couchdb
   ```

1. Make sure jubox/server contains .env at ~/app

2. Check if couched already in machine

   ```bash
   $ sudo dpkg -l | grep couchdb
   ```

3. Uninstall it !

   ```bash
   $ sudo apt-get autoremove --purge couchdb
   ```

4. Use docker-compose.yml to deploy

### Test Server Docker Run Container from Image

```bash
$ docker run -d --name my-couchdb -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -p 5984:5984 couchdb:latest
```

## Mongodb

```bash
$ docker run --name test-mongo --restart -e MONGO_INITDB_ROOT_USERNAME=jello -e MONGO_INITDB_ROOT_PASSWORD=world -e MONGO_INITDB_DATABASE=testdb -d -p 27017:27017 mongo:latest --auth
```

### Connect Mongodb through docker compose network

```bash
$ docker run -it --network some-network --rm mongo mongo --host some-mongo test
```

### List all Mongodb

```
$ launchctl list | grep mongo
```

### Unload from Lanuch Agent

```
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
rm -f ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
launchctl remove homebrew.mxcl.mongodb
```







### Login mongo shell with admin role 

```
mongo -u jello
//enter password
```

### Create Admin User

```bash
// create admin user

db.createUser({
  user: "admin",
  pwd: "some-password",
  roles: [
    {
      role: "clusterAdmin",
      db: "admin"
    }
  ]
})
```

### Create user with R/RW rights 

```bash
> use admin
> db.createUser({
  user: 'super',
  pwd: 'derick',
  roles: [{
    role: 'readWrite',
    db: 'db-test'
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

### OSX: Check if any mongo service is running

```bash
$ launchctl list | grep mongo	
```

### OSX: Unload from LaunchAgent

```bash
$ launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

```

```bash
$ rm -f ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
# OR
$ rm -f ~/Library/LaunchAgents/homebrew.mxcl.mongodb-community.plist
```

```bash
$ launchctl remove homebrew.mxcl.mongodb
```

### OSX: Kill all processes related to mongod

```bash
$ pkill -f mongod	
```

### OSX: Uninstall mongodb (homebrew)

```bash
$ brew uninstall mongodb 
```

### OSX: Re-confirming if mongo related file still exists

```bash
$ ls -al /usr/local/bin/mong*
$ ls -al ~/Library/LaunchAgents
```









