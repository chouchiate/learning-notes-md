## **nRF SDK & Segger (SES) 筆記**

## Segger IDE Installation Tutorial
*
[installing-ses-nordic-edition](https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/gs_installing.html#installing-ses-nordic-edition)

```bash
$
# Install homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# install dependencies
$ brew install cmake ninja gperf python3 ccache qemu dtc

```

## Install GN meta-build system
* [gn-googlesource](https://gn.googlesource.com/gn/)
* [matter](https://csa-iot.org/all-solutions/matter/)

```bash
# make folder
$ mkdir ${HOME}/gn && cd ${HOME}/gn
# install wget
$ brew install wget
# download and extract gn binary archive
$ wget -O gn.zip https://chrome-infra-packages.appspot.com/dl/gn/gn/mac-amd64/+/latest
unzip gn.zip
rm gn.zip
# add to path
code ~/.bash_profile
echo 'export PATH=${HOME}/gn:"$PATH"' >> ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# install west
$ pip3 install west
# use west
$ west --help

```

### Initialize West
* To clone repositories
  1. create folder `ncs`, this folder holds all nRF Connect SDK repositories
  2. Identify revision to work (release-note)[https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/release_notes.html#release-notes]
  3.
```bash

```

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




