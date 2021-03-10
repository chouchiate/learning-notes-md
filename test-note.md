
## mosquitto-client Ubuntu Installation
```
$ sudo apt-get install -y mosquitto-clients
```


# - Vayyar HomeGen II Test
# Movement Track
```
mosquitto_pub -t '/devices/id_MzA6QUU6QTQ6RTQ6MEI6QjA/events' -m "{\"type\":4,\"payload\":{\"presenceDetected\":true,\"presenceTargetType\":0,\"roomPresenceIndication\":1,\"timestamp\":1602057924061,\"trackerTargets\":[{\"id\":0,\"xPosCm\":11,\"yPosCm\":36,\"zPosCm\":131,\"amplitude\":0,\"posture\":1},{\"id\":5,\"xPosCm\":-33,\"yPosCm\":581,\"zPosCm\":9,\"amplitude\":0,\"posture\":3}],\"presenceRegionMap\":{\"0\":0,\"1\":0,\"2\":0,\"3\":0}}}" -p 1883
```
# Fall Detect - fall_detected
```
mosquitto_pub -t '/devices/id_MzA6QUU6QTQ6RTQ6MEI6QjA/events' -m "{\"payload\":{\"deviceId\":\"id_MzA6QUU6QTQ6RTQ6MEI6QjA\",\"isLearning\":false,\"isSilent\":false,\"isSimulated\":false,\"status\":\"fall_detected\",\"statusUpdateTimestamp\":1603076788003,\"timestamp\":1603076788003,\"type\":\"fall\"},\"type\":5}" -p 1883
```
# Fall Detect - fall_confirmed
```
mosquitto_pub -t '/devices/id_MzA6QUU6QTQ6RTQ6MEI6QjA/events' -m "{\"payload\":{\"deviceId\":\"id_MzA6QUU6QTQ6RTQ6MEI6QjA\",\"isLearning\":false,\"isSilent\":false,\"isSimulated\":false,\"status\":\"fall_confirmed\",\"statusUpdateTimestamp\":1603076788003,\"timestamp\":1603076795004,\"endTimestamp\":1603076795004,\"type\":\"fall\",\"eventId\":\"ga0y5ur7bK85qnP1uTq4\"},\"type\":5}" -p 1883
```
# Fall Detect - calling
```
mosquitto_pub -t '/devices/id_MzA6QUU6QTQ6RTQ6MEI6QjA/events' -m "{\"payload\":{\"deviceId\":\"id_MzA6QUU6QTQ6RTQ6MEI6QjA\",\"isLearning\":false,\"isSilent\":false,\"isSimulated\":false,\"status\":\"calling\",\"statusUpdateTimestamp\":1603076795004,\"timestamp\":1603076802104,\"endTimestamp\":1603076802104,\"type\":\"fall\",\"eventId\":\"ga0y5ur7bK85qnP1uTq4\"},\"type\":5}" -p 1883
```
# Fall Detect - finished
```
mosquitto_pub -t '/devices/id_MzA6QUU6QTQ6RTQ6MEI6QjA/events' -m "{\"payload\":{\"deviceId\":\"id_MzA6QUU6QTQ6RTQ6MEI6QjA\",\"isLearning\":false,\"isSilent\":false,\"isSimulated\":false,\"status\":\"finished\",\"statusUpdateTimestamp\":1603076802104,\"timestamp\":1603076831113,\"endTimestamp\":1603076831113,\"type\":\"fall\",\"eventId\":\"ga0y5ur7bK85qnP1uTq4\"},\"type\":5}" -p 1883
```
```
mosquitto_sub -p 1883 -t '/devices/id_MzA6QUU6QTQ6RTQ6MEI6QjA/events' 
```

# MWG Mattress MQTT Test API

### MWG Config Test
```
mosquitto_pub -t 'mwg/config' -m "{\"mattressMac\": \"01BA4C1A\",\"statusReportInterval\": \"10\",\"dayTime\":{\"offBedSensitivity\": \"2\",\"awayFromBedAlarmDuration\": \"15\",\"onBedLongStayDuration\": \"60\",\"timeStartAt\": \"09:00:00\"},\"nightTime\":{\"offBedSensitivity\": \"2\",\"awayFromBedAlarmDuration\": \"30\",\"onBedLongStayDuration\": \"120\",\"timeStartAt\": \"17:00:00\"}}" -p 1883
```

