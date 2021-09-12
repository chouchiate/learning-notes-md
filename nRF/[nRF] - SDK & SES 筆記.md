## **nRF SDK & Segger (SES) 筆記**

* SoftDevice S112
  * Memory-optimized peripheral-only BLE protocol stack for
    * nRF52805
    * nRF52810
    * nRF52811
    * nRF52820
    * nRF52832 

* SoftDevice S113
  * Memory-optimized peripheral-only BLE protocol stack for 
    * nRF52805
    * nRF52810
    * nRF52811
    * nRF52820
    * nRF52832
    * nRF52833
    * nRF52840

* SoftDevice S140
  * feature-rich central and peripheral BLE protocol stack for
    * nRF52811
    * nRF52820
    * nRF52833
    * nRF52840

* SoftDevice S132
  * high-performance central and peripheral BLE protocol stack for 
    * nRF52810
    * nRF52832

* SoftDevice S122
  * Memory-Optimized Central-only BLE protocol stack for
    * nRF52820
    * nRF52833


#### **nRF Command Line Tool**
  * [**download**](https://www.nordicsemi.com/Products/Development-tools/nrf-command-line-tools/download#infotabs)

  * [**manual**](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_nrf_cltools%2FUG%2Fcltools%2Fnrf_command_line_tools_lpage.html)

  * Check version
  ```bash
    $ nrfjprog --version
  ```

#### **nRF5 SDK for Mesh **
  * [infocenter](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fstruct_sdk%2Fstruct%2Fsdk_mesh_latest.html)
  * [github](github.com/NordicSemiconductor/nRF5-SDK-for-Mesh)

  Supported Devices:

  * nRF52840 (limited support for dongle)
  * nRF52833
  * nRF52832
  * nRF52820 (limited support)
  * nRF52810 (limited support)

#### **nRF5 Sniffer**
  * Guide

    [infocenter](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_sniffer_ble%2FUG%2Fsniffer_ble%2Fintro.html)

  * Wireshark plugin

    [capture-tool](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_sniffer_ble%2FUG%2Fsniffer_ble%2Finstalling_sniffer_plugin.html)

#### **nRF Connect for Desktop**

  * [download](https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-desktop/Download#infotabs)
  * [guide](https://infocenter.nordicsemi.com/pdf/nRFConnect_BLE_User_Guide_v2.3.1.pdf)

#### **Iot SDK**

  * 


#### **AWS Related**

  * AWS Nordic BLE 

    [aws-nordic](https://docs.aws.amazon.com/freertos/latest/userguide/getting_started_nordic.html)

  * BLE MQTT - WiFi Provisioning

    [ble-demo-mqtt](https://docs.aws.amazon.com/freertos/latest/userguide/ble-demo.html#ble-demo-mqtt)

#### **IF Boot / Reset Button (SW5)**
  * Resetting nRF52840 SoC
    * P0.18 needs to be enabled
    * in SES, goto project->Edit Options->Code->Preprocessor->Preprocessor Definitions
    * Add CONFIG_GPIO_AS_PINRESET variable

  * Entering bootloader mode
    * keep reset button pressed while ***powering up / starting up DK*** until LED5 blinks

#### **Virtual COM port**
  * 


#### **Segger Embedded Studio**
  * Environment Option

    [Guide](https://studio.segger.com/index.htm?https://studio.segger.com/ide_environment_options_texteditor_help.htm)




