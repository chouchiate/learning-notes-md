## [esp] - Event Loop Library

> ***Event loops*** are the vehicle by which events get ***posted by event sources*** and ***handled by event handler functions***. These two appear prominently in the event loop library APIs.

### API
* [api](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/esp_event.html)

###  Implementation
```c
// 1. Define the event handler
void run_on_event(void* handler_arg, esp_event_base_t base, int32_t id, void* event_data)
{
    // Event handler logic
}

void app_main()
{
    // 2. A configuration structure of type esp_event_loop_args_t is needed to specify the properties of the loop to be
    // created. A handle of type esp_event_loop_handle_t is obtained, which is needed by the other APIs to reference the loop
    // to perform their operations on.
    esp_event_loop_args_t loop_args = {
        .queue_size = ...,
        .task_name = ...
        .task_priority = ...,
        .task_stack_size = ...,
        .task_core_id = ...
    };

    esp_event_loop_handle_t loop_handle;

    esp_event_loop_create(&loop_args, &loop_handle);

    // 3. Register event handler defined in (1). MY_EVENT_BASE and MY_EVENT_ID specifies a hypothetical
    // event that handler run_on_event should execute on when it gets posted to the loop.
    esp_event_handler_register_with(loop_handle, MY_EVENT_BASE, MY_EVENT_ID, run_on_event, ...);

    ...

    // 4. Post events to the loop. This queues the event on the event loop. At some point in time
    // the event loop executes the event handler registered to the posted event, in this case run_on_event.
    // For simplicity sake this example calls esp_event_post_to from app_main, but posting can be done from
    // any other tasks (which is the more interesting use case).
    esp_event_post_to(loop_handle, MY_EVENT_BASE, MY_EVENT_ID, ...);

    ...

    // 5. Unregistering an unneeded handler
    esp_event_handler_unregister_with(loop_handle, MY_EVENT_BASE, MY_EVENT_ID, run_on_event);

    ...

    // 6. Deleting an unneeded event loop
    esp_event_loop_delete(loop_handle);
}

```

### Libary implementation
```c
// typedef struct

/// Configuration for creating event loops
typedef struct {
    int32_t queue_size;                         /**< size of the event loop queue */
    const char *task_name;                      /**< name of the event loop task; if NULL,
                                                        a dedicated task is not created for event loop*/
    UBaseType_t task_priority;                  /**< priority of the event loop task, ignored if task name is NULL */
    uint32_t task_stack_size;                   /**< stack size of the event loop task, ignored if task name is NULL */
    BaseType_t task_core_id;                    /**< core to which the event loop task is pinned to,
                                                        ignored if task name is NULL */
} esp_event_loop_args_t;


// header
/**
 * @brief Create default event loop
 *
 * @return
 *  - ESP_OK: Success
 *  - ESP_ERR_NO_MEM: Cannot allocate memory for event loops list
 *  - ESP_FAIL: Failed to create task loop
 *  - Others: Fail
 */
esp_err_t esp_event_loop_create_default(void);

// components/esp_event/default_event_loop.c

esp_err_t esp_event_loop_create_default(void)
{
    if (s_default_loop) {
        return ESP_ERR_INVALID_STATE;
    }

    esp_event_loop_args_t loop_args = {
        .queue_size = CONFIG_ESP_SYSTEM_EVENT_QUEUE_SIZE,
        .task_name = "sys_evt",
        .task_stack_size = ESP_TASKD_EVENT_STACK,
        .task_priority = ESP_TASKD_EVENT_PRIO,
        .task_core_id = 0
    };

    esp_err_t err;

    err = esp_event_loop_create(&loop_args, &s_default_loop);
    if (err != ESP_OK) {
        return err;
    }

    return ESP_OK;
}


```