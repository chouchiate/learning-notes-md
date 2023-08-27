## [cmake] - Tutorial
> Walking through cmake tutorials and notes

### Step 0 - Download source
* [cmake-source](https://github.com/Kitware/CMake)
### Step 1 - CMakeLists.txt Basic
* in CMake source\Help\guide\tutorial\Step1 folder create CMakeLists.txt
    ```cmake
    cmake_minimum_required(VERSION 3.10)

    # set the project name
    project(Tutorial)

    # add the executable
    add_executable(Tutorial tutorial.cxx)
    ```
    * in CMake source\Help\guide\tutorial folder create Step1_build
    * within Step1_build run
    ```bash
        $ cmake ../Step1
        # you get following
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
        -- Configuring done
        -- Generating done
        -- Build files have been written to: /Users/thudercat/Programming/CMake/Help/guide/tutorial/Step1_build
    ```
* following files are generated
    - CMakeFiles folder
    - cmake_install.cmake
    - CMakeCache.txt
    - Makefile

* Compile link Project
    ```bash
    $ cmake --build .
    # you get
    [ 50%] Building CXX object CMakeFiles/Tutorial.dir/tutorial.cxx.o
    [100%] Linking CXX executable Tutorial
    [100%] Built target Tutorial
    ```
* Run built binary
    ```bash
        ./Tutorial 12345
        # you get
        The square root of 12345 is 111.108
    ```

#### Adding version number
* modify CMakeLists.txt to use **project()** command:
```cmake
    cmake_minimum_required(VERSION 3.10)

    # set the project name and version
    project(Tutorial VERSION 1.0)

```
#### Configured Header File
* configure a header file to pass version number to source code:
```cmake
    configure_file(TutorialConfig.h.in TutorialConfig.h)
```
* add directory to list of paths to search for include files
```cmake
target_include_directories(Tutorial PUBLIC
                           "${PROJECT_BINARY_DIR}"
                           )
```
* create **TutorialConfig.h.in** in source directory
```h
// the configured options and settings for Tutorial
#define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@
#define Tutorial_VERSION_MINOR @Tutorial_VERSION_MINOR@
```
* modify tutorial.cxx to include TutorialConfig.h
* print out executable name and version number
* remove cstdlib and use c++11 feature
```cpp
// A simple program that computes the square root of a number
#include <cmath>
// #include <cstdlib>
#include <iostream>
#include <string>
#include "TutorialConfig.h.in"

int main(int argc, char* argv[])
{
  // if (argc < 2) {
  //   std::cout << "Usage: " << argv[0] << " number" << std::endl;
  //   return 1;
  // }
  if (argc < 2) {
      // report version
      std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
                << Tutorial_VERSION_MINOR << std::endl;
      std::cout << "Usage: " << argv[0] << " number" << std::endl;
      return 1;
    }

  // convert input to double
  const double inputValue = std::stod(argv[1]);
  // use of c++11 feature
  // const double inputValue = atof(argv[1]);

  // calculate square root
  const double outputValue = sqrt(inputValue);
  std::cout << "The square root of " << inputValue << " is " << outputValue
            << std::endl;
  return 0;
}

```
* specify c++ standard in CMakeLists.txt
```cmake
    # specify the C++ standard
    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED True)
```
* rebuild
```bash
cd Step1_build
cmake --build .
## got error message
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/thudercat/Programming/CMake/Help/guide/tutorial/Step1_build
Consolidate compiler generated dependencies of target Tutorial
[ 50%] Building CXX object CMakeFiles/Tutorial.dir/tutorial.cxx.o
/Users/thudercat/Programming/CMake/Help/guide/tutorial/Step1/tutorial.cxx:16:46: error: expected expression
      std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
                                             ^
/Users/thudercat/Programming/CMake/Help/guide/tutorial/Step1/TutorialConfig.h.in:2:32: note: expanded from macro 'Tutorial_VERSION_MAJOR'
#define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@
                               ^
1 error generated.
make[2]: *** [CMakeFiles/Tutorial.dir/tutorial.cxx.o] Error 1
make[1]: *** [CMakeFiles/Tutorial.dir/all] Error 2
make: *** [all] Error 2

```
* fixes (what did i do wrong)
    - change #include "TutorialConfig.h.in" to #include "TutorialConfig.h"
* and again
```bash
$ cmake --build .
Consolidate compiler generated dependencies of target Tutorial
[ 50%] Building CXX object CMakeFiles/Tutorial.dir/tutorial.cxx.o
/Users/thudercat/Programming/CMake/Help/guide/tutorial/Step1/tutorial.cxx:16:69: error: expected expression
      std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
                                                                    ^
/Users/thudercat/Programming/CMake/Help/guide/tutorial/Step1/tutorial.cxx:17:43: error: expected expression
                << Tutorial_VERSION_MINOR << std::endl;
                                          ^
2 errors generated.
make[2]: *** [CMakeFiles/Tutorial.dir/tutorial.cxx.o] Error 1
make[1]: *** [CMakeFiles/Tutorial.dir/all] Error 2
make: *** [all] Error 2
```
* fixes (what did i do wrong)
    - change CMakeLists.txt
        - project(Tutorial) to project(Tutorial VERSION 1.0)

* run executable again
```bash
$ ./Tutorial 12345
The square root of 12345 is 111.108
$ ./Tutorial
# the version number is now reported when running the executable without any arguments
./Tutorial Version 1.0
Usage: ./Tutorial number

```

### Step 2 - Adding a Library



### external

* [tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
