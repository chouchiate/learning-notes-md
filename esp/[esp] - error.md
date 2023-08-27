## [esp] - error handling


### error enumerations
```c
// esp_err.h

typedef int esp_err_t;

/* Definitions for error constants. */
#define ESP_OK          0       /*!< esp_err_t value indicating success (no error) */
#define ESP_FAIL        -1      /*!< Generic esp_err_t code indicating failure */

#define ESP_ERR_NO_MEM              0x101   /*!< Out of memory */
#define ESP_ERR_INVALID_ARG         0x102   /*!< Invalid argument */
#define ESP_ERR_INVALID_STATE       0x103   /*!< Invalid state */
#define ESP_ERR_INVALID_SIZE        0x104   /*!< Invalid size */
#define ESP_ERR_NOT_FOUND           0x105   /*!< Requested resource not found */
#define ESP_ERR_NOT_SUPPORTED       0x106   /*!< Operation or feature not supported */
#define ESP_ERR_TIMEOUT             0x107   /*!< Operation timed out */
#define ESP_ERR_INVALID_RESPONSE    0x108   /*!< Received response was invalid */
#define ESP_ERR_INVALID_CRC         0x109   /*!< CRC or checksum was invalid */
#define ESP_ERR_INVALID_VERSION     0x10A   /*!< Version was invalid */
#define ESP_ERR_INVALID_MAC         0x10B   /*!< MAC address was invalid */
#define ESP_ERR_NOT_FINISHED        0x10C   /*!< There are items remained to retrieve */

//////////////////////////////// more codes below

```

### Print Error code to string
```c
// esp_err_to_name.c


// #ifdef CONFIG_ESP_ERR_TO_NAME_LOOKUP
#define ERR_TBL_IT(err)    {err, #err}

typedef struct {
    esp_err_t code;
    const char *msg;
} esp_err_msg_t;

static const esp_err_msg_t esp_err_msg_table[] = {
    // components/esp_common/include/esp_err.h
#   ifdef      ESP_FAIL
    ERR_TBL_IT(ESP_FAIL),                                       /*    -1 Generic esp_err_t code indicating failure */
#   endif
#   ifdef      ESP_OK
    ERR_TBL_IT(ESP_OK),                                         /*     0 esp_err_t value indicating success (no error) */
#   endif
#   ifdef      ESP_ERR_NO_MEM
    ERR_TBL_IT(ESP_ERR_NO_MEM),                                 /*   257 0x101 Out of memory */
#   endif

//////////////////////////////// more jump tables

}

const char *esp_err_to_name(esp_err_t code)
{
#ifdef CONFIG_ESP_ERR_TO_NAME_LOOKUP
    size_t i;

    for (i = 0; i < sizeof(esp_err_msg_table)/sizeof(esp_err_msg_table[0]); ++i) {
        if (esp_err_msg_table[i].code == code) {
            return esp_err_msg_table[i].msg;
        }
    }
#endif //CONFIG_ESP_ERR_TO_NAME_LOOKUP

    return esp_unknown_msg;
}


```

### Error Check

```c
// esp_err.c
#ifndef CONFIG_IDF_TARGET_LINUX
    #include "esp_cpu.h"
#else
    /* esp_cpu.h isn't available when building for Linux */
    static intptr_t esp_cpu_get_call_addr(intptr_t return_address)
    {
        /* on x86, there is no hope to get the address of the previous instruction */
        return return_address;
    }
#endif

static void esp_error_check_failed_print(const char *msg, esp_err_t rc, const char *file, int line, const char *function, const char *expression, intptr_t addr)
{
    esp_rom_printf("%s failed: esp_err_t 0x%x", msg, rc);
#ifdef CONFIG_ESP_ERR_TO_NAME_LOOKUP
    esp_rom_printf(" (%s)", esp_err_to_name(rc));
#endif //CONFIG_ESP_ERR_TO_NAME_LOOKUP
    esp_rom_printf(" at 0x%08x\n", esp_cpu_get_call_addr(addr));
    if (spi_flash_cache_enabled()) { // strings may be in flash cache
        esp_rom_printf("file: \"%s\" line %d\nfunc: %s\nexpression: %s\n", file, line, function, expression);
    }
}

void _esp_error_check_failed_without_abort(esp_err_t rc, const char *file, int line, const char *function, const char *expression)
{
    esp_error_check_failed_print("ESP_ERROR_CHECK_WITHOUT_ABORT", rc, file, line, function, expression, (intptr_t)__builtin_return_address(0));
}

void _esp_error_check_failed(esp_err_t rc, const char *file, int line, const char *function, const char *expression)
{
    esp_error_check_failed_print("ESP_ERROR_CHECK", rc, file, line, function, expression, (intptr_t)__builtin_return_address(0));
    abort();
}

```