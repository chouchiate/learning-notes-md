## [freertos] - Task Creation

### what is a task
* task is a piece of code which is schedulable

### Task Creation
```c
BaseType_t xTaskCreate(
    TaskFunction_t pvTaskCode,
    const char * const pcName,
    unsigned short usStackDepth,
    void *pvParameters,
    UBaseType_t uxPriority,
    TaskHandle_t *pxCreatedTask
);
```

### Task Implementation
```c
    void vATaskFunction(void *pvParameters) {
        // Each instance of a task created will have its own copy of the iVariableExample variable.

        // if declare as static, only one copy would exist and be shared by each created instance of the task.
        int iVariableExample = 0;   // local variable
        static int iSharedVariable = 0; // global variable (shared)
        for (;;) {
            // -- task application code here --
        }
    // if task ever break out of above loop, task must be deleted before reaching the end of this function.
    // null is passed indicates that the task is to be deleted by itself, ie (this) task
        vTaskDelete(NULL);
    }
```

### Modules API
* xTaskCreate
* xTaskCreateStatic
* xTaskCreateRestrictedStatic
* vTaskDelete

### xTaskCreate
* create a new task using dynamic memory allocation and add to ready queue of the kernel

| parameter | description |
| ----- | ----- |
| TaskFunciton_t pxTaskCode | Address of the associated task handler |
| const char* const pcName | descriptive name identifier |
| const configSTACK_DEPTH_TYPE usStackDepth | amount of stack memory allocated to this task (in words) |
| void* const pvParameters | pointer to data which needs to be passed to the task handler once it get scheduled |
|UBaseType_t uxPriority | Task priority value |
|TaskHandle_t* const pxCreatedTask | used to save task handle (address of) |