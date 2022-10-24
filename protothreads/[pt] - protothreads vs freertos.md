## [pt] - protothreads vs freertos

代码组织层次

Protothreads 的层次非常清晰，最低层是 Local continuations，中间层是 Protothreads，最上层是 Process（Process 层在 Contiki 中提供，原始的 Protothreads 并未包含），可以按照需求决定包含哪些层，一般情况下不会单独使用 Local continuations。

FreeRTOS Coroutine 并不分层，浑然一体，这不利于裁减。

### 唤醒机制
Protothreads 本身不支持唤醒，要不断地调用顶层线程去轮询，但引入 Process 层后可以支持唤醒。

FreeRTOS Coroutine 支持唤醒，Coroutine 使用一个专门设计的队列来支持挂起和唤醒协程。

### 协程优先级
Protothreads 不支持优先级，即使引入 Process 层也是不支持优先级的，不过可以修改 Process 层来实现优先级。

FreeRTOS Coroutine 支持优先级。

### 协程间同步

Protothreads 使用条件等待原语进行协程间的同步，条件可以是一个标志，也可以是队列的状态，或者是其它的。如果要使用队列的话，要自己定义队列。Protothreads 的同步机制很灵活，具体等待什么样的条件是程序员决定的。而且可以同时等待多个条件，例如同时等待超时或 I/O 就绪。同时等待的条件可以是与的关系，也可以是或的关系

FreeRTOS Coroutine 提供队列来进行协程间的同步，没有其它选择，即使是最简单的同步，也要用上队列，在一些简单的场合，这显得有些浪费。

### 协程的层次
Protothreads 的协程可以有层次，协程可以创建子协程，然后等待子协程完成，这对实现层次化的设计非常有利。

FreeRTOS Coroutine 的协程没有层次，所有协程是平等的，也没有办法去等待一个协程完成，只能通过队列进行交互。

### 轮询和中断 I/O

Protothreads 支持轮询 I/O，也支持中断 I/O。Protothreads 可以不停地轮询，轮询时可以直接检查 I/O 寄存器，也可以检查中断服务程序设置的标志。配合 Process，中断服务程序可以唤醒 Protothreads 进行轮询，避免不必要的轮询。Protothreads 的基本支持是轮询 I/O，中断是作为低功耗的优化引入的。

FreeRTOS Coroutine 不支持轮询 I/O，仅支持中断 I/O。Coroutine 必须唤醒之后才能执行。

### ISR 可用性
Protothreads 可以用在中断服务例程（ISR）中。

FreeRTOS Coroutine 不能用在 ISR 中。

### 资源的使用

Protothreads 只要为每个协程分配2个字节的RAM空间。代码空间相比使用状态机的实现略微增加，在我的一个工程中，增加了300字节。Protothreads 是非常省空间的，这和 Protothreads 不支持优先级不支持队列有关，如果引入 Process 会占用更多的一些空间。

FreeRTOS Coroutine 要为每个协程分配56个字节的RAM空间，包括用来排队的列表。代码空间相比使用状态机的实现增加了3K。这些资源用于实现 Coroutine 支持优先级、队列、唤醒特性。

### 定时器
Protothreads 不支持定时器，不过可以借用 Contiki 里的定时器实现，或者自定义定时器，可以在条件等待里加入超时判断。

FreeRTOS Coroutine 包含 crDELAY 做延时用，队列的接收和发送包含超时机制。

### 和 RTOS 的配合
Protothreads 是独立于 RTOS 的，可以单独使用，也可以和其它 RTOS 配合使用。

FreeRTOS Coroutine 是作为 FreeRTOS 的一部分存在的，单独使用会有一些麻烦，和 FreeRTOS 配合肯定没问题，和其它 RTOS 配合估计够呛。

### 总结

Protothreads 层次清晰、占用资源非常少、非常灵活，代价是如果需要更复杂的功能，那么需要自行开发，不过可以从 Contiki 借用一些，例如借用 Contiki 的 Process 来实现唤醒。

FreeRTOS Coroutine 支持优先级、支持队列、支持唤醒，但是这些特性不能剥离，如果不需要这些特性，就是白白浪费存储空间。

需要优先级的场合，选择 FreeRTOS Coroutine，不需要优先级的场合，选择 Protothreads。但是，需要优先级的场合是不是更适合上 RTOS 而不是 Coroutine 呢？或许这就是 FreeRTOS 停止更新 Coroutine 的原因吧。

如果要实现层次化的设计，选择支持层次化的 Protothreads，FreeRTOS Coroutine 难以实现层次化。
————————————————
版权声明：本文为CSDN博主「半斗米」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/zoomdy/article/details/89947989