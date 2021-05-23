## Docker_General_Note

### Docker logs (live)

```bash
$ docker logs <container_id> -f
```



### Docker logs (last 10)

* -t
* -f
* --tail

```bash
$ docker logs -t -f --tail 10 <container_id>
```



### Docker build image from Dockerfile

* at Dockerfile location

```bash
$ docker build --tag <tag_name> .
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



### Create Volume

```bash
$ docker volume create --name <volume_name>
# List volumes
$ docker volume ls
# List docker volume with mounting point
$ docker volume inspect --format '{{ .Mountpoint }}' volumeNameHere
```



### Start container from image -- share volume from host

```bash
$ docker run -it --name <container_name> -p <host_port>:<container_port> -v $(pwd)/directory:/docker_directory/ <image_name>
```



### Dockerfile build

```bash
$ docker build --tag <image_tag_name> .
```



### Docker Create Network Bridge

```bash
# Check if jubo-net is created
$ sudo docker network ls
# create new bridge with 1.
$ sudo docker network create -d bridge <network_name>
```



### Create Couchdb container with admin login

```bash
$ docker run -d --name my-couchdb -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -p 5984:5984 couchdb:latest
```



 ### Get Container IP within network

```
$ docker inspect -f '{{ range.NetworkSettings.Networks }}{{ .IPAddress }}{{ end }}' <container_id>
```







