## [freertos] - Semaphore

### xSemaphoreCreateMutex
* Creates a mutex, and returns a handle for referencing
* * Mutexes cannot be used in interrupt service routines.
```c
/*
configSUPPORT_DYNAMIC_ALLOCATION and configUSE_MUTEXES must both be set to 1 in FreeRTOSConfig.h
*/
// queue.h
struct QueueDefinition;
typedef struct QueueDefinition   * QueueHandle_t;

// semphr.h

typedef QueueHandle_t SemaphoreHandle_t;

SemaphoreHandle_t xSemaphoreCreateMutex( void )

// have a taste of inheritance from queue.h
#if ( configSUPPORT_DYNAMIC_ALLOCATION == 1 )
    #define xSemaphoreCreateMutex()    xQueueCreateMutex( queueQUEUE_TYPE_MUTEX )
#endif

```

---
### xSemaphoreCreateMutexStatic
```c
#if ( configSUPPORT_STATIC_ALLOCATION == 1 )
    #define xSemaphoreCreateMutexStatic( pxMutexBuffer )    xQueueCreateMutexStatic( queueQUEUE_TYPE_MUTEX, ( pxMutexBuffer ) )
#endif /* configSUPPORT_STATIC_ALLOCATION */
```

* [doc](https://www.freertos.org/CreateMutex.html)


---
### xSemaphoreTake

* Macro to obtain a semaphore created from
  * xSemaphoreCreateBinary(),
  * xSemaphoreCreateMutex(),
  * xSemaphoreCreateCounting(),
* cannot be used in interrupt
  * xQueueReceiveFromISR() can be used to take a semaphore from within an interrupt
```c
// portmacro.h

#if( configUSE_16_BIT_TICKS == 1 )
typedef uint16_t TickType_t;
#define portMAX_DELAY ( TickType_t ) 0xffff
#else
typedef uint32_t TickType_t;
#define portMAX_DELAY ( TickType_t ) 0xffffffffUL
#endif


// semphr.h
#define semGIVE_BLOCK_TIME                  ( ( TickType_t ) 0U )

xSemaphoreTake( SemaphoreHandle_t xSemaphore, TickType_t xTicksToWait );

#define xSemaphoreTake( xSemaphore, xBlockTime )    xQueueSemaphoreTake( ( xSemaphore ), ( xBlockTime ) )
```

---
### xSemaphoreTakeRecursive




---
### xSemaphoreGive

```c
#define xSemaphoreGive( xSemaphore )    xQueueGenericSend( ( QueueHandle_t ) ( xSemaphore ), NULL, semGIVE_BLOCK_TIME, queueSEND_TO_BACK )
```

---
### xSemaphoreGiveRecursive

```c
```



---
### xQueueGenericSend



---
### xSemaphoreTakeRecursive

