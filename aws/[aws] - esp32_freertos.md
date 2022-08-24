## [aws] - ESP / FreeRTOS for IOT CORE


### AWS IAM user setup

> Currently, the FreeRTOS port for ESP32-WROVER-KIT and ESP DevKitC doesn't support the Symmetric multiprocessing (SMP) feature.

* Create IAM Role: AmazonFreeRTOSFullAccess
  - 允許完整存取所有 IAM 使用者的 FreeRTOS 資源 (免費版本：*)。
* AWSIoTFullAccess
  - 允許完整存取所有 IAM 使用者的 IAM 使用者AWS IoT資源（物聯網：*）。

* Add Premission > Attach Existing Policy

### Hardware Setup
#### github project
```bash
# If using Windows, because this repository and its submodules contain symbolic links, set core.symlinks to true 
$ git config --global core.symlinks true

$ git clone https://github.com/aws/amazon-freertos.git --recurse-submodules
```
#### More info
[blog](https://blogs.windows.com/windowsdeveloper/2016/12/02/symlinks-windows-10/)
#### esp-idf setup



### external
* [github](https://github.com/aws/amazon-freertos)
* [freertos](https://ap-northeast-1.console.aws.amazon.com/iot/home?region=ap-northeast-1#/software/freertos)
* [ESP32-DevKitC V4](https://docs.espressif.com/projects/esp-idf/en/release-v4.2/esp32/hw-reference/esp32/get-started-devkitc.html)
* [esp-idf-windows](https://dl.espressif.com/dl/esp-idf/?idf=4.2)
* [doc](https://docs.aws.amazon.com/zh_tw/freertos/latest/userguide/getting_started_espressif.html)