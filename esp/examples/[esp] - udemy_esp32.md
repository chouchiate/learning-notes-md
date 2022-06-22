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
### wifi_app.c 實作
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

    wifi_init_config_t wifi_init_config = WIFI_INIT_CONFIG_DEFAULT();

    ESP_ERROR_CHECK(esp_netif_init(&wifi_init_config));

    // default wifi config - operation must be in this order:

    wifi_init_config_t wifi_init_config = WIFI_INIT_CONFIG_DEFAULT();

    ESP_ERROR_CHECK(esp_wifi_init(&wifi_init_config));

    ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));

    esp_netif_sta = esp_netif_create_default_wifi_sta();

    esp_netif_ap = esp_netif_create_default_wifi_ap();

}

/**
 * Configure the wifi access point setting and assigns the static IP to the softAP
 *
 */
static void wifi_app_soft_ap_config(void)
{
    // SoftAP - Wifi access point configuration
    wifi_config_t ap_config =
    {
        .ap = {
            .ssid = WIFI_AP_SSID,
            .ssid_len = strlen(WIFI_AP_SSID),
            .password = WIFI_AP_PASSWORD,
            .channel = WIFI_AP_CHANNEL,
            .ssid_hidden = WIFI_AP_SSID_HIDDEN,
            .authmode = WIFI_AUTH_WPA2_PSK,
            .max_connection = WIFI_AP_MAX_CONNECTIONS,
            .beacon_interval = WIFI_AP_BEACON_INTERVAL,
        },
    };

    // configure DHCP for the AP
    // esp_netif_types.h
    esp_netif_ip_info_t ap_ip_info;
    memset(&ap_ip_info, 0x00, sizeof(ap_ip_info));

    // esp_netif.h
    // must call this first
    esp_netif_dhcps_stop(esp_netif_ap);

    // assign access points' static ip, gateway, and netmask

    inet_pton(AF_INET, WIFI_AP_IP, &ap_ip_info.ip);
    inet_pton(AF_INET, WIFI_AP_GATEWAY, &ap_ip_info.gw);
    inet_pton(AF_INET, WIFI_AP_NETMASK, &ap_ip_info.netmask);


    // statically configure the network interface
    ESP_ERROR_CHECK(esp_netif_set_ip_info(esp_netif_ap, &ap_ip_info));

    // start the AP DHCP server (for connecting station e.g. your mobile device)
    ESP_ERROR_CHECK(esp_netif_dhcps_start(esp_netif_ap));

    // setting the mode as access point / station mode
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_APSTA));

    // set our configuration
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_AP, &ap_config));

    // our default bandwidth 20 Mhz
    ESP_ERROR_CHECK(esp_wifi_set_bandwidth(WIFI_IF_AP, WIFI_AP_BANDWIDTH));

    // power save set to "NONE" as defined
    ESP_ERROR_CHECK(esp_wifi_set_ps(WIFI_STA_POWER_SAVE));
}

/**
 * Main task for the wifi application
 *  @param pvParameters parameter which can be passed to the task
 */

static void wifi_app_task(void *pvParameter) {
    wifi_app_queue_message_t msg;

    // initialize the event handler
    wifi_app_event_handler_init();

    // initialize the TCP/IP stack and WIFI config
    wifi_app_default_wifi_init();

    // softAP config
    wifi_app_soft_ap_config();

    // start wifi
    ESP_ERROR_CHECK(esp_wifi_start());

    // send first event message
    wifi_app_send_message(WIFI_APP_MSG_START_HTTP_SERVER);

    for (;;)
    {
        if (xQueueReceive(wifi_app_queue_handle, &msg, portMAX_DELAY))
        {
            switch (msg.msgID)
            {
                case WIFI_APP_MSG_START_HTTP_SERVER:
                    ESP_LOGI(TAG, "WIFI_APP_MSG_START_HTTP_SERVER");

                    http_server_start();
                    rgb_led_http_server_started();
                    break;
                case WIFI_APP_MSG_CONNECTING_FROM_HTTP_SERVER:
                    ESP_LOGI(TAG, "WIFI APP MSG CONNECTING FROM HTTP SERVER");
                    break;
            }
        }
    }
}

```

### Test
* main.c
```c
/**
 * Application entry point
 *
 */

#include "nvs_flash.h"
#include "wifi_app.h"

void app_main(void)
{
    // Initialize NVS
    esp_err_t ret = nvs_flash_init();

    // nvs.h
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
    {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }

    ESP_ERROR_CHECK(ret);

    // start wifi
    wifi_app_start();
}
```

### HTTP server implementation
* web page files (.html, .css, and .js)
* support OTA firmware updates
* support for DHT22 temperature and humidity sensor reading display on web page
* able to respond to connection and disconnection buttons on web page, by entering SSID, and password into text fields and clicking connect and disconnect
* handle sending connection information (SSID, IP, Gateway, Netmask)
* send ESP32's assigned SSID to the webpage.


### Doc
* [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/protocols/esp_http_server.html)

### Configure steps creating HTTP server using ESP-IDF
* Embed binary data (index.html, app.css, code.js)
    - [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/build-system.html#embedding-binary-data)
* Create HTTP server start and stop functions
    - [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/protocols/esp_http_server.html#application-example)
* Create default HTTP server configuration and adjust to needs
    - create struct httpd_config_t
        - [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/protocols/esp_http_server.html#structure)
    - call httpd_start
        - [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/protocols/esp_http_server.html#_CPPv411httpd_startP14httpd_handle_tPK14httpd_config_t)

* Register URL handlers
    - [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/protocols/esp_http_server.html#_CPPv426httpd_register_uri_handler14httpd_handle_tPK11httpd_uri_t)
* monitor task which can receive queue message to respond certain events

### HTTP Server Programming
* create  ./main/webpage
    - add app.css, app.js, favicon.ico, index.html, jquery-3.3.1.min.js to folder
* CMakeLists.txt
```make
    idf_component_register(SRCS main.c rgb_led.c wifi_app.c http_server.c
                        INCLUDE_DIRS "."
                        EMBED_FILES webpage/app.css webpage/app.js webpage/favicon.ico webpage/index.html webpage/jquery-3.3.1.min.js)
```
* create http_server.c & http_server.h

* in tasks_common.h
```c
#ifndef MAIN_TASKS_COMMON_H_
#define MAIN_TASKS_COMMON_H_

#define WIFI_APP_TASK_STACK_SIZE 4096
#define WIFI_APP_TASK_PRIORITY 5
#define WIFI_APP_TASK_CORE_ID   0

// HTTP SERVER task
#define HTTP_SERVER_TASK_STACK_SIZE 8192
#define HTTP_SERVER_TASK_PRIORITY 4
#define HTTP_SERVER_TASK_CORE_ID 0

// HTTP server Monitor task
#define HTTP_SERVER_MONITOR_TASK_STACK_SZIE 4096
#define HTTP_SERVER_MONITOR_PRIORITY 3
#define HTTP_SERVER_MONITOR_CORE_ID 0
#endif
```

* in http_server.h
```c
#ifndef MAIN_HTTP_SERVER_H_
#define MAIN_HTTP_SERVER_H_

/**
 * Messages for the HTTP monitor
 */
typedef enum http_server_message
{
    HTTP_MSG_WIFI_CONNECT_INIT = 0,
    HTTP_MSG_WIFI_CONNECT_SUCCESS,
    HTTP_MSG_WIFI_CONNECT_FAIL,
    HTTP_MSG_OTA_UPDATE_SUCCESSFUL,
    HTTP_MSG_OTA_UPDATE_FAILED,
    HTTP_MSG_OTA_UPDATE_INITIALIZED,
} http_server_message_e;

/**
 * Structure for the message queue
 */

typedef struct http_server_queue_message
{
    http_server_message_e msgID;
} http_server_queue_message_t;

/**
 * Sends a message to the queue
 * @param msgID message ID from the http server message_e enum
 * @return odTRUE if an item was successfully sent to the queue, otherwise pdFALSE.
 * @note Expand the parameter list based on your requirement e.g. how to expand the http_server_queue_message_t
 */
BaseType_t http_server_monitor_send_message(http_server_message_e msgID);

/**
 * Starts the HTTP server
 */
void http_server_start(void);
/**
 * Stops the HTTP server
 */
void http_server_stop(void);

#endif
```

* in http_server.c
```c
#include "esp_http_server.h"
#include "esp_log.h"

#include "http_server.h"
#include "tasks_common.h"
#include "wifi_app.h"

// Tag used for ESP serial console messages
static const char TAG[] = "http_server"

// HTTP server task handle
static httpd_handle_t http_server_handle = NULL;

// Embedded files: JQuery, index.html, app.css, app.hs and favicon.ico files
extern const uint8_t jquery_3_3_1_min_js_start[]    asm("_binary_jquery_3_3_1_min_js_start");
extern const uint8_t jquery_3_3_1_min_js_end[]    asm("_binary_jquery_3_3_1_min_js_end");
extern const uint8_t index_html_start[]    asm("_binary_index_html_start");
extern const uint8_t index_html_end[]    asm("_binary_index_html_end");
extern const uint8_t app_css_start[]    asm("_binary_app_css_start");
extern const uint8_t app_css_end[]    asm("_binary_app_css_end");
extern const uint8_t app_js_start[]    asm("_binary_app_js_start");
extern const uint8_t app_js_end[]    asm("_binary_app_js_end");
extern const uint8_t favicon_ico_start[]    asm("_binary_favicon_ico_start");
extern const uint8_t favicon_ico_end[]    asm("_binary_favicon_ico_end");

/**
 * Jquery get handler requested when accessing the web page.
 * @param req HTTP request for which the url needs to be handled.
 * @return ESP_OK
 */

