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

### esp_sample_coding_style_h
```c
// add includes
#include "esp_netif.h"
// macros and defines
#define CODING_STYLE_EXAMPLE_DEFINE "coding_style"

// externed variables
extern esp_netif_t* coding_style_esp_netif_sta;
extern exp_netif_t* coding_style_esp_netif_ap;

// typedefs
/**
 * provide a description for your typedefs
 * @note add notes if necessary
 * @note postfix enums with "_e"
 */
typedef enum
{
    CODING_STYLE_FIRST = 0,
    CODING_STYLE_SECOND,
    CODING_STYLE_THIRD,
} coding_style_message_e;

/**
 * description
 * @note postfix structs with "_t"
 */
typedef struct
{
    coding_style_message_e msgID;
    void *param;
} coding_style_queue_message_t;
// public function prototypes
/**
 * description for public function definitions
 * @note use the "file_name" prefix for function name e.g. "coding_style"
 * @param var_a describe input parameter for var_a
 * @param var_b describe input parameter for var_b
 * @param var_c describe input parameter for var_c
 * @return ESP_OK, if successful
 */
esp_err_t coding_style_public(int var_a, int var_b, int var_c);
```
### esp_sample_coding_style_c
```c
// include standard library header files
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
// include esp-idf headers
#include "esp_err.h"
#include "esp_log.h"
#include "nvs_flash.h"
// include application headers
#include "coding_style.h"

// global variable defined with "g_" prefix and use "static" keyword
static bool g_variable = false;
// global netif objects for the WIFI station and access point
esp_netif_t* coding_style_esp_netif_sta = NULL;
esp_netif_t* esp_netif_t* coding_style_esp_netif_ap = NULL;

// private static functions section

/**
 * static function definitions require a description
 * @note use the "file_name" prefix for function name
 * @param var_a describe input parameter for var_a
 * @param var_b describe input parameter for var_b
 * @param var_c describe input parameter for var_c
 * return ESP_OK, if successful
 */
static esp_err_t coding_style_static(int var_a) {
    esp_err_t esp_err = ESP_OK;
    if (var_a < 0) {
        esp_err = ESP_FAIL;
    }
    g_variable = true;
    return esp_err;
}

```

### external
* [doc] (https://www.freertos.org/FreeRTOS-Coding-Standard-and-Style-Guide.html#NamingConventions)

