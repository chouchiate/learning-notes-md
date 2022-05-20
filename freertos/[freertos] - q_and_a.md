## [freertos] - Q & As

### what is PRIVILEGED_FUNCTION
* this is a MPU port macro defined in mpu_wrappers.h
* It is used on MPU ports to place FreeRTOS kernel code in a separate protected privileged section.
```c
        #define PRIVILEGED_FUNCTION
        #define PRIVILEGED_DATA    __attribute__( ( section( "privileged_data" ) ) )
        #define FREERTOS_SYSTEM_CALL
```
* For non-MPU ports PRIVILEGED_FUNCTION is defined to nothing:
```c
void vListInitialise( List_t * const pxList );
```
* For MPU ports, it is defined to __attribute__((section("privileged_functions")))
```c
void vListInitialise( List_t * const pxList ) __attribute__((section("privileged_functions")));
```
* Linker scripts are then used to place these FreeRTOS functions in a separate privileged section.
[github](https://github.com/FreeRTOS/FreeRTOS/blob/main/FreeRTOS/Demo/CORTEX_MPU_STM32L4_Discovery_GCC_IAR_Keil/Projects/GCC/STM32L475VGTX_FLASH.ld#L90)

