## [esp] - iot development framework

### Add esp tools to path
```bash
$ get_idf
## you can use idf.py command in console now!

```
### toolchain setup
[doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html#get-started-set-up-env)

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