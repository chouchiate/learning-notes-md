## [FreeRtos] - Kernel Interrupts

#### SVC Interrupt


#### PendSV Interrupt

* Context switching between tasks

#### SysTick Interrupt

* RTOS Tick Management
  ```c
    // 1 msec tick
    #define configTICK_RATE_HZ  ((portTickType)1000)

    //
    vTaskDelay(100);

    //
    xPortSysTickHandler(void)
      portDISABLE_INTERRUPT();
    // scan all ready task
    // determine next task to run
    // trigger context switching by pending PendSV Interrupt
    // PendSV controls context switch of new task from old
    # if configUSE_PREEMPTION || configUSE_TIME_SLICING
    pReadyTaskLists

  ```


  #### Configuring FreeRTOS Tick Timer

    ```c
      // task.c
      vTaskStartScheduler()
      // port.c
      vPortStartScheduler()

    ```