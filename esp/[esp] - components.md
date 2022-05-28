## [esp] - components

* The first group (referred to as `G0` from now on) contains `hal`, `xtensa` and `riscv` (referred to as `arch` components from now on), `esp_rom`, `esp_common`, and `soc`.

* The second group (referred to as `G1` from now on) sits at a higher level than the first group. This group contains the components `esp_hw_support`, `esp_system`, `newlib`, `spi_flash`,
`freertos`, `log`, and `heap`.

* store in project_folder > build > esp-idf
### Component list for "hello_world" project


### build type
* .o files are objects. They are the output of the compiler and input to the linker/librarian.

* .a files are archives. They are groups of objects or static libraries and are also input into the linker.

* makefile snippet generating static libraries
```makefile
AR = ar
CC = gcc

objects := hello.o world.o

libby.a: $(objects)
    $(AR) rcu $@ $(objects)

%.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@
```

### **Component Lists**

| component | name | group | library |
| ----- | ----- | ----- | ----- |
| asio | Asio C++ Library | G1 | [doc](https://think-async.com/Asio/)|
| app_trace | application level tracing library | G1 | [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/app_trace.html) |
| app_update  | Over the air update (OTA) | G1 | [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/ota.html)|
| bootloader_support | bootloader | | [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/bootloader.html)|
| bootloader | bootloader | | [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/bootloader.html)|
| bt | | | |
| cmock | | | |
| console  | | | |
| cxx  | | | |
| driver  | | | |
| efuse  | | | |
| esp_adc_cal  | | | |
| esp_common  | | | |
| esp_eth  | | | |
| esp_event  | | | |
| esp_gdbstub  | | | |
| esp_hid  | | | |
| esp_http_client  | | | |
| esp_http_server | | | |
| esp_https_ota  | | | |
| esp_https_server | | | |
| esp_hw_support | | | |
| esp_lcd | | | |
| esp_local_ctrl | | | |
| esp_netif | | | |
| esp_phy | | | |
| esp_pm | | | |
| esp_ringbuf | | | |
| esp_rom | | | |
| esp_serial_slave_link | | | |
| esp_system | | | |
| esp_timer | | | |
| esp_wifi | | | |
| esp_tls | | | |
| esp32 | | | |
| espcoredump | | | |
| esptool_py | | | |
| fatfs | | | |
| freertos | | | |
| hal | | | |
| heap | | | |
| http_parser | | | |
| idf_test | | | |
| ieee802154 | | | |
| json | | | |
| log  | | | |
| lwip | | | |
| main | | | |
| mbedtls | | | |
| mdsn | | | |
| mqtt | | | |
| newlib | | | |
| nvs_flash | | | |
| esp-mqtt | | | |
| openthread | | | |
| partition_table | | | |
| perform | | | |
| protobuf-c | | | |
| protocomm | | | |
| pthread | | | |
| sdmmc | | | |
| soc | | | |
| spi_flash | | | |
| spiffs | | | |
| tcp_transport | | | |
| tinyusb | | | |
| ulp | | | |
| unity | | | |
| usb | | | |
| vfs | | | |
| wear_leveling | | | |
| wifi_provisioning | | | |
| wpa_supplicant | | | |
| xtensa | | | |

### asio API

