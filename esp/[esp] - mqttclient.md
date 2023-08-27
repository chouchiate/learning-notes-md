## [esp] - MQTT Client

### esp-idf Example Code Study


### esp_mqtt_client_init
```c
    // mqtt_client.h
    const esp_mqtt_client_config_t mqtt_cfg = {
        .broker.address.uri = CONFIG_BROKER_URI,
    };

    // mqtt_client.h
    // typedef struct esp_mqtt_client *esp_mqtt_client_handle_t;
    esp_mqtt_client_handle_t client = esp_mqtt_client_init(&mqtt_cfg);
```

### esp_mqtt_client_register_event - mqtt_event_handler - mqtt_event_handler_cb
```c
static esp_err_t mqtt_event_handler_cb(esp_mqtt_event_handle_t event)
{
    switch (event->event_id) {
        case MQTT_EVENT_CONNECTED:
            ...

    }
}

static void mqtt_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data) {
    ESP_LOGD(TAG, "Event dispatched from event loop base=%s, event_id=%d", base, event_id);
    mqtt_event_handler_cb(event_data);
}

void mqtt_app_start(void)
{
    s_client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_register_event(client, ESP_EVENT_ANY_ID, mqtt_event_handler, NULL);
    esp_mqtt_client_start(s_client);
}
```


###
```c
#ifdef MQTT_DISABLE_API_LOCKS
# define MQTT_API_LOCK(c)
# define MQTT_API_UNLOCK(c)
#else
# define MQTT_API_LOCK(c)          xSemaphoreTakeRecursive(c->api_lock, portMAX_DELAY)
# define MQTT_API_UNLOCK(c)        xSemaphoreGiveRecursive(c->api_lock)
#endif /* MQTT_USE_API_LOCKS */

```
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

### lib/mqtt_msg.c  lib/mqtt_msg.h



### lib/mqtt_outbox.c lib/mqtt_outbox.h

```c
//
typedef struct outbox_list_t *outbox_handle_t;
//
typedef struct outbox_item *outbox_item_handle_t;
//
typedef struct outbox_message *outbox_message_handle_t;
//
typedef long long outbox_tick_t;
//
typedef struct outbox_message {
    uint8_t *data;
    int len;
    int msg_id;
    int msg_qos;
    int msg_type;
    uint8_t *remaining_data;
    int remaining_len;
} outbox_message_t;
//
typedef enum pending_state {
    QUEUED,
    TRANSMITTED,
    ACKNOWLEDGED,
    CONFIRMED
} pending_state_t;

```

### lib/mqtt_config.h




### EMQ Tutorial - ESP8266 connects to the free public MQTT broker

#### External
* [source](https://www.emqx.com/en/blog/esp8266-connects-to-the-public-mqtt-broker)
* [github](https://github.com/emqx/MQTT-Client-Examples)
* [esp8266](https://github.com/esp8266/Arduino)
* [platformio](https://github.com/platformio/platform-espressif8266/tree/master/examples/esp8266-rtos-sdk-blink?utm_source=platformio.org&utm_medium=docs)
* [guide](https://arduino-esp8266.readthedocs.io/en/3.0.2/installing.html#boards-manager)
* [guide2](https://www.instructables.com/Use-Arduino-Due-to-program-and-test-ESP8266/)

