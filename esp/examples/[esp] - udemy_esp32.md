## [esp] - udemy esp32



### WIFI Application

* wifi_app.h

```c

// #ifndef _MAIN_WIFI_APP_H
#define _MAIN_WIFI_APP_H

#include "esp_netif.h"

#define WIFI_AP_SSID    "ESP32_AP"

#define WIFI_AP_PASSWORD "password"

#define AP_CHANNEL 1

#define WIFI_AP_SSID_HIDDEN 0

#define WIFI_AP_MAX_CONNECTIONS 5

#define WIFI_AP_BEACON_INTERVAL 100

#define WIFI_AP_IP "192.168.0.1"

#define WIFI_AP_GATEWAY "192.168.0.1"

#define WIFI_AP_NETMASK "255.255.255.255.0"

#define WIFI_AP_BANDWIDTH WIFI_BW_HT20  // AP bandwidth 20Mhz

#define WIFI_STA_POWER_SAVE WIFI_PS_NONE   // power saving not used

#define MAX_SSID_LENGTH 32  // IEEE standard maximum

#define MAX_PASSWORD_LENGTH 64 // IEEE standard maximum

#define MAX_CONNECTION_RETRIES 5

// netif object for the station and access point
// defined in esp_netif_types.h
extern esp_netif_t* esp_netif_sta;
extern esp_netif_t* esp_netif_ap;

/*
* message IDs for the WIFI application task
* @note expand this based on your application requirement
*/

typedef enum wifi_app_message {
    WIFI_APP_MSG_START_HTTP_SERVER = 0,
    WIFI_APP_MSG_CONNECTING_FROM_HTTP_SERVER,
    WIFI_APP_MSG_STA_CONNECTED_GOT_IP,

} wifi_app_message_e;

/**
 * structure for the message queue
 * @note Expand this based on applcation requirement, eg. add another type and parameter as required
 *
 */

typedef struct wifi_app_queue_message {
    wifi_app_message_e msgID;
} wifi_app_queue_message_t;

/**
 * sends a message to the queue
 * @param msgID message ID from the wifi_app_message_e enum
 * @return pdTRUE if an item was successfully sent to the queue, otherwise pdFALSE
 * @note Expand the parameter list based on your requirement. e.g. how you expanded the wifi_app_queue_message_t,
*/

BaseType_t wifi_app_send_message(wifi_app_message_e msgID);

/**
 * * starts the wifi rtos task
 */
void wifi_app_start(void);
#endif /* _MAIN_WIFI_APP_H */
```

* wifi_app.c

```c
#include "freertos/FreeROTS.h"
#include "freertos/event_group.h"
#include "freertos/task.h"

#include "esp_err.h"
#include "esp_log.h"
#include "esp_wifi.h"
#include "lwip/netdb.h"

#include "rgb_led.h"
#include "task_common.h"
#include "wifi_app.h"

// tag used for ESP serial console messages
static const char TAG [] = "wifi_app";

// queue handle used to manipulate the main queue of events
// defined in queue.h
// typedef void * QueueHandle_t
static QueueHandle_t wifi_app_queue_handle;

// netif objects for the station and access point
esp_netif_t* esp_netif_sta = NULL;
esp_netif_t* esp_netif_ap = NULL;

/**
 * WIFI application event handler
 * @param arg data, aside from event data, that is passed to the handler when it is called
 * @param event_base the base id of the event to register the handler for
 * @param event_id the id for the event to register the handler
 * @param event_data event data
**/
static void wifi_app_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data) {
    if (event_base == WIFI_EVENT) {
        switch (event_id) {
            // esp_wifi_types.h
            // wifi event declaration

            case WIFI_EVENT_AP_START:
                // esp_log.h

                ESP_LOGI(TAG, "WIFI_EVENT_AP_START");
                break;
            case WIFI_EVENT_AP_STOP:
                ESP_LOGI(TAG, "WIFI_EVENT_AP_STOP");
                break;
            case WIFI_EVENT_AP_STACONNECTED:
                ESP_LOGI(TAG, "WIFI_EVENT_AP_STACONNECTED");
                break;
            case WIFI_EVENT_AP_STADISCONNECTED:
                ESP_LOGI(TAG, "WIFI_EVENT_AP_STADISCONNECTED");
                break;
            case WIFI_EVENT_STA_START:
                ESP_LOGI(TAG,"WIFI_EVENT_STA_START");
                break;
            case WIFI_EVENT_STA_CONNECTED:
                ESP_LOGI(TAG,"WIFI_EVENT_STA_CONNECTED");
                break;
            case WIFI_EVENT_STA_DISCONNECTED:
                ESP_LOGI(TAG,"WIFI_EVENT_STA_DISCONNECTED");
                break;
        }
    } else if (event_base == IP_EVENT) {

        // esp_netif_types.h
        // ip event declaration

        switch (event_id) {
            case IP_EVENT_STA_GOT_IP:
                ESP_LOGI(TAG, "IP_EVENT_STA_GOT_IP);
                break;

        }
    }
}

/**
 * Initialize the wifi application event handler for wifi and ip event
 *
 */

static void wifi_app_event_handler_init(void){
    // event loop for the wifi driver

    ESP_ERROR_CHECK(esp_event_loop_create_default());


    // event handler for the connection

    esp_event_handler_instance_t instance_wifi_event;
    esp_event_handler_instance_t instance_ip_event;

    ESP_ERROR_CHECK(esp_event_handler_instance_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_app_event_handler, NULL, &instance_wifi_event));

    ESP_ERROR_CHECK(esp_event_handler_instance_register(IP_EVENT, ESP_EVENT_ANY_ID, &wifi_app_event_handler, NULL, &instance_ip_event));

}

/**
 * Initialize the TCP stack and default wifi configuration
 */

static void wifi_app_default_wifi_init(void) {
    // initialize the tcp stack

    ESP_ERROR_CHECK(esp_netif_init());

    // default wifi config - operation must be in this order

    wifi_init_config_t wifi_init
    // stop at 9:30 - 16. wifi application programming part III
}


/**
 * Main task for the wifi application
 *  @param pvParameters parameter which can be passed to the task
 */

static void wifi_app_task(void *pvParameter) {
    wifi_app_queue_message_t msg;
    // initialize the event handler
    wifi_app_event_handler_init();
}

```