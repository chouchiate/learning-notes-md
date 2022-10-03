## [esp] WIFI application

### ESP32 Wifi driver
* Wifi programming model
    - tcp/ip stack
    - applicaiton task
    - event task

* contains freeRTOS tasks that accept queue message
*
### xQueueCreate


### xQueueSend


### xQueueReceive


### ESP32 Wifi Event Description


### Configuration steps
1. Define WIFI setting
    - header file with ssid, password, ip, gateway, netmask
2. Define WIFI freeRTOS tasks
   - xTaskCreatePinnedToCore or xTaskCreate
3. Create event handler
    - call esp_event_handler_instance_register
4. implement default configuration
    - initialize TCP/IP stack: esp_netif_init
    - WIFI configuration: esp_wifi_init, esp_wifi_set_storage,
    - default_configuration: esp_netif_create_default_wifi_ap, esp_netif_create_default_wifi_sta

5. Define ESP32 SoftAP configuration
    - esp_netif_set_ip_info,
    - esp_netif_dhcps_start,
    - esp_wifi_set_mode,
    - esp_wifi_set_config,
    - esp_wifi_set_bandwidth,
    - esp_wifi_set_ps
6. Start WIFI
    - esp_wifi_start
7.


### previous saved credentials


### ESP-NETIF Programmer manual
* WIFI station
* WIFI access point
* Ethernet



### ESP32 SoftAP / Station
* becomes SoftAP station when connected
* DHCP service from ESP32's softAP service will dynamically assign IP to connected device
* interact with ESP32 via web page
* AP/STA combination mode

### ESP 32 connect to a AP



### ESP32 Wi-Fi API Error Codes


### ESP32 Channel Selection Considerations

#### Interference concern


#### Legal Considerations



