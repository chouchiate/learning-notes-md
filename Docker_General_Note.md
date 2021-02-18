## Docker_General_Note

### docker logs (live)

```bash
$ docker logs <container_id> -f
```

### docker logs (last 10)

* -t
* -f
* --tail

```bash
$ docker logs -t -f --tail 10 <container_id>
```

### List Images

```bash
$ docker image ls					
```

### List Containers

* -a: all include stopped

```bash
$ docker ps	-a
```

### Stop, Kill, Remove Container

```bash
$ docker stop <container Id>
$ docker rm <container Id>
```

### Entering Container Bash

```bash
$ docker exec -it <container_name> bash
```

### Start container from image -- share volume from host

```bash
$ docker run -it --name <container_name> -p <container_port>:<host_port> -v $(pwd)/directory <image_name>
```

### Dockerfile build

```bash
$ docker build --tag <image_tag_name> .
```



### Create Couchdb container with admin login

```bash
$ docker run -d --name my-couchdb -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -p 5984:5984 couchdb:latest
```







