## [unity] - test environment

### Linux
* Default support ***gcc*** command to invoke GNU C compiler
* Need to install g++ to use CppUTest
```bash
$ sudo apt-get install build-essential
$ sudo apt-get install g++
```
### Window
* Cygwin
* MinGW + MSYS
* VM Linux (Virtual box)

### Mac
* Xcode dev env include GNU toolchain

### IDE Eclipse setup


### VSCode setup


### Full test build makefile
* incremental build based on file dependencies for fast build
* Test are run with every build
* Test files override production code
* No cruft files (left over) should be in the directory tree

### Directory structure
* isolate test code from production code
* specify a list of production code directories
* compiled and put into a library

```make
# production code directory
SRC_DIRS = \
    src/IO \
    src/util \
    src/LedDriver \
    src/HomeAutomation
```

* tests, tests doubles, and tests helpers are compiled and left as object (.o) files
```make
# test code directory
TEST_SRC_DIRS = \
    tests\
    mocks\
    tests/IO\
    tests/util \
    tests/LedDriver \
    test/HomeAutomation
```

### AllTests.cpp
* defines the test main()
* calls the test runner to run all tests
* compiled to an object file
* test .o files are explicitly included as inputs to the linker along with test main
* production code is pulled in from the library only if they are unresolved externals in tests
* link-time test doubles override any production code in library --> first chance to resolve undefined symbols.






