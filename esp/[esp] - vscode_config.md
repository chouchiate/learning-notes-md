## [esp] - vscode configuration

### vscode c_cpp_properties_json
* include paths for project (macOS)
  * components headers
  * freertos.h / tasks.h
  * arm-gcc-none-eabi headers
  * sdkconfig.h
  * workspaces headers
  * bootloader headers
```json
{
    "configurations": [
        {
            "name": "ESP-IDF",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "includePath": [
                "${config:idf.espIdfPath}/components/**",
                "${config:idf.espIdfPathWin}/components/**",
                "/Users/jubo/Programming/esp/esp-idf/components/freertos/FreeRTOS-Kernel/**",
                "/Applications/ARM/lib/gcc/arm-none-eabi/11.2.1/include/**",
                "${workspaceFolder}/**",
                "${workspaceFolder}/bluetooth/bluedroid/ble/gatt_client/build/bootloader/config/"
            ],
            "browse": {
                "path": [
                    "${config:idf.espIdfPath}/components",
                    "${config:idf.espIdfPathWin}/components",
                    "${workspaceFolder}"
                ],
                "limitSymbolsToIncludedHeaders": false
            },
            "compilerPath": "/opt/homebrew/bin/arm-none-eabi-gcc"
        }
    ],
    "version": 4
}
```

* [github](https://github.com/espressif/vscode-esp-idf-extension/blob/master/docs/C_CPP_CONFIGURATION.md)