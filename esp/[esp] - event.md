## [esp] - Events

> Allows loosely coupled components to attach desired behavior to changes in state of other components without application involvement.

| user event loops | default event loops |
| -- | -- |
| user events | system events (wifi etc) |
| esp_event_loop_create() | esp_event_loop_create_default() |
| esp_event_loop_delete() | esp_event_loop_delete_default() |
| esp_event_handler_register_with()	| esp_event_handler_register() |
| esp_event_handler_unregister_with() | esp_event_handler_unregister() |
| esp_event_post_to() | esp_event_post() |

> system events are uppercase and are postfixed with _EVENT
    - ie. WIFI_EVENT, ETHERNET_EVENT

### esp_event_base
* 2 part event identifiers
```c
// event base declaration
ESP_EVENT_DECLARE_BASE(EVENT_BASE)
// event base definition
ESP_EVENT_DEFINE_BASE(EVENT_BASE)
```

### event_id
```c
enum {
    EVENT_ID_1,
    EVENT_ID_2,
    EVENT_ID_3,
    ...
}
```

### 解析 esp_event_handler_register_with
```c
esp_err_t esp_event_handler_register_with(
    esp_event_loop_handle_t event_loop,
    esp_event_base_t event_base,
    int32_t event_id,
    esp_event_handler_t event_handler,
    void* event_handler_arg)
{
    return esp_event_handler_register_with_internal(event_loop, event_base, event_id, event_handler, event_handler_arg, NULL, true);
}

```

### 解析 esp_event_handler_register_with_internal
```c
esp_err_t esp_event_handler_register_with_internal(
    esp_event_loop_handle_t event_loop,
    esp_event_base_t event_base,
    int32_t event_id,
    esp_event_handler_t event_handler,
    void* event_handler_arg,
    esp_event_handler_instance_context_t** handler_ctx_arg,
    bool legacy)
{
    assert(event_loop);
    assert(event_handler);

    if (event_base == ESP_EVENT_ANY_BASE && event_id != ESP_EVENT_ANY_ID) {
        ESP_LOGE(TAG, "registering to any event base with specific id unsupported");
        return ESP_ERR_INVALID_ARG;
    }

    esp_event_loop_instance_t* loop = (esp_event_loop_instance_t*) event_loop;

    if (event_base == ESP_EVENT_ANY_BASE) {
        event_base = esp_event_any_base;
    }

    esp_err_t err = ESP_OK;

    xSemaphoreTakeRecursive(loop->mutex, portMAX_DELAY);

    esp_event_loop_node_t *loop_node = NULL, *last_loop_node = NULL;

    SLIST_FOREACH(loop_node, &(loop->loop_nodes), next) {
        last_loop_node = loop_node;
    }

    bool is_loop_level_handler = (event_base == esp_event_any_base) && (event_id == ESP_EVENT_ANY_ID);

    if (!last_loop_node ||
       (last_loop_node && !SLIST_EMPTY(&(last_loop_node->base_nodes)) && is_loop_level_handler)) {
        loop_node = (esp_event_loop_node_t*) calloc(1, sizeof(*loop_node));

        if (!loop_node) {
            ESP_LOGE(TAG, "alloc for new loop node failed");
            err = ESP_ERR_NO_MEM;
            goto on_err;
        }

        SLIST_INIT(&(loop_node->handlers));
        SLIST_INIT(&(loop_node->base_nodes));

        err = loop_node_add_handler(loop_node, event_base, event_id, event_handler, event_handler_arg, handler_ctx_arg, legacy);

        if (err == ESP_OK) {
            if (!last_loop_node) {
                SLIST_INSERT_HEAD(&(loop->loop_nodes), loop_node, next);
            }
            else {
                SLIST_INSERT_AFTER(last_loop_node, loop_node, next);
            }
        } else {
            free(loop_node);
        }
    }
    else {
        err = loop_node_add_handler(last_loop_node, event_base, event_id, event_handler, event_handler_arg, handler_ctx_arg, legacy);
    }

on_err:
    xSemaphoreGiveRecursive(loop->mutex);
    return err;
}
```

### esp_event_loop

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

    esp_event_loop_create(&loop_args, &loop_handle)

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


### external

[doc](https://docs.espressif.com/projects/esp-idf/en/v3.3/api-reference/system/esp_event.html)