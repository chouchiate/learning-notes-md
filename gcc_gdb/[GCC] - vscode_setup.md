## GCC setup for Visual studio Code (MacOS)

* check if clang is installed
```bash
$ clang --version
```

* if not installed, enter following command
```bash
$ xcode-select --install
```

* check gcc/gdb version
```bash
$ g++ --verion
$ gdb --version
```

* Create and Build your C/C++ Files (eg. main.c / main.cpp)
  * choose Terminal > Configure Default Build Task

* Create tasks.json (build instructions)
  * tasks.json variable reference
  **[@REFERENCE](https://code.visualstudio.com/docs/editor/variables-reference)**
```json
  * args array - command-line arguments passed to gcc.

  * Tell compiler to 
    1. compile active file (${file}) and 
    2. create an output file -o 
    3. create in folder "${fileDirname}"/"${fileBasenameNoExtension}"
    4. where "${fileDirname}" is cwd

  *
```

* Create launch.json (debugger settings)
```json

```

* Create c_cpp_properties.json (Compile path and IntelliSense Settings)
```json

```


