## [esp] - OTA udpate


### OTA update configuration steps
1. receive file from webpage by calling `httpd_req_recv`
2. identify where .bin file start, then call `esp_ota_begin`
3. write the first part of data, call `esp_ota_write`
4. continue to receiving file calling `httpd_req_recv` and `esp_ota_write` until all content is received
5. finish OTA update and validate newly written app image, and call `esp_ota_end`
6. configure OTA data for a new boot partition, call `esp_ota_set_boot_partition`
7. restart the ESP32, call `esp_restart`

### external
* [ota](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/ota.html)
* [partition](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/kconfig.html#partition-table)