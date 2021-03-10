

## Influx Db

### docker image run

```bash
docker run --name influxdb -p 8086:8086 influxdb:2.0.4
```



### docker container with volumn

```bash
docker run --name influxdb -p 8086:8086 --volume $PWD:/root/.influxdbv2 influxdb:2.0.4
```



