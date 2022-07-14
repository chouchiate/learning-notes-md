## thudercatx_Work_Items_0128_2021_Updated



New Error Handle Idea Test @ mwgMain( )

```
        mqttClient.main('mwg',mwgSubTopicList,mqTopicController)
        .catch((err: AppError) => {
            console.log('mwgMain',err)
        })
```



Need Input method to add new device to Mongdb 

	* CSV from vendor 
	* load CSV to MongoDb and Generate and append New deviceId
	* Deliver CSV for 博融

* 仁康
  * MWG EVENT hourly persistence
  * MWG Event to Db (hourly)
  * MWG Event Timeseries Hourly Schema
  * MWG Event to Grpc
  * MWG SleepInfo Schema
  * MWG SleepInfo to Grpc
  * MWG SleepInfo to MongoDb
  * Test with Frontend
* Start Migration to GCP
  * Wisleep Mongo schema
  * Wisleep 
  * MongoDb to third party
  * Remove Aedes
  * Add Mosquitto Container
  * Dockerize Container to docker-compose
  * Test MQTT with MWG
  * Test MQTT with Vayyar
  * Docker-compose to Kaiyuan
* GCP Kick-off
  * MWG device connect to GCP
  * VAYYAR device connect to GCP



