## [esp] - High resolution timer

### Timer function
* 提供了一次性定时器和周期性定时器
* 微秒时间分辨率和64位范围

### Timer Callback
* ESP_TIMER_TASK
* ESP_TIMER_ISR (by setting CONFIG_ESP_TIMER_SUPPORTS_ISR_DISPATCH_METHOD = true)

### Interrupt Level
* configure by CONFIG_ESP_TIMER_INTERRUPT_LEVEL option.
  * It allows to set this: 1, 2 or 3 level (by default 1).
  * By Raising the level, the interrupt handler can reduce the timer processing delay.

> 如果其他优先级高于esp_timer的任务正在运行，回调调度将被延迟，直到esp_timer任务有机会运行。例如，如果正在进行一个SPI Flash操作，就会发生这种情况。


