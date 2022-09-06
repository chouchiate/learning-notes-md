## [esp] - log.c & esp_log.h


```c

// usage
static const char *TAG = "mqtt_client";

ESP_LOGE(TAG, "Explicit cert-/key-len is not available in IDF version %s", IDF_VER);

ESP_OK_CHECK(TAG, esp_mqtt_set_cert_key_data(ssl, MQTT_SSL_DATA_API_CA_CERT, cfg->cacert_buf, cfg->cacert_bytes), goto esp_mqtt_set_transport_failed);

ESP_LOGW(TAG, "SSL related configs set, but the URI scheme specifies a non-SSL scheme, scheme = %s", cfg->scheme);

ESP_MEM_CHECK(TAG, set_if_config(config->host, &client->config->host), goto _mqtt_set_config_failed);


```
### ESP Platform Checks
```c
// platform_esp32_idf.h
#define ESP_MEM_CHECK(TAG, a, action) if (!(a)) {                                                      \
        ESP_LOGE(TAG,"%s(%d): %s",  __FUNCTION__, __LINE__, "Memory exhausted"); \
        action;                                                                                         \
        }

#define ESP_OK_CHECK(TAG, a, action) if ((a) != ESP_OK) {                                                     \
        ESP_LOGE(TAG,"%s(%d): %s", __FUNCTION__, __LINE__, "Failed with non ESP_OK err code"); \
        action;                                                                                               \
        }


```