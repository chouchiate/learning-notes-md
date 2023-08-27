## [esp] - examples (hello_world)

### Includes
```c
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
```
* freertos/FreeRTOS.h :
    - Inclusion of this sets configuration required to run freeRTOS on ESP32.
* freertos/task.h:
    - The tasks provide the multitasking functionality.
* esp_system.h:
    - This inclusion configures the peripherals in the ESP system.

### Main
```c
void app_main()
{
    nvs_flash_init();
    xTaskCreate(&hello_task, "hello_task", 2048, NULL, 5, NULL);
}
```
* Initialize Flash: nvs_flash_init()
    - the ESP32 Modules run code from an external flash. The module/board maker will take care of the flash initialization and access.
* xTaskCreate(): This function has 5 arguments.
    1. Address of the function which execute, when this task is scheduled to run! Re-read the sentence once.
    2. hello_task is the name given to the task. The could be any name. It used to obtain handle or while debugging the task.
    3. The next parameter 2048 is the memory allocated to the task in word (2 Bytes).

### Hello_Task
```c
void hello_task(void *pvParameter)
{
    printf("Hello world!\n");
    for (int i = 10; i >= 0; i--) {
        printf("Restarting in %d seconds...\n", i);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
    printf("Restarting now.\n");
    fflush(stdout);
    esp_restart();
}
```
* This simply prints the string to the UART. The Print stream is configured to the UART0 of the ESP32.

### Code so far

```c
/* Hello World Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"

void hello_task(void *pvParameter)
{
    printf("Hello world!\n");
    for (int i = 10; i >= 0; i--) {
        printf("Restarting in %d seconds...\n", i);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
    printf("Restarting now.\n");
    fflush(stdout);
    esp_restart();
}

void app_main()
{
    nvs_flash_init();
    xTaskCreate(&hello_task, "hello_task", 2048, NULL, 5, NULL);

```

### Multitask - blink with hello

```c
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "driver/gpio.h"

#define BLINK_GPIO 13


void hello_task(void *pvParameter)
{

	while(1)
	{
	    printf("Hello world!\n");
	    vTaskDelay(100 / portTICK_RATE_MS);
	}
}

void blinky(void *pvParameter)
{

    gpio_pad_select_gpio(BLINK_GPIO);
    /* Set the GPIO as a push/pull output */
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
    while(1) {
        /* Blink off (output low) */
        gpio_set_level(BLINK_GPIO, 0);
        vTaskDelay(1000 / portTICK_RATE_MS);
        /* Blink on (output high) */
        gpio_set_level(BLINK_GPIO, 1);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
}

void app_main()
{
    nvs_flash_init();
    xTaskCreate(&hello_task, "hello_task", 2048, NULL, 5, NULL);
    xTaskCreate(&blinky, "blinky", 512,NULL,5,NULL );
}
```
