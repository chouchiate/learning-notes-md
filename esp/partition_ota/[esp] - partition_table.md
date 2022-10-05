## [esp] - partition table

# ESP-IDF Partition Table 
| Name | Type | SubType | Offset | Size | Flags | 
|--- | --- | --- | --- | --- | --- |
| nvs | data | nvs | 0x9000 | 0x4000 | |
| otadata | data | ota | 0xd000 | 0x2000 | |
| phy_init | data | phy | 0xf000 | 0x1000 | |
| factory | app | factory | 0x10000 | 1M | |
| ota_0 | app | ota_0 | 0x110000 | 1M | |
| ota_1 | app | ota_1 | 0x210000 | 1M | |

* factory, ota_0 and ota_1 are set to app but different subtypes
* otadata holds the data for OTA udpates; bootloader consults this data in order to know which app to execute.
* if otadata is empty, it will execute the factory app instead