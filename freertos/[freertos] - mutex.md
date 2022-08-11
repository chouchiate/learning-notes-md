## [freertos] - mutex

### xSemaphoreCreateRecursiveMutex
- Recursive mutexes cannot be used in interrupt service routines
- must configSUPPORT_DYNAMIC_ALLOCATION = 1
- must configUSE_RECURSIVE_MUTEXES = 1

mutex is taken / obtained by xSemaphoreTakeRecursive()
mutex is given / released by xSemaphoreGiveRecursive()

```c
 SemaphoreHandle_t xMutex;

 void vATask( void * pvParameters )
 {
    // Create a recursive mutex.
    xMutex = xSemaphoreCreateRecursiveMutex();

    if( xMutex != NULL )
    {
        /* The recursive mutex was created successfully and
        can now be used. */
    }
 }
```

### Allocate with dynamic memory during run time
- use xSemaphoreCreateRecursiveMutex()

### Allocate with static memory in compile time
- use xSemaphoreCreateRecursiveMutexStatic()
[static vs dynamic allocation](https://www.freertos.org/Static_Vs_Dynamic_Memory_Allocation.html)


