## [Golang] - Concurrent Pipelines using Channels & goroutine

#### 什麼是 Pipeline

A series of independent components/stages in which complete specific task in a stream-like fashion. From pipes to message queues to channels or shared memory.

![](/Users/derickchou/Programming/markdowns/learning-notes-md/img/pipeline.png)

#### Concurrent pipelines

![](/Users/derickchou/Programming/markdowns/learning-notes-md/img/mutli-pipeline.png)

#### Concurrent piplines through channel

![](/Users/derickchou/Programming/markdowns/learning-notes-md/img/multi-pipeline-channel.png)

#### Channel:

​	Channel is a communication pipe between concurrently executing functions or coroutines.

​	Data can be sent from one goroutine and received by another goroutine using channels.

#### Goroutines:

​	Lightweight thread.

​	Dynamic stack size.

	#### Two Unidirectional buffered channels

![](/Users/derickchou/Programming/markdowns/learning-notes-md/img/multi-pipeline-2-uni-channel.png)

#### Sample Pipeline

