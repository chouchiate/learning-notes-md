## [freertos] - coding style and standards


* TickType_t
    - in FREERTOS_CONFIG_H
        ```c
        configUSE_16_BIT_TICKS=1 // 16bit
        configUSE_16_BIT_TICKS=0 // 32bit
        ```

* BaseType_t
    - most efficient, natural type for architecture
        32 bit arch, BaseType_t = 32-bit type
        16 bit arch, BaseType_t = 16-bit type
        8 bit arch, BaseType_t = 8-bit type
* UBaseType_t
    - an unsigned BaseType_t
* StackType_t
    - type used by arch for items store on the stack


### external
* [doc] (https://www.freertos.org/FreeRTOS-Coding-Standard-and-Style-Guide.html#NamingConventions)

