## Vayyar Firmware Upgrade Workflow (本地端)

### 使用 ESPtool debug board

<img src="/Users/derickchou/Programming/markdowns/img/Screen Shot 2021-01-19 at 6.27.31 AM.png" alt="alt" style="zoom:30%;" />

### Vayyar Reset 按鈕

<img src="/Users/derickchou/Programming/markdowns/img/Screen Shot 2021-01-19 at 6.25.59 AM.png" alt="alt" style="zoom:25%;" />

###  電源供應器

<img src="/Users/derickchou/Programming/markdowns/img/Screen Shot 2021-01-19 at 6.27.15 AM.png" alt="alt" style="zoom:25%;" />

## 設定流程

```flow
st=>start: 開始更新
op=>operation: Erase Memory
op2=>operation: Flash Memory
op3=>operation: Flash Factory
op4=>operation: Add flash_config
op5=>operation: Add flash_provision_config
cond=>condition: Connect to Google?
op6=>operation: Change local setting
cond1=>condition: Connect to Local?
e=>end: 結束更新

st->op->op2->op3->op4->op5->cond
cond(yes)->op6
cond(no)->op
op6->cond1
cond1(yes)->e
cond1(no)->op6
```

## 重新安裝步驟

### Use Python 3

1. 於 cmd 鍵入下列 python script 按  enter 後 在 cmd 中顯示以下類似文字

   ```
   esptool.py V3.0
   Found 1 serial ports
   Serial port /dev/ttyUSB0
   Connecting......._____.....___
   ```

   以上失敗請重輸．

2. 手動按住 Reset 按鈕後 重新插拔電源一次 然後放開 Reset 按鈕 在 cmd 中顯示以下類似文字

   ```
   Detecting chip type... ESP32
   Chip is ESP32-D0WD (revision 1)
   Features: WiFi, BT, Dual Core, 240MHz, VRef calibration in efuse, Coding Scheme None
   MAC: 30:ae:a4:e4:0c:30
   Uploading stub...
   Running stub...
   Stub running...
   ...
   ```

### Erase all

```
$python -m esptool erase_flash
...
```

### Flash Bootloader and Partition

```
go to firmware root folder with ./build

$ python -m esptool -b 921600 --after hard_reset write_flash --flash_mode dio --flash_size 16MB --flash_freq 40m 0x1000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0xd000 build/ota_data_initial.bin 0x10000 build/WalabotESP32.bin
...

$ cd script
```

### Key-in device S/N VXTA32014S00XXX is based on the device label

```
$ python -m flash_factory_data WH2A3US01 BLUGBC0Q013S00000000000000000001 VXTA32014S00xxx 1 1
...
```

### Add flash_config to Device

```
$ python -m flash_config
...
```

### Add flash_provision_config to Device

```
$ python -m flash_provision_config
...
```

## 更改本地端連線

### Change flash_provision_config.py

```
ssid				-- wifi ssid
password		-- wifi password
http_url		-- http server url
project_id	-- project name
mqtt_uri		-- mqtt broker url
mqtt_port		-- mqtt port

```

### change cloud type to 0 for customized server (ie. jubox)
```json
    json_cfg = {
        "version": 3,
        "wifi_ssid": 'xxx_LTE',
        "wifi_pass": 'xxxxxxx',
        "mqtt_uri": 'mqtt://mqtt.xxxx.yyy',
        "mqtt_port": 1883,
        "ntp_url": 'pool.ntp.org',
        "mqtt_client_id": 'demo',
        "mqtt_username": 'username',
        "mqtt_password": 'password',
        "cloud_type":  0,
        "cloud_region": 'us-central1',
        "project_id": 'walabot-home',
        "http_url": 'https://xxx.yyy.zzzzz',
        "cloud_registry": 'walabothome-app-cloud',
        "package_name": 'com.walabot.home.esp.client',  
    }
```

### flash_provision_config.py

```
#!/usr/bin/env python3

from pathlib import Path
import ctypes as ct
import esptool

CWD = Path(__file__).resolve().parent

SSID_MAX_SIZE = 32
PASS_MAX_SIZE = 64

V_PROVISION_MAX_CONFIG_MAX_URL_LEN = 200
V_PROVISION_MAX_CONFIG_MAX_PROJECT_SIZE = 440
V_PROVISION_MAX_CONFIG_MAX_MQTT_URI_LEN = 50
V_PROVISION_MAX_CONFIG_MAX_NTP_URL_LEN = 127
V_PROVISION_MAX_MQTT_PASS_USERNAME_LEN = 64
V_PROVISION_MAX_MQTT_CLIENT_ID_LEN = 128
V_PROVISION_MAX_CLOUD_REGION_LEN = 64
V_PROVISION_MAX_CLOUD_REGISTRY_LEN = 64

class ProvisionCfg(ct.Structure):

    _pack_ = 1
    _fields_ = [
        ('version', ct.c_uint32),
        ('ssid', ct.c_char * SSID_MAX_SIZE),
        ('password', ct.c_char * PASS_MAX_SIZE),
        ('http_url', ct.c_char * V_PROVISION_MAX_CONFIG_MAX_URL_LEN),
        ('project_id', ct.c_char * V_PROVISION_MAX_CONFIG_MAX_PROJECT_SIZE),
        ('mqtt_uri', ct.c_char * V_PROVISION_MAX_CONFIG_MAX_MQTT_URI_LEN),
        ('mqtt_port', ct.c_int32),
        ('ntp_url', ct.c_char * V_PROVISION_MAX_CONFIG_MAX_NTP_URL_LEN),
        ('mqtt_client_id', ct.c_char * V_PROVISION_MAX_MQTT_CLIENT_ID_LEN),
        ('mqtt_username', ct.c_char * V_PROVISION_MAX_MQTT_PASS_USERNAME_LEN),
        ('mqtt_password', ct.c_char * V_PROVISION_MAX_MQTT_PASS_USERNAME_LEN),
        ('cloud_type', ct.c_int32),
        ('cloud_region', ct.c_char * V_PROVISION_MAX_CLOUD_REGION_LEN),
        ('cloud_registry', ct.c_char * V_PROVISION_MAX_CLOUD_REGISTRY_LEN),
    ]

provision_storage = ProvisionCfg(
    version = 2,
    ssid = 'JUBO_SPACE'.encode(),
    password = '50868012'.encode(),
    http_url="https://us-central1-walabot-home.cloudfunctions.net".encode(),
    project_id="walabot-home".encode(),
    mqtt_uri="mqtts://mqtt.googleapis.com".encode(),
    mqtt_port=443,
    ntp_url="pool.ntp.org".encode(),
    mqtt_client_id = "".encode(),
    mqtt_username = "unused".encode(),
    mqtt_password = "".encode(),
    cloud_type = 1,
    cloud_region = "us-central1".encode(),
    cloud_registry = "walabot_home_gen2".encode()
)

if __name__ == '__main__':
    provision_storage_file = CWD / 'provision_storage.bin'
    provision_storage_file.write_bytes(provision_storage)
    esptool_cmd = ['write_flash', '0xa000', str(provision_storage_file)]
    print(*esptool_cmd)
    esptool.main(esptool_cmd)
    provision_storage_file.unlink()

```





