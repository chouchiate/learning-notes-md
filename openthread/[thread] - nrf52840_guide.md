## [thread] - nrf52840DK project setup

### folder structure
```bash
.
...
├── src                    # root folder
│   ├── openthread         # openthread project folder
│   │   ├── script         # scripts
│   │   ├── src           #   ...
│   │   ├── tools                    #   ...
│   │   └──
│   ├── ot-nrf528xx                        # actual cluster name (demo)
│   ├── ot-efr32                        # actual cluster name (demo)
```

### Clone Github

```bash
$ mkdir -p ~/src
$ cd ~/src
$ git clone --recursive https://github.com/openthread/openthread.git
$ cd openthread
## make sure toolchain is installed and configured
$ ./script/bootstrap

### M1 build fail notice
llvm@9: The x86_64 architecture is required for this software.
Error: llvm@9: An unsatisfied requirement failed this build.
++ brew --prefix llvm@9
+ sudo ln -s /opt/homebrew/opt/llvm@9/bin/clang-format /usr/local/bin/clang-format-9

```

### Build OpenThread Daemon:
```bash
$ ./script/cmake-build posix -DOT_DAEMON=ON

#### Build Messages

+ OT_CMAKE_NINJA_TARGET=
+++ dirname ./script/cmake-build
++ cd ./script/..
++ pwd
+ OT_SRCDIR=/Users/lorem/Programming/ot/openthread
+ readonly OT_SRCDIR
+ OT_PLATFORMS=(cc2538 simulation posix)
+ readonly OT_PLATFORMS
+ OT_POSIX_SIM_COMMON_OPTIONS=("-DOT_ANYCAST_LOCATOR=ON" "-DOT_BORDER_AGENT=ON" "-DOT_BORDER_ROUTER=ON" "-DOT_COAP=ON" "-DOT_COAP_BLOCK=ON" "-DOT_COAP_OBSERVE=ON" "-DOT_COAPS=ON" "-DOT_COMMISSIONER=ON" "-DOT_CHANNEL_MANAGER=ON" "-DOT_CHANNEL_MONITOR=ON" "-DOT_CHILD_SUPERVISION=ON" "-DOT_DATASET_UPDATER=ON" "-DOT_DHCP6_CLIENT=ON" "-DOT_DHCP6_SERVER=ON" "-DOT_DIAGNOSTIC=ON" "-DOT_DNS_CLIENT=ON" "-DOT_ECDSA=ON" "-DOT_HISTORY_TRACKER=ON" "-DOT_IP6_FRAGM=ON" "-DOT_JAM_DETECTION=ON" "-DOT_JOINER=ON" "-DOT_LEGACY=ON" "-DOT_MAC_FILTER=ON" "-DOT_MTD_NETDIAG=ON" "-DOT_NEIGHBOR_DISCOVERY_AGENT=ON" "-DOT_NETDATA_PUBLISHER=ON" "-DOT_PING_SENDER=ON" "-DOT_REFERENCE_DEVICE=ON" "-DOT_SERVICE=ON" "-DOT_SNTP_CLIENT=ON" "-DOT_SRP_CLIENT=ON" "-DOT_COVERAGE=ON" "-DOT_LOG_LEVEL_DYNAMIC=ON" "-DOT_COMPILE_WARNING_AS_ERROR=ON" "-DOT_RCP_RESTORATION_MAX_COUNT=2" "-DOT_UPTIME=ON")
+ readonly OT_POSIX_SIM_COMMON_OPTIONS
+ main posix -DOT_DAEMON=ON
+ [[ 2 == 0 ]]
+ local platform=posix
+ echo cc2538 simulation posix
+ grep -wq posix
+ shift
+ local_options=()
+ local local_options
+ options=("-DOT_PLATFORM=${platform}" "-DOT_SLAAC=ON")
+ local options
+ case "${platform}" in
+ local_options+=("-DOT_LOG_OUTPUT=PLATFORM_DEFINED" "-DOT_POSIX_MAX_POWER_TABLE=ON")
+ options+=("${OT_POSIX_SIM_COMMON_OPTIONS[@]}" "${local_options[@]}")
+ options+=("$@")
+ build posix -DOT_PLATFORM=posix -DOT_SLAAC=ON -DOT_ANYCAST_LOCATOR=ON -DOT_BORDER_AGENT=ON -DOT_BORDER_ROUTER=ON -DOT_COAP=ON -DOT_COAP_BLOCK=ON -DOT_COAP_OBSERVE=ON -DOT_COAPS=ON -DOT_COMMISSIONER=ON -DOT_CHANNEL_MANAGER=ON -DOT_CHANNEL_MONITOR=ON -DOT_CHILD_SUPERVISION=ON -DOT_DATASET_UPDATER=ON -DOT_DHCP6_CLIENT=ON -DOT_DHCP6_SERVER=ON -DOT_DIAGNOSTIC=ON -DOT_DNS_CLIENT=ON -DOT_ECDSA=ON -DOT_HISTORY_TRACKER=ON -DOT_IP6_FRAGM=ON -DOT_JAM_DETECTION=ON -DOT_JOINER=ON -DOT_LEGACY=ON -DOT_MAC_FILTER=ON -DOT_MTD_NETDIAG=ON -DOT_NEIGHBOR_DISCOVERY_AGENT=ON -DOT_NETDATA_PUBLISHER=ON -DOT_PING_SENDER=ON -DOT_REFERENCE_DEVICE=ON -DOT_SERVICE=ON -DOT_SNTP_CLIENT=ON -DOT_SRP_CLIENT=ON -DOT_COVERAGE=ON -DOT_LOG_LEVEL_DYNAMIC=ON -DOT_COMPILE_WARNING_AS_ERROR=ON -DOT_RCP_RESTORATION_MAX_COUNT=2 -DOT_UPTIME=ON -DOT_LOG_OUTPUT=PLATFORM_DEFINED -DOT_POSIX_MAX_POWER_TABLE=ON -DOT_DAEMON=ON
+ local platform=posix
+ local builddir=build/posix
+ shift
+ mkdir -p build/posix
+ cd build/posix
+ cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DOT_COMPILE_WARNING_AS_ERROR=ON -DOT_PLATFORM=posix -DOT_SLAAC=ON -DOT_ANYCAST_LOCATOR=ON -DOT_BORDER_AGENT=ON -DOT_BORDER_ROUTER=ON -DOT_COAP=ON -DOT_COAP_BLOCK=ON -DOT_COAP_OBSERVE=ON -DOT_COAPS=ON -DOT_COMMISSIONER=ON -DOT_CHANNEL_MANAGER=ON -DOT_CHANNEL_MONITOR=ON -DOT_CHILD_SUPERVISION=ON -DOT_DATASET_UPDATER=ON -DOT_DHCP6_CLIENT=ON -DOT_DHCP6_SERVER=ON -DOT_DIAGNOSTIC=ON -DOT_DNS_CLIENT=ON -DOT_ECDSA=ON -DOT_HISTORY_TRACKER=ON -DOT_IP6_FRAGM=ON -DOT_JAM_DETECTION=ON -DOT_JOINER=ON -DOT_LEGACY=ON -DOT_MAC_FILTER=ON -DOT_MTD_NETDIAG=ON -DOT_NEIGHBOR_DISCOVERY_AGENT=ON -DOT_NETDATA_PUBLISHER=ON -DOT_PING_SENDER=ON -DOT_REFERENCE_DEVICE=ON -DOT_SERVICE=ON -DOT_SNTP_CLIENT=ON -DOT_SRP_CLIENT=ON -DOT_COVERAGE=ON -DOT_LOG_LEVEL_DYNAMIC=ON -DOT_COMPILE_WARNING_AS_ERROR=ON -DOT_RCP_RESTORATION_MAX_COUNT=2 -DOT_UPTIME=ON -DOT_LOG_OUTPUT=PLATFORM_DEFINED -DOT_POSIX_MAX_POWER_TABLE=ON -DOT_DAEMON=ON /Users/lorem/Programming/ot/openthread
-- The C compiler identification is AppleClang 13.0.0.13000029
-- The CXX compiler identification is AppleClang 13.0.0.13000029
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /Library/Developer/CommandLineTools/usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /Library/Developer/CommandLineTools/usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- OpenThread Source Directory: /Users/lorem/Programming/ot/openthread
-- OT_ANYCAST_LOCATOR=ON --> OPENTHREAD_CONFIG_TMF_ANYCAST_LOCATOR_ENABLE=1
-- OT_ASSERT=""
-- OT_BACKBONE_ROUTER=""
-- OT_BACKBONE_ROUTER_DUA_NDPROXYING=""
-- OT_BACKBONE_ROUTER_MULTICAST_ROUTING=""
-- OT_BORDER_AGENT=ON --> OPENTHREAD_CONFIG_BORDER_AGENT_ENABLE=1
-- OT_BORDER_ROUTER=ON --> OPENTHREAD_CONFIG_BORDER_ROUTER_ENABLE=1
-- OT_BORDER_ROUTING=""
-- OT_BORDER_ROUTING_NAT64=""
-- OT_CHANNEL_MANAGER=ON --> OPENTHREAD_CONFIG_CHANNEL_MANAGER_ENABLE=1
-- OT_CHANNEL_MONITOR=ON --> OPENTHREAD_CONFIG_CHANNEL_MONITOR_ENABLE=1
-- OT_CHILD_SUPERVISION=ON --> OPENTHREAD_CONFIG_CHILD_SUPERVISION_ENABLE=1
-- OT_COAP=ON --> OPENTHREAD_CONFIG_COAP_API_ENABLE=1
-- OT_COAP_BLOCK=ON --> OPENTHREAD_CONFIG_COAP_BLOCKWISE_TRANSFER_ENABLE=1
-- OT_COAP_OBSERVE=ON --> OPENTHREAD_CONFIG_COAP_OBSERVE_API_ENABLE=1
-- OT_COAPS=ON --> OPENTHREAD_CONFIG_COAP_SECURE_API_ENABLE=1
-- OT_COMMISSIONER=ON --> OPENTHREAD_CONFIG_COMMISSIONER_ENABLE=1
-- OT_CSL_AUTO_SYNC=""
-- OT_CSL_DEBUG=""
-- OT_CSL_RECEIVER=""
-- OT_DATASET_UPDATER=ON --> OPENTHREAD_CONFIG_DATASET_UPDATER_ENABLE=1
-- OT_DHCP6_CLIENT=ON --> OPENTHREAD_CONFIG_DHCP6_CLIENT_ENABLE=1
-- OT_DHCP6_SERVER=ON --> OPENTHREAD_CONFIG_DHCP6_SERVER_ENABLE=1
-- OT_DIAGNOSTIC=ON --> OPENTHREAD_CONFIG_DIAG_ENABLE=1
-- OT_DNS_CLIENT=ON --> OPENTHREAD_CONFIG_DNS_CLIENT_ENABLE=1
-- OT_DNS_DSO=""
-- OT_DNSSD_SERVER=""
-- OT_DUA=""
-- OT_ECDSA=ON --> OPENTHREAD_CONFIG_ECDSA_ENABLE=1
-- OT_EXTERNAL_HEAP=""
-- OT_FIREWALL=""
-- OT_HISTORY_TRACKER=ON --> OPENTHREAD_CONFIG_HISTORY_TRACKER_ENABLE=1
-- OT_IP6_FRAGM=ON --> OPENTHREAD_CONFIG_IP6_FRAGMENTATION_ENABLE=1
-- OT_JAM_DETECTION=ON --> OPENTHREAD_CONFIG_JAM_DETECTION_ENABLE=1
-- OT_JOINER=ON --> OPENTHREAD_CONFIG_JOINER_ENABLE=1
-- OT_LEGACY=ON --> OPENTHREAD_CONFIG_LEGACY_ENABLE=1
-- OT_LINK_METRICS_INITIATOR=""
-- OT_LINK_METRICS_SUBJECT=""
-- OT_LINK_RAW=""
-- OT_LOG_LEVEL_DYNAMIC=ON --> OPENTHREAD_CONFIG_LOG_LEVEL_DYNAMIC_ENABLE=1
-- OT_MAC_FILTER=ON --> OPENTHREAD_CONFIG_MAC_FILTER_ENABLE=1
-- OT_MESSAGE_USE_HEAP=""
-- OT_MLE_LONG_ROUTES=""
-- OT_MLR=""
-- OT_MTD_NETDIAG=ON --> OPENTHREAD_CONFIG_TMF_NETWORK_DIAG_MTD_ENABLE=1
-- OT_MULTIPLE_INSTANCE=""
-- OT_NAT64_TRANSLATOR=""
-- OT_NEIGHBOR_DISCOVERY_AGENT=ON --> OPENTHREAD_CONFIG_NEIGHBOR_DISCOVERY_AGENT_ENABLE=1
-- OT_NETDATA_PUBLISHER=ON --> OPENTHREAD_CONFIG_NETDATA_PUBLISHER_ENABLE=1
-- OT_OTNS=""
-- OT_PING_SENDER=ON --> OPENTHREAD_CONFIG_PING_SENDER_ENABLE=1
-- OT_PLATFORM_NETIF=""
-- OT_PLATFORM_UDP=""
-- OT_REFERENCE_DEVICE=ON --> OPENTHREAD_CONFIG_REFERENCE_DEVICE_ENABLE=1
-- OT_SERVICE=ON --> OPENTHREAD_CONFIG_TMF_NETDATA_SERVICE_ENABLE=1
-- OT_SETTINGS_RAM=""
-- OT_SLAAC=ON --> OPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1
-- OT_SNTP_CLIENT=ON --> OPENTHREAD_CONFIG_SNTP_CLIENT_ENABLE=1
-- OT_SRP_CLIENT=ON --> OPENTHREAD_CONFIG_SRP_CLIENT_ENABLE=1
-- OT_SRP_SERVER=""
-- OT_TIME_SYNC=""
-- OT_TREL=""
-- OT_TX_BEACON_PAYLOAD=""
-- OT_UDP_FORWARD=""
-- OT_UPTIME=ON --> OPENTHREAD_CONFIG_UPTIME_ENABLE=1
-- OT_RCP_RESTORATION_MAX_COUNT=2
-- OpenThread CMake build type: Debug
-- Package Name: OPENTHREAD
-- Setting default package version: thread-reference-20200818-1938-g0f10480ed
-- Package Version: thread-reference-20200818-1938-g0f10480ed
-- Log output: PLATFORM_DEFINED
-- OpenThread Config File: "openthread-core-posix-config.h"
-- Readline: readline
CMake Warning (dev) at third_party/mbedtls/repo/CMakeLists.txt:39 (project):
  Policy CMP0048 is not set: project() command manages VERSION variables.
  Run "cmake --help-policy CMP0048" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The following variable(s) would be set to empty:

    PROJECT_VERSION
    PROJECT_VERSION_MAJOR
    PROJECT_VERSION_MINOR
    PROJECT_VERSION_PATCH
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Found Python3: /opt/homebrew/Frameworks/Python.framework/Versions/3.9/bin/python3.9 (found version "3.9.12") found components: Interpreter
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/lorem/Programming/ot/openthread/build/posix
+ [[ -n '' ]]
+ ninja
[28/701] cd /Users/lorem/Programming/ot/openthread/build/posix && /opt/homebrew/Cellar/cmake/3....HREAD_CONFIG_NCP_HDLC_ENABLE=1" -P /Users/lorem/Programming/ot/openthread/etc/cmake/print.cmake
OPENTHREAD_CONFIG_TMF_ANYCAST_LOCATOR_ENABLE=1
OPENTHREAD_CONFIG_BORDER_AGENT_ENABLE=1
OPENTHREAD_CONFIG_BORDER_ROUTER_ENABLE=1
OPENTHREAD_CONFIG_CHANNEL_MANAGER_ENABLE=1
OPENTHREAD_CONFIG_CHANNEL_MONITOR_ENABLE=1
OPENTHREAD_CONFIG_CHILD_SUPERVISION_ENABLE=1
OPENTHREAD_CONFIG_COAP_API_ENABLE=1
OPENTHREAD_CONFIG_COAP_BLOCKWISE_TRANSFER_ENABLE=1
OPENTHREAD_CONFIG_COAP_OBSERVE_API_ENABLE=1
OPENTHREAD_CONFIG_COAP_SECURE_API_ENABLE=1
OPENTHREAD_CONFIG_COMMISSIONER_ENABLE=1
OPENTHREAD_CONFIG_DATASET_UPDATER_ENABLE=1
OPENTHREAD_CONFIG_DHCP6_CLIENT_ENABLE=1
OPENTHREAD_CONFIG_DHCP6_SERVER_ENABLE=1
OPENTHREAD_CONFIG_DIAG_ENABLE=1
OPENTHREAD_CONFIG_DNS_CLIENT_ENABLE=1
OPENTHREAD_CONFIG_ECDSA_ENABLE=1
OPENTHREAD_CONFIG_HISTORY_TRACKER_ENABLE=1
OPENTHREAD_CONFIG_IP6_FRAGMENTATION_ENABLE=1
OPENTHREAD_CONFIG_JAM_DETECTION_ENABLE=1
OPENTHREAD_CONFIG_JOINER_ENABLE=1
OPENTHREAD_CONFIG_LEGACY_ENABLE=1
OPENTHREAD_CONFIG_LOG_LEVEL_DYNAMIC_ENABLE=1
OPENTHREAD_CONFIG_MAC_FILTER_ENABLE=1
OPENTHREAD_CONFIG_TMF_NETWORK_DIAG_MTD_ENABLE=1
OPENTHREAD_CONFIG_NEIGHBOR_DISCOVERY_AGENT_ENABLE=1
OPENTHREAD_CONFIG_NETDATA_PUBLISHER_ENABLE=1
OPENTHREAD_CONFIG_PING_SENDER_ENABLE=1
OPENTHREAD_CONFIG_REFERENCE_DEVICE_ENABLE=1
OPENTHREAD_CONFIG_TMF_NETDATA_SERVICE_ENABLE=1
OPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1
OPENTHREAD_CONFIG_SNTP_CLIENT_ENABLE=1
OPENTHREAD_CONFIG_SRP_CLIENT_ENABLE=1
OPENTHREAD_CONFIG_UPTIME_ENABLE=1
OPENTHREAD_SPINEL_CONFIG_RCP_RESTORATION_MAX_COUNT=2
OPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=1
OPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS_MANAGEMENT=1
OPENTHREAD_ENABLE_COVERAGE=1
PACKAGE_NAME=OPENTHREAD
OPENTHREAD_CONFIG_THREAD_VERSION=OT_THREAD_VERSION_1_3
OPENTHREAD_CONFIG_LOG_OUTPUT=OPENTHREAD_CONFIG_LOG_OUTPUT_PLATFORM_DEFINED
OPENTHREAD_CONFIG_FILE=openthread-core-posix-config.h
OPENTHREAD_CONFIG_NCP_HDLC_ENABLE=1
[701/701] Linking CXX executable src/posix/ot-daemon
+ cd /Users/lorem/Programming/ot/openthread
```






### Build openthread nrf52840 with joiner and native usb

```bash

$ cd ~/src
$ git clone --recursive https://github.com/openthread/ot-nrf528xx.git
$ cd ot-nrf528xx
$ script/build nrf52840 USB_trans

 ✘ lorem@lorems-MacBook-Pro  ~/Programming/ot/ot-nrf528xx   main  script/build nrf52840 USB_trans
+ OT_CMAKE_NINJA_TARGET=
+ NRF_PLATFORMS=(nrf52811 nrf52833 nrf52840)
+ readonly NRF_PLATFORMS
+ NRF_BUILD_TYPES=(UART_trans USB_trans SPI_trans_NCP soft_crypto soft_crypto_threading)
+ readonly NRF_BUILD_TYPES
++ pwd
+ readonly OT_SRCDIR=/Users/lorem/Programming/ot/ot-nrf528xx
+ OT_SRCDIR=/Users/lorem/Programming/ot/ot-nrf528xx
+ OT_OPTIONS=("-DCMAKE_BUILD_TYPE=MinSizeRel" "-DOT_PLATFORM=external" "-DOT_SLAAC=ON")
+ readonly OT_OPTIONS
+ main nrf52840 USB_trans
+ [[ 2 == 0 ]]
+ local platform=nrf52840
+ echo nrf52811 nrf52833 nrf52840
+ grep -wq nrf52840
+ [[ 2 == 1 ]]
+ local nrf_build_type=USB_trans
+ echo UART_trans USB_trans SPI_trans_NCP soft_crypto soft_crypto_threading
+ grep -wq USB_trans
+ shift
+ shift
+ local_options=()
+ local local_options
+ options=("${OT_OPTIONS[@]}")
+ local options
+ case "${platform}" in
+ local_options+=("-DCMAKE_TOOLCHAIN_FILE=src/${platform}/arm-none-eabi.cmake")
+ case "${nrf_build_type}" in
+ options+=("${local_options[@]}" "-DOT_USB=ON" "-DOT_EXTERNAL_MBEDTLS=nordicsemi-mbedtls")
+ options+=("$@")
+ build -DNRF_PLATFORM=nrf52840 -DCMAKE_BUILD_TYPE=MinSizeRel -DOT_PLATFORM=external -DOT_SLAAC=ON -DCMAKE_TOOLCHAIN_FILE=src/nrf52840/arm-none-eabi.cmake -DOT_USB=ON -DOT_EXTERNAL_MBEDTLS=nordicsemi-mbedtls
+ local builddir=build
+ mkdir -p build
+ cd build
+ cmake -GNinja -DOT_COMPILE_WARNING_AS_ERROR=ON -DNRF_PLATFORM=nrf52840 -DCMAKE_BUILD_TYPE=MinSizeRel -DOT_PLATFORM=external -DOT_SLAAC=ON -DCMAKE_TOOLCHAIN_FILE=src/nrf52840/arm-none-eabi.cmake -DOT_USB=ON -DOT_EXTERNAL_MBEDTLS=nordicsemi-mbedtls /Users/lorem/Programming/ot/ot-nrf528xx
-- OpenThread Source Directory: /Users/lorem/Programming/ot/ot-nrf528xx/openthread
-- OT_ANYCAST_LOCATOR=""
-- OT_ASSERT=""
-- OT_BACKBONE_ROUTER=""
-- OT_BACKBONE_ROUTER_DUA_NDPROXYING=""
-- OT_BACKBONE_ROUTER_MULTICAST_ROUTING=""
-- OT_BORDER_AGENT=""
-- OT_BORDER_ROUTER=""
-- OT_BORDER_ROUTING=""
-- OT_BORDER_ROUTING_NAT64=""
-- OT_CHANNEL_MANAGER=""
-- OT_CHANNEL_MONITOR=""
-- OT_CHILD_SUPERVISION=""
-- OT_COAP=""
-- OT_COAP_BLOCK=""
-- OT_COAP_OBSERVE=""
-- OT_COAPS=""
-- OT_COMMISSIONER=""
-- OT_CSL_AUTO_SYNC=""
-- OT_CSL_DEBUG=""
-- OT_CSL_RECEIVER=""
-- OT_DATASET_UPDATER=""
-- OT_DHCP6_CLIENT=""
-- OT_DHCP6_SERVER=""
-- OT_DIAGNOSTIC=""
-- OT_DNS_CLIENT=""
-- OT_DNS_DSO=""
-- OT_DNSSD_SERVER=""
-- OT_DUA=""
-- OT_ECDSA=""
-- OT_EXTERNAL_HEAP=""
-- OT_FIREWALL=""
-- OT_HISTORY_TRACKER=""
-- OT_IP6_FRAGM=""
-- OT_JAM_DETECTION=""
-- OT_JOINER=""
-- OT_LEGACY=""
-- OT_LINK_METRICS_INITIATOR=""
-- OT_LINK_METRICS_SUBJECT=""
-- OT_LINK_RAW=""
-- OT_LOG_LEVEL_DYNAMIC=""
-- OT_MAC_FILTER=""
-- OT_MESSAGE_USE_HEAP=""
-- OT_MLE_LONG_ROUTES=""
-- OT_MLR=""
-- OT_MTD_NETDIAG=""
-- OT_MULTIPLE_INSTANCE=""
-- OT_NAT64_TRANSLATOR=""
-- OT_NEIGHBOR_DISCOVERY_AGENT=""
-- OT_NETDATA_PUBLISHER=""
-- OT_OTNS=""
-- OT_PING_SENDER=ON --> OPENTHREAD_CONFIG_PING_SENDER_ENABLE=1
-- OT_PLATFORM_NETIF=""
-- OT_PLATFORM_UDP=""
-- OT_REFERENCE_DEVICE=""
-- OT_SERVICE=""
-- OT_SETTINGS_RAM=""
-- OT_SLAAC=ON --> OPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1
-- OT_SNTP_CLIENT=""
-- OT_SRP_CLIENT=""
-- OT_SRP_SERVER=""
-- OT_TIME_SYNC=""
-- OT_TREL=""
-- OT_TX_BEACON_PAYLOAD=""
-- OT_UDP_FORWARD=""
-- OT_UPTIME=""
-- OT_RCP_RESTORATION_MAX_COUNT=0
-- OpenThread CMake build type: MinSizeRel
-- Package Name: OPENTHREAD
-- Setting default package version: thread-reference-20200818-1935-g551602490
-- Package Version: thread-reference-20200818-1935-g551602490
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/lorem/Programming/ot/ot-nrf528xx/build
+ [[ -n '' ]]
+ ninja
[1/727] Building C object openthread/examples/platforms/utils/CMakeFiles/openthread-platform-utils.dir/debug_uart.c.obj
FAILED: openthread/examples/platforms/utils/CMakeFiles/openthread-platform-utils.dir/debug_uart.c.obj
/opt/homebrew/bin/arm-none-eabi-gcc -DMBEDTLS_CONFIG_FILE=\"nrf-config.h\" -DMBEDTLS_USER_CONFIG_FILE=\"nrf52840-mbedtls-config.h\" -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0 -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS_MANAGEMENT=1 -DOPENTHREAD_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1 -DOPENTHREAD_CONFIG_NCP_SPI_ENABLE=1 -DOPENTHREAD_CONFIG_PING_SENDER_ENABLE=1 -DOPENTHREAD_CONFIG_THREAD_VERSION=OT_THREAD_VERSION_1_3 -DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=\"openthread-core-nrf52840-config-check.h\" -DOPENTHREAD_PROJECT_CORE_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_SPINEL_CONFIG_RCP_RESTORATION_MAX_COUNT=0 -DPACKAGE_NAME=\"OPENTHREAD\" -DSPIS_AS_SERIAL_TRANSPORT=1 -I/Users/lorem/Programming/ot/ot-nrf528xx/build/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/include -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src/core -I/Users/lorem/Programming/ot/ot-nrf528xx/src/nrf52840 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/nrf_cc310_plat/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/mbedtls_plat_config -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms/utils -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/third_party/jlink/SEGGER_RTT_V640/RTT -mcpu=cortex-m4 -mfloat-abi=soft -mthumb -mabi=aapcs -fdata-sections -ffunction-sections -Wno-expansion-to-defined -std=gnu99 -Os -DNDEBUG -std=gnu99 -MD -MT openthread/examples/platforms/utils/CMakeFiles/openthread-platform-utils.dir/debug_uart.c.obj -MF openthread/examples/platforms/utils/CMakeFiles/openthread-platform-utils.dir/debug_uart.c.obj.d -o openthread/examples/platforms/utils/CMakeFiles/openthread-platform-utils.dir/debug_uart.c.obj -c /Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms/utils/debug_uart.c
during GIMPLE pass: cddce
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms/utils/debug_uart.c: In function 'otPlatDebugUart_write_bytes':
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms/utils/debug_uart.c:129:1: internal compiler error: Illegal instruction: 4
  129 | }
      | ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://bugs.linaro.org/> for instructions.
[2/727] Building CXX object openthread/examples/apps/cli/CMakeFiles/ot-cli-ftd.dir/cli_uart.cpp.obj
FAILED: openthread/examples/apps/cli/CMakeFiles/ot-cli-ftd.dir/cli_uart.cpp.obj
/opt/homebrew/bin/arm-none-eabi-g++ -DMBEDTLS_CONFIG_FILE=\"nrf-config.h\" -DMBEDTLS_USER_CONFIG_FILE=\"nrf52840-mbedtls-config.h\" -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0 -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS_MANAGEMENT=1 -DOPENTHREAD_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1 -DOPENTHREAD_CONFIG_NCP_SPI_ENABLE=1 -DOPENTHREAD_CONFIG_PING_SENDER_ENABLE=1 -DOPENTHREAD_CONFIG_THREAD_VERSION=OT_THREAD_VERSION_1_3 -DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=\"openthread-core-nrf52840-config-check.h\" -DOPENTHREAD_PROJECT_CORE_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_SPINEL_CONFIG_RCP_RESTORATION_MAX_COUNT=0 -DPACKAGE_NAME=\"OPENTHREAD\" -DSPIS_AS_SERIAL_TRANSPORT=1 -I/Users/lorem/Programming/ot/ot-nrf528xx/build/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/include -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src/core -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/fem -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/fem/three_pin_gpio -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/mac_features -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/mac_features/ack_generator -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/platform/temperature -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/platform/lp_timer -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch/raal -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch/raal/softdevice -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/cmsis -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/dependencies -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/clock -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/common -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/power -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/systick -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/usbd -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/app_error -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/atfifo -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/atomic -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/block_dev -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/delay -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/class/cdc -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/class/cdc/acm -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/utf_converter -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/hal -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/drivers -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/drivers/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/mdk -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/soc -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/softdevice/s140/headers -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/softdevice/s140/headers/nrf52 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/nrf_cc310_plat/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/mbedtls_plat_config -I/Users/lorem/Programming/ot/ot-nrf528xx/src/nrf52840 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/config/nrf52840/config -mcpu=cortex-m4 -mfloat-abi=soft -mthumb -mabi=aapcs -fdata-sections -ffunction-sections -Wno-expansion-to-defined -fno-exceptions -fno-rtti -Os -DNDEBUG -std=c++11 -MD -MT openthread/examples/apps/cli/CMakeFiles/ot-cli-ftd.dir/cli_uart.cpp.obj -MF openthread/examples/apps/cli/CMakeFiles/ot-cli-ftd.dir/cli_uart.cpp.obj.d -o openthread/examples/apps/cli/CMakeFiles/ot-cli-ftd.dir/cli_uart.cpp.obj -c /Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp
during GIMPLE pass: evrp
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp: In function 'int Output(const char*, uint16_t)':
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp:391:1: internal compiler error: Illegal instruction: 4
  391 | }
      | ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://bugs.linaro.org/> for instructions.
[3/727] Building CXX object openthread/examples/apps/cli/CMakeFiles/ot-cli-mtd.dir/cli_uart.cpp.obj
FAILED: openthread/examples/apps/cli/CMakeFiles/ot-cli-mtd.dir/cli_uart.cpp.obj
/opt/homebrew/bin/arm-none-eabi-g++ -DMBEDTLS_CONFIG_FILE=\"nrf-config.h\" -DMBEDTLS_USER_CONFIG_FILE=\"nrf52840-mbedtls-config.h\" -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0 -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS_MANAGEMENT=1 -DOPENTHREAD_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1 -DOPENTHREAD_CONFIG_NCP_SPI_ENABLE=1 -DOPENTHREAD_CONFIG_PING_SENDER_ENABLE=1 -DOPENTHREAD_CONFIG_THREAD_VERSION=OT_THREAD_VERSION_1_3 -DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=\"openthread-core-nrf52840-config-check.h\" -DOPENTHREAD_PROJECT_CORE_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_SPINEL_CONFIG_RCP_RESTORATION_MAX_COUNT=0 -DPACKAGE_NAME=\"OPENTHREAD\" -DSPIS_AS_SERIAL_TRANSPORT=1 -I/Users/lorem/Programming/ot/ot-nrf528xx/build/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/include -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src/core -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/fem -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/fem/three_pin_gpio -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/mac_features -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/mac_features/ack_generator -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/platform/temperature -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/platform/lp_timer -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch/raal -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch/raal/softdevice -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/cmsis -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/dependencies -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/clock -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/common -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/power -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/systick -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/usbd -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/app_error -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/atfifo -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/atomic -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/block_dev -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/delay -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/class/cdc -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/class/cdc/acm -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/utf_converter -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/hal -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/drivers -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/drivers/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/mdk -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/soc -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/softdevice/s140/headers -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/softdevice/s140/headers/nrf52 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/nrf_cc310_plat/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/mbedtls_plat_config -I/Users/lorem/Programming/ot/ot-nrf528xx/src/nrf52840 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/config/nrf52840/config -mcpu=cortex-m4 -mfloat-abi=soft -mthumb -mabi=aapcs -fdata-sections -ffunction-sections -Wno-expansion-to-defined -fno-exceptions -fno-rtti -Os -DNDEBUG -std=c++11 -MD -MT openthread/examples/apps/cli/CMakeFiles/ot-cli-mtd.dir/cli_uart.cpp.obj -MF openthread/examples/apps/cli/CMakeFiles/ot-cli-mtd.dir/cli_uart.cpp.obj.d -o openthread/examples/apps/cli/CMakeFiles/ot-cli-mtd.dir/cli_uart.cpp.obj -c /Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp
during GIMPLE pass: evrp
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp: In function 'int Output(const char*, uint16_t)':
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp:391:1: internal compiler error: Illegal instruction: 4
  391 | }
      | ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://bugs.linaro.org/> for instructions.
[4/727] Building CXX object openthread/examples/apps/cli/CMakeFiles/ot-cli-radio.dir/cli_uart.cpp.obj
FAILED: openthread/examples/apps/cli/CMakeFiles/ot-cli-radio.dir/cli_uart.cpp.obj
/opt/homebrew/bin/arm-none-eabi-g++ -DMBEDTLS_CONFIG_FILE=\"nrf-config.h\" -DMBEDTLS_USER_CONFIG_FILE=\"nrf52840-mbedtls-config.h\" -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0 -DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS_MANAGEMENT=1 -DOPENTHREAD_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1 -DOPENTHREAD_CONFIG_NCP_SPI_ENABLE=1 -DOPENTHREAD_CONFIG_PING_SENDER_ENABLE=1 -DOPENTHREAD_CONFIG_THREAD_VERSION=OT_THREAD_VERSION_1_3 -DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=\"openthread-core-nrf52840-config-check.h\" -DOPENTHREAD_PROJECT_CORE_CONFIG_FILE=\"openthread-core-nrf52840-config.h\" -DOPENTHREAD_SPINEL_CONFIG_RCP_RESTORATION_MAX_COUNT=0 -DPACKAGE_NAME=\"OPENTHREAD\" -DSPIS_AS_SERIAL_TRANSPORT=1 -I/Users/lorem/Programming/ot/ot-nrf528xx/build/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/etc/cmake -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/include -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/platforms -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src/core -I/Users/lorem/Programming/ot/ot-nrf528xx/openthread/src -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/fem -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/fem/three_pin_gpio -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/mac_features -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/mac_features/ack_generator -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/platform/temperature -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/platform/lp_timer -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch/raal -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/radio/rsch/raal/softdevice -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/cmsis -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/dependencies -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/clock -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/common -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/power -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/systick -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/drivers/usbd -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/app_error -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/atfifo -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/atomic -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/block_dev -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/delay -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/class/cdc -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/usb/class/cdc/acm -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/utf_converter -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/hal -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/drivers -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/drivers/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/mdk -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/nrfx/soc -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/softdevice/s140/headers -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/softdevice/s140/headers/nrf52 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/config -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/nrf_cc310_plat/include -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/libraries/nrf_security/mbedtls_plat_config -I/Users/lorem/Programming/ot/ot-nrf528xx/src/nrf52840 -I/Users/lorem/Programming/ot/ot-nrf528xx/third_party/NordicSemiconductor/config/nrf52840/config -mcpu=cortex-m4 -mfloat-abi=soft -mthumb -mabi=aapcs -fdata-sections -ffunction-sections -Wno-expansion-to-defined -fno-exceptions -fno-rtti -Os -DNDEBUG -std=c++11 -MD -MT openthread/examples/apps/cli/CMakeFiles/ot-cli-radio.dir/cli_uart.cpp.obj -MF openthread/examples/apps/cli/CMakeFiles/ot-cli-radio.dir/cli_uart.cpp.obj.d -o openthread/examples/apps/cli/CMakeFiles/ot-cli-radio.dir/cli_uart.cpp.obj -c /Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp
during GIMPLE pass: evrp
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp: In function 'int Output(const char*, uint16_t)':
/Users/lorem/Programming/ot/ot-nrf528xx/openthread/examples/apps/cli/cli_uart.cpp:391:1: internal compiler error: Illegal instruction: 4
  391 | }
      | ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://bugs.linaro.org/> for instructions.
[10/727] cd /Users/lorem/Programming/ot/ot-nrf528xx/build/openthread && /opt/homebrew/Cellar/cm...ILE="nrf-config.h"" -P /Users/lorem/Programming/ot/ot-nrf528xx/openthread/etc/cmake/print.cmake
OPENTHREAD_CONFIG_PING_SENDER_ENABLE=1
OPENTHREAD_CONFIG_IP6_SLAAC_ENABLE=1
OPENTHREAD_SPINEL_CONFIG_RCP_RESTORATION_MAX_COUNT=0
OPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0
OPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS_MANAGEMENT=1
PACKAGE_NAME=OPENTHREAD
OPENTHREAD_CONFIG_THREAD_VERSION=OT_THREAD_VERSION_1_3
OPENTHREAD_CONFIG_NCP_SPI_ENABLE=1
OPENTHREAD_CONFIG_FILE=openthread-core-nrf52840-config.h
OPENTHREAD_PROJECT_CORE_CONFIG_FILE=openthread-core-nrf52840-config.h
OPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=openthread-core-nrf52840-config-check.h
MBEDTLS_USER_CONFIG_FILE=nrf52840-mbedtls-config.h
SPIS_AS_SERIAL_TRANSPORT=1
OPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE=openthread-core-nrf52840-config-check.h
MBEDTLS_CONFIG_FILE=nrf-config.h
ninja: build stopped: subcommand failed.

```