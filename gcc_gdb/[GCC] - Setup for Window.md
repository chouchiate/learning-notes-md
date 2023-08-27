# GNU GCC Setup for Window

## Install Cygwin

### Install gcc-core

### Install gdb

```
cygcheck -c cygwin
```

```
gcc --version
```

### Create Configuration file

```
ctrl + shift + p
C/C++: Edit Configurations (UI)
Compiler Directory: C:/cygwin64/bin/gcc.exe
Intelli-Sense gcc-x64
C Standard: C11
cppStandard: C++11

create c_cpp_properties.json


{
    "configurations": [
        {
            "name": "Win32",
            "includePath": [
                "${workspaceFolder}/**"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE"
            ],
            "windowsSdkVersion": "10.0.17763.0",
            "compilerPath": "C:/cygwin64/bin/gcc.exe",
            "cStandard": "c11",
            "cppStandard": "c++11",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
```

### Create Default Build Task

```
ctrl + shift + p
Tasks: Configure Default Build Task

create tasks.json


{
    "tasks": [
        {
            "type": "cppbuild",
            "label": "C/C++: gcc.exe 建置使用中檔案",
            "command": "C:\\cygwin64\\bin\\gcc.exe",
            "args": [
                "-g",
                "${file}",
                "-o",
                "${fileDirname}\\${fileBasenameNoExtension}.exe"
            ],
            "options": {
                "cwd": "C:\\cygwin64\\bin"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "detail": "偵錯工具產生的工作。"
        }
    ],
    "version": "2.0.0"
}
```

### Setup Debugger

```
ctrl + shift + p
type launch
Select Debug: open launch.json


{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/test.exe",
            "args": [],
            "stopAtEntry": true,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "C:\\cygwin64\\bin\\gcc.exe",
            "setupCommands": [
                {
                    "description": "啟用 gdb 的美化顯示",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
```

## Change Settings

```
ctrl + shift + p
Preference: Open Settings (JSON)


```



