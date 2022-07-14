## [docker] - CLI 筆記

* List Containers
```bash
$ docker ps --all
```
* List Images
```bash
$ docker image ls
```
* Build Image --tag <tag/name>(with Ddooockerfile)
```bash
$ docker build --tag thudercatx/backend .
```
* Run Image of tag <tag/name>:latest Detached
```bash
$ docker run -d --restart=always -p 3000:3000 -p 50052:50052 thudercatx/backend:latest
```


*
```bash
$ docker stop
```
```bash
$ docker rm 
