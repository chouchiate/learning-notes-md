## [freertos] - time base source selection

* STM32 cube HAL layer by default use systick timer as time base.
* freeRTOS use ARM cortex Mx internal systick timer as time base (RTOS ticking), by default.
* best practice, use STM32 cube HAL layer time base source

### STMCubeIDE method
* in device integration tool
    - System Core: SYS
        * Timebase Source: TIM6
    - System Core: NVIC
        * Priority Group: select 4 bits for preemption priority 0 bits for sub-priority
* new code will be generated (Project>Generate Code)
    - Core/src/stm32fxxx_hal_timebase_tim.c


