## [freertos] - the basics

### what is real time (definition)
    * real-time deals with guarantees, not with raw speed, not with promises.
    * having more processors, more RAM, faster bus interfaces does not make a system **real time**
    * if the timing constraints are not met, system failure is said to have occurred
    * hard real-time, eg. air bag system, missile guidance, anti-lock braking, voip, stock market website

### GPOS vs RTOS
    * GPOS - linux, window, iOS, android
        - process throughput
        - task switching latency (an event occurred and the time the task take care of event is allowed)
            - may vary significantly
        - priority inversion: insignificant


    * RTOS - VxWork, QNX, freeRTOS, Integrity, Zephyr
        - task switching latency
            - almost constant
        - priority inversion: must be solved
            - priority based preemptive scheduling mechanism
            - low or non critical sections which disable preemptive
            - priority inversion avoidance
            - bounded interrupt latency
            - bounded scheduling latency


![]()

### project structure
* FreeRTOS
    * demo (sample codes)
    * test
    * license
    * source
        - kernel
        - include (headers)
        - portable
            - architecture / compiler specifics
                - GCC
                - Keil
* FreeRTOS-Plus (middlewares)