static esp_err_t http_server_jquery_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "Jquery requested");
    httpd_resp_set_type(req, "application/javascript");
    httpd_resp_send(req, (const char *)jquery_3_3_1_min_js_start, jquery_3_3_1_min_js_end - jquery_3_3_1_min_js_start);

    return ESP_OK;
}

/**
 * Send the index.html page.
 * @param req HTTP request for which the url needs to be handled.
 * @return ESP_OK
 */

static esp_err_t http_server_index_html_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "Jquery requested");
    httpd_reqp_set_type(req, "text/html");
    httpd_resp_send(req, (const char *)index_html_start, index_html_end - index_html_start);

    return ESP_OK;
}

/**
 * Sends the index.html page.
 * @param req HTTP request for which the url needs to be handled
 * @return ESP_OK
 */

static esp_err_t http_server_app_css_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "app.css requested");
    httpd_resp_set_type(req, "text/css");
    httpd_resp_send(req, (const char *)app_css_start, app_css_end - app_css_start);
    return ESP_OK;
}

/**
 * app.js get handler is requested when accessing the web page.
 * @param req HTTP request for which the uri needs to be handled.
 * @return ESP_OK
 */

static esp_err_t http_server_app_js_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "app.js requested");

    httpd_resp_set_type(req, "application/javascript");
    httpd_resp_send(req, (const char *)app_js_start, app_js_end - app_js_start);
    return ESP_OK;
}

/**
 * Sends the .ico (icon) file when accessing the web page.
 * @param req HTTP request for which the uri needs to be handled.
 * @return ESP_OK
 */

static esp_err_t http_server_favicon_ico_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "favicon.ico requested");

    httpd_resp_set_type(req, "image/x-icon");
    httpd_resp_send(req, (const char *)favicon_ico_start, favicon_ico_end - favicon_ico_start);
    return ESP_OK;
}

/**
 * Sets up the default http server configuration.
 * @return http server instance handle if successful. NULL otherwise.
 */

static httpd_handle_t http_server_configure(void)
{
    // Generate the default configuration
    httpd_config_t config = HTTPD_DEFAULT_CONFIG();

    // todo: reate HTTP server monitor task


    // todo: create the message queue


    // the core that the HTTP server will run on
    config.core_id = HTTP_SERVER_TASK_CORE_ID;

    // Adjust the default priority to 1 less than the wifi application task
    config.task_priority = HTTP_SERVER_TASK_PRIORITY;

    // Bump up the stack size (default is 4096)
    config.stack_size = HTTP_SERVER_TASK_STACK_SIZE;

    // increase url handlers
    config.max_uri_handlers = 20;

    // increase the timeout limits
    config.recv_wait_timeout = 10;
    config.send_wait_timeout = 10;

    ESP_LOGI(TAG, "http_server_configure: starting server on port: '%d' with task priority: %d",
        config.server_port,
        config.task_priority);

    // start the httpd server
    if (httpd_start(&http_server_handle, &config) == ESP_OK)
    {
        ESP_LOGI(TAG, "http_server_configure: Registering URI handlers");

        // register query handler
        httpd_uri_t jquery_js = {
            .url = "/jquery-3.3.1.min.js",
            .method = HTTP_GET,
            .handler = http_server_jquery_handler,
            .user_ctx = NULL
        };
        httpd_register_uri_handler(http_server_handle, &jquery_js);

        // register index.html handler
        httpd_uri_t index_html = {
            .url = "/",
            .method = HTTP_GET,
            .handler = http_server_index_html_handler,
            .user_ctx = NULL
        };
        httpd_register_uri_handler(http_server_handle, &index_html);

        // register app.css handler
        httpd_uri_t jquery_js = {
            .url = "/app.css",
            .method = HTTP_GET,
            .handler = http_server_app_css_handler,
            .user_ctx = NULL
        };
        httpd_register_uri_handler(http_server_handle, &app_css);

        // register app.js handler
        httpd_uri_t app_js = {
            .url = "/app.js",
            .method = HTTP_GET,
            .handler = http_server_app_js_handler,
            .user_ctx = NULL
        };
        httpd_register_uri_handler(http_server_handle, &app_js);

        // register favicon.ico handler
        httpd_uri_t favicon_ico = {
            .url = "/favicon.ico",
            .method = HTTP_GET,
            .handler = http_server_favicon_ico_handler,
            .user_ctx = NULL
        };
        httpd_register_uri_handler(http_server_handle, &favicon_ico);

        return http_server_handle;
    }
    return NULL;
}

void http_server_start(void)
{
    if (http_server_handle == NULL)
    {
        http_server_handle = http_server_configure();
    }
}

void http_server_stop(void)
{
    if (http_server_handle)
    {
        httpd_stop(http_server_handle);
        ESP_LOGI(TAG, "http_server_stop: stopping HTTP server");
        http_server_handle = NULL;
    }
}


```
