### Node Version v12.19.0 ( npm v6.14.8 )

```
nvm use v12.19.0
```

### Jubox Server Structure

```
jubox
├── proto		// jubox.proto
├── certs
├── dist
├── src
    ├── config
    ├── db
    ├── types
    ├── utils
    ├── mqttBroker
    ├── iot
    			├── apiServer
    			├── auth
    			├── protocol
    						├── grpc
    									├── proto		// jubox_grpc_pb.d.ts & jubox_pb.d.ts
    									├── adapter
    									├── outbound
    									├── inbound
    						├── mqttClient
    						├── websocket
          ├── machines
          			├── mwg
          			├── vayyar
    ├── index.ts
 ├── .env
 ├── Dockerfile
 ├── package.json
```

### Transpile Proto FIles to _grpc_pb.d.* and _pb.d.*

```
0. go to dir jubo-box/server/
1. Run compile-proto.sh with command
    * npm run build:proto
2. Confirm ts proto declaration generated at src/grpc/proto
    * jubox_grpc_pb.d.ts
    * jubox_pb.d.ts
3. Confirm js proto generated at dist/grpc/proto
    * jubox_grpc_pb.js
    * jubox_pb.js
```

### CouchDb (Docker) Deployment

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

### Create Docker Network

```
0. Check if jubo-net is created
    - sudo docker net ls
    - create new bridge with 1.
1. sudo docker network create -d bridge jubo-net

```

### Jubox - TODO List

- [x] Modularized Microservice
- [x] CouchDb for Devices and Patients and Event
- [x] Space Activity db and summarize Grpc Report
- [x] Winston logger
- [x] Mwg Mattress Mqtt Client
- [x] Add Jubox Mqtt Broker Implementation
- [x] Vayyar Sensor Generation II Integrations
- [x] wiSleep Integration 
- [x] Refactor project structure
- [ ] Dockerize Project (WIP)
- [x] Refactor mwg code structure 
- [ ] Refactor vayyar code struture (WIP)
- [ ] Vayyar OTA upgrade feature (WIP)
- [ ] Add System Level Control on WIFI-AP (WIP)
- [ ] New Jubox Integration (Begin in Feb.)

```

# Server Deployment (Docker)`
​```
0. go to dir jubo-box/server/
1. confirm .env , and Dockerfile at jubo-box/server
2. update .env file according to local device settings
    - SERVER_STAT: DOCKER for docker container build
    - LOCALHOST_IP: change according to `ip addr`
    - NIS_PATIENT_API: change to device ip according to `ip addr`
    - GRPC_SERVER: change to device ip according to `ip addr`
3. Add certs folder at jubo-box/server directory
    - Add all certs & credentials
2. execute npm install & tsc command at jubo-box/server to compile from /src (*.ts) to /dist (*.js)
3. docker build --tag jubox/backend .
4.
5
​```

```



Eslint-plugin-react-hooks