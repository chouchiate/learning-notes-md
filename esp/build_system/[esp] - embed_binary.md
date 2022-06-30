## [esp] - embed binary

### how to embed binary

1. Register EMBED_FILES in cmakelist.txt
    ```c
    idf_component_register(...
                        EMBED_FILES server_root_cert.der)
    ```

2. or if file is string, use EMBED_TXTFILES
    ```c
    idf_component_register(...
                       EMBED_TXTFILES server_root_cert.pem)
    ```
3. file contents will be store in .rodata section in flash, can be accessed as follow:
    ```c
        extern const uint8_t server_root_cert_pem_start[] asm("_binary_server_root_cert_pem_start");

        extern const uint8_t server_root_cert_pem_end[]   asm("_binary_server_root_cert_pem_end");
    ```
    Notes:
        * Characters /, ., etc. are replaced with underscores.
        * The _binary prefix in the symbol name is added by objcopy and is the same for both text and binary files.
        * [example](https://github.com/espressif/esp-idf/blob/c2ccc383da/examples/protocols/http_server/file_serving/main/CMakeLists.txt)


* [api](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/build-system.html#embedding-binary-data)