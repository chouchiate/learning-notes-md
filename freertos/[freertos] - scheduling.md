## [freertos] - Scheduling

* preemption scheduling
    - replacing running task with another task
    - scheduler does context switch to run some other tasks of the application

    - two type of scheduling
        1. round-robin preemptive scheduling
        ![](../assets/img/scheduler_context_switch.png)
        2. non-context switch case and tasks get blocked handling
        ![](../assets/img/task_switch_when_blocked.png)
        3. scheduling tasks without priority is cyclic executive.
        ![](../assets/img/no_priority_task.png)

* cooperative scheduling
    - RTOS tick interrupt is not used to invoke the scheduler
    - Tasks give up processor voluntarily
        - task yielding
            ![](../assets/img/coorperative_scheduling.png)