### MWG Restart test
```
mosquitto_pub -t 'mwg/restart' -m "{\"mattressMac\": \"01BA4C1A\"}" -p 1883
```
### Mwg 

### MWG Remove Registered Bed
```

mosquitto_pub -t 'mwg/MwgDeleteRegisteredBedApi' -m "{\"mattressMac\":\"\"}" -p 1883


```
### Mosquitto test sub all topics
```
mosquitto_sub -p 1883 -t "#"
```
### MwgStatusApi :  
```
mosquitto_pub -t 'MwgStatusApi' -m "{\"mattressMac\":\"01BA6AF5\",\"bedStateAlertLevel\":\"0\",\"bedState\":\"15\"}" -p 1883
```
mosquitto_pub -t 'MwgStatusApi' -m '{'mattressMac':'01BA6AF5','bedStateAlertLevel':0,'bedState':15}' -p 1883
```
# MWG Mattress

### mwg/state
```
mosquitto_pub -t 'mwg/state' -m "{\"timestamp\":\"2020-12-28T12:54:14.288693\",\"deviceState\":{\"bedState\":1,\"timestamp\":\"2020-12-25T17:37:43.00000\",\"bedStateAlertLevel\":0,\"mattressMac\":\"01BA4C1A\"}}"
```

### mwg/events
mosquitto_pub -t 'mwg/events' -m "{\"timestamp\":\"2020-12-28T16:53:12.052448\",\"events\":{\"mattressMac\":\"01BA4C1A\",\"bedStateAlertLevel\":\"0\",\"bedState\":\"208\"}}"

### mwg/events/pwup
mosquitto_pub -t 'mwg/events/pwup' -m "{\"timestamp\":\"2020-12-28T16:52:17.680851\"}"

### mwg/events/config
mosquitto_pub -t 'mwg/events/config' -m "{\"timestamp\":\"2020-12-28T17:02:06.631823\",\"config\":{\"mattressMac\":\"01B0A4C1A\",\"dayTime\":{\"offBedSensitivity\":\"2\",\"awayFromBedAlarmDuration\":\"15\",\"onBedLongStayDuration\":\"60\",\"timeStartAt\":\"9:00:00\"},\"nightTime\":{\"offBedSensitivity\":\"2\",\"awayFromBedAlarmDuration\":\"30\",\"onBedLongStayDuration\":\"120\",\"timeStartAt\":\"17:00:00\"}}}"

### MwgSleepInfoApi 
```
mosquitto_pub -t 'mwg/MwgSleepInfoApi' -m "{\"mattressMac\":\"01BA4C1A\",\"sleepStartTime\":\"2020-07-20 11:01:40\",\"sleepEndTime\":\"2020-07-20 12:03:16\",\"sleepLatency\":1694,\"sleepEffectiveness\":54.167,\"turnOverCnt\":5,\"notInBedCnt\":0,\"totalNotInBedTime\":0}" -p 1883
```
### MwgRegisteredBedApi
```
mosquitto_pub -t 'MwgRegisteredBedApi' -m "{\"mattressMac\":[\"01BA6B25\",\"01BA6AFE\",\"01BA6B41\",\"01BA6AF5\",\"01BA6B02\",\"01BA6B3C\"]}" -p 1883
```
### MwgRegisteredBedApi/Request
mosquitto_pub -t 'MwgRegisteredBedApi/Request' -m "{}" -p 1883

### MwgOnlineBedApi
```
#offline test
```
mosquitto_pub -t "MwgOnlineBedApi" -m "{\"mattressMac\":[\"01BA6B25\",\"01BA6AFE\",\"01BA6AF5\",\"01BA6B3C\"]}" -p 1883
```
#online test
```
mosquitto_pub -t "MwgOnlineBedApi" -m "{\"mattressMac\":[\"01BA6B25\",\"01BA6AFE\",\"01BA6AF5\",\"01BA6B3C\",\"01BA6B02\",\"01BA6B41\",\"01BBAA33\"]}" -p 1883

# CouchDb
```
docker run -dit -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=50868012 --restart always -p 5984:5984 --name jubox-couchdb couchdb:latest
```


# - Mosquitto broker Setup
```
sudo docker run -d -p 1883:1883 eclipse-mosquitto:latest

```

```