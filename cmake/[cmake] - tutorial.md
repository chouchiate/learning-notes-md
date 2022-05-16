## [cmake] - Tutorial
### Cmake vs Make
> CMake is a generator of build systems. It can produce Makefiles; it can produce Ninja build files; it can produce KDEvelop or Xcode projects, it can produce Visual Studio solutions.

> Make (or rather a Makefile) is a build system - it drives the compiler and other build tools to build your code.

> CMake does a two-step build: it generates a low-level build script in ninja or make or many other generators, and then you run it. All the shell script pieces that are normally piled into Makefile are only executed at the generation stage. Thus, CMake build can be orders of magnitude faster.

> CMake has three data types: string, list, and a target with properties. make has one: string;

