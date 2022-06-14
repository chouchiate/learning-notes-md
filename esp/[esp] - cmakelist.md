## [esp] - CMakeList Notes

### Mandatory Components
- cmake_minimum_required(VERSION 3.16)
    * CMake minimum version
- include($ENV{IDF_PATH}/tools/cmake/project.cmake)
    * pulls in the rest of the CMake functionality to configure the project, discover all the components
- project(myProject)
    * creates the project itself, and specifies the project name, same name as output file (ie. myProject.elf, myProject.bin)

### Optional Project Variables
> optional variables have default value implemented at [github](https://github.com/espressif/esp-idf/blob/20f5e180ee/tools/cmake/project.cmake)
- COMPONENT_DIRS (Line:234)
    * Directories to search for components. Defaults to IDF_PATH/components, PROJECT_DIR/components, and EXTRA_COMPONENT_DIRS.
- EXTRA_COMPONENT_DIRS (Line:239)
    * Optional list of additional directories to search for components. Paths can be relative to the project directory, or absolute.
- COMPONENTS (Line:275)
    * A list of component names to build into the project. Defaults to all components found in the COMPONENT_DIRS directories.


### Multiple components with the same name

### Minimal CMakeFile.txt example
```cmake
    cmake_minimum_required(VERSION 3.16)
    include($ENV{IDF_PATH}/tools/cmake/project.cmake)
    project(myProject)
```

### Minimal Component CMakeLists
* simplify component register to build system using idf_component_register
```cmake
idf_component_register(SRCS "foo.c" "bar.c"
                       INCLUDE_DIRS "include"
                       REQUIRES mbedtls)

```

- SRCS
    * list of source files (*.c, *.cpp, *.cc, *.S). These source files will be compiled into the component library.
- INCLUDE_DIRS
    *  list of directories to add to the global include search path for any component which requires this component, and also the main source files.
- REQUIRES
    * optional. only required to declare what other components this component will use.