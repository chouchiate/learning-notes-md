## [esp] - iot development framework

### Clone esp-idf
```bash
$ git clone --recursive https://github.com/espressif/esp-idf.git
```

### Run Install.sh
```bash
# goto ~/.esp/esp-idf
$ ./install.sh

Detecting the Python interpreter
Checking "python3" ...
Python 3.10.4
"python3" has been detected
Checking Python compatibility
Installing ESP-IDF tools
Current system platform: macos-arm64
Selected targets are: esp32c2, esp32s3, esp32, esp32s2, esp32h2, esp32c3
Installing tools: xtensa-esp-elf-gdb, riscv32-esp-elf-gdb, xtensa-esp32-elf, xtensa-esp32s2-elf, xtensa-esp32s3-elf, riscv32-esp-elf, esp32ulp-elf, esp32s2ulp-elf, openocd-esp32
Installing xtensa-esp-elf-gdb@11.2_20220808

...
```

### Add esp tools to path
```bash
$ get_idf

## logs
Detecting the Python interpreter
Checking "python3" ...
Python 3.10.4
"python3" has been detected
Checking Python compatibility
Checking other ESP-IDF version.
Adding ESP-IDF tools to PATH...
Not using an unsupported version of tool cmake found in PATH: 3.24.1.
Not using an unsupported version of tool ninja found in PATH: 1.11.0.
Using Python interpreter in /Users/ngrk/.espressif/python_env/idf5.1_py3.10_env/bin/python

...

To free up even more space, remove installation packages of those tools. Use option 'python3 /Users/ngrk/Programming/esp/esp-idf/tools/idf_tools.py uninstall --remove-archives'.

Done! You can now compile ESP-IDF projects.
Go to the project directory and run:

  idf.py build
```

### Build Code
```bash
$ idf.py build --help


```

### Troubleshooting

####

```bash
$ git submodule update --init --recursive

## No url found for submodule path 'components/asio/asio' in .gitmodules

# at esp-idf path
$ cd tools

$ ./set-submodules-to-github.sh

```

### Copy esp-idf-template from github
```bash
$ git clone https://github.com/espressif/esp-idf-template.git
## copy to new project

$ cp -R ./esp-idf-template ./esp32_mqtt_led_display_project

```


### idf.py notes
* idf.py is a CMake wrapper
* Manage following tools
    1. CMake - configure projects to build
    2. Ninja or GNU Make - command-line build tool
    3. esptool.py - flashing target
* project directory contains all files and configurations to build app/executable as well as
    1. partition table
    2. data/filesystem partitions
    3. bootloader
* project configuration holds in **sdkconfig** in root directory, and is modified by idf.py menuconfig
* **components** are compiled into static libraries (*.a file) and linked into app
* **target** is the hardware for which app is built to. idf.py -list-targets

[setup-idf-py-how-to](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html#get-started-configure)

* Should run in ESP-IDF project directory
    - with CMakeList.txt


### idf build system
[doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/build-system.html#)

### check usb port on macos

```bash
$ ls /dev/cu.*
```

### Flashing to device

```bash
$ idf.py -p PORT [-b BAUD] flash
```

```bash
/Users/jubo/.espressif/python_env/idf5.1_py3.10_env/bin/python ../../../../esp-idf/components/esptool_py/esptool/esptool.py -p /dev/cu.usbserial-120 -b 460800 --before default_reset --after hard_reset --chip esp32  write_flash --flash_mode dio --flash_size 2MB --flash_freq 40m 0x1000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 build/wifi_softAP.bin
```


### idf.py commands
* idf.py --help
* idf.py create-project --path <project_path> <project_name>
* idf.py set-target <target>
    * set target for project
* idf.py menuconfig
    * configure project
* idf.py build, involves following steps:
    1. create build directory
    2. run CMake to configure project and generate build files
    3. run main build tool. (Ninja or GNU Make)

* idf.py clean
    * deleting build output files, forcing full-rebuild on next build; this does not delete CMake configuration output
* idf.py fullclean
    * deleting build directory contents including all CMake configuration output. **use with care**
* idf.py flash
    * automatically build and flash the target
    * -p port select option
    * -b baudrate select option
* idf.py monitor
    * display serial output from the target
    * -p set port name option
   api-guides/tools/idf-monitor.html)


### Use CMake Directly




### idf monitor
 * more info [idf-monitor](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/

### external
* [github](https://github.com/espressif/esp-idf)
* [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html#get-started-set-up-env)
