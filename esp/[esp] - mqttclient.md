## [esp] - MQTT Client


### esp-idf Example Code Study

```c
// mqtt event enum
typedef enum esp_mqtt_event_id_t {
    MQTT_EVENT_ANY = -1,
    MQTT_EVENT_ERROR = 0,
    MQTT_EVENT_CONNECTED,
    MQTT_EVENT_DISCONNECTED,
    MQTT_EVENT_SUBSCRIBED,
    MQTT_EVENT_UNSUBSCRIBED,
    MQTT_EVENT_PUBLISHED,
    MQTT_EVENT_DATA,
    MQTT_EVENT_BEFORE_CONNECT,
    MQTT_EVENT_DELETED,

} esp_mqtt_event_id_t;

// mqtt config

esp_mqtt_client_config_t mqtt_cfg = {
    .broker.address.uri = CONFIG_BROKER_URL,
};

```
### EMQ Tutorial - ESP8266 connects to the free public MQTT broker

#### External
* [source](https://www.emqx.com/en/blog/esp8266-connects-to-the-public-mqtt-broker)
* [github](https://github.com/emqx/MQTT-Client-Examples)
* [esp8266](https://github.com/esp8266/Arduino)
* [platformio](https://github.com/platformio/platform-espressif8266/tree/master/examples/esp8266-rtos-sdk-blink?utm_source=platformio.org&utm_medium=docs)
* [guide](https://arduino-esp8266.readthedocs.io/en/3.0.2/installing.html#boards-manager)
* [guide2](https://www.instructables.com/Use-Arduino-Due-to-program-and-test-ESP8266/)

