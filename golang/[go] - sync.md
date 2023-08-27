## [go] - package sync

* 在寫 goroutine 的時候，需要考慮 race condition，在執行或測試上可以加上 -race 去檢查，以免結果與預期不符
* 遇到 race condition 的時候可以考慮用 sync.Mutex 來解決，有讀寫阻塞的時候可以用 sync.RWMutex
* syncRWMutex 可以有同時允許多個 RLock 和 RUnlock 但只能有一個 Lock 和 Unlock

### Locker type
* A Locker represents an object that can be locked and unlocked.
    ```go
    type Locker interface {
        Lock()
        Unlock()
    }

    ```

### Mutex type
* A Mutex is a mutual exclusion lock. The zero value for a Mutex is an unlocked mutex.
    ```go
    type Mutex struct {
        state int32
        sema  uint32
    }

    ```
### Implementation
* func (m *Mutex) Lock()
* func (m *Mutex) TryLock() bool
* func (m *Mutex) Unlock()
### RWMutex type
* sync.RWMutex 是一個讀寫鎖(multiple readers, single writer lock)，多讀單寫，可以允許多個讀並發，單個寫。
    ```go
    type RWMutex struct {
        w           Mutex  // held if there are pending writers
        writerSem   uint32 // semaphore for writers to wait for completing readers
        readerSem   uint32 // semaphore for readers to wait for completing writers
        readerCount int32  // number of pending readers
        readerWait  int32  // number of departing readers
    }

    const rwmutexMaxReaders = 1 << 30

    ```
    * w - 互斥鎖解決多個 writer 競爭
    * writerSem - writer 信號量, 阻塞喚醒時使用 類似 mutex's sema
    * readerSem - reader 信號量, 同上 for read
    * readerCount - 當前讀進程的數量, 以及是否有寫進程在等待
    * readerWait - 寫進程請求鎖時, 需要等待完成的讀進程數量程的数量。
    * rwmutexMaxReaders - 常量，定義最大的讀進程数量。
        - readerCount 只是紀錄讀進程的數量，類似 Mutex 中的計數器
        - readerWait 是為了區分排在寫進程前面的讀進程數，幫助判斷寫進程什麼時候可以佔有鎖。

> 讀鎖的設計中，並沒有使用類似 Mutex 中的 state 來紀錄不同的狀態，全部都是用的計數器


### race package
> The runtime package intentionally exports these functions only in the race build;
> race package exports them unconditionally but without the "race" build tag they are no-ops.

```go
// RLock locks rw for reading.
//
// It should not be used for recursive read locking; a blocked Lock
// call excludes new readers from acquiring the lock. See the
// documentation on the RWMutex type.
func (rw *RWMutex) RLock() {
	if race.Enabled {
		_ = rw.w.state
		race.Disable()
	}

// RLock 加鎖的時候 會給 readerCount + 1
// 這裡有個 < 0 的判斷 因為有寫進程在等待的時候, readerCount 會變負數。
// 如果 < 0 讀進程會儘速阻塞狀態

	if atomic.AddInt32(&rw.readerCount, 1) < 0 {
		// A writer is pending, wait for it.
		runtime_SemacquireMutex(&rw.readerSem, false, 0)
	}
	if race.Enabled {
		race.Enable()
		race.Acquire(unsafe.Pointer(&rw.readerSem))
	}
}
```

```go
// RUnlock undoes a single RLock call;
// it does not affect other simultaneous readers.
// It is a run-time error if rw is not locked for reading
// on entry to RUnlock.
func (rw *RWMutex) RUnlock() {
	if race.Enabled {
		_ = rw.w.state
		race.ReleaseMerge(unsafe.Pointer(&rw.writerSem))
		race.Disable()
	}

// 讀進程解鎖，如果 readerCount - 1 小於0，說明有等待的寫進程，這個時候就將占有鎖的讀進程數減1。如果沒有讀進程占有鎖了，就喚醒寫進程。

	if r := atomic.AddInt32(&rw.readerCount, -1); r < 0 {
		// Outlined slow-path to allow the fast-path to be inlined
		rw.rUnlockSlow(r)
	}
	if race.Enabled {
		race.Enable()
	}
}

func (rw *RWMutex) rUnlockSlow(r int32) {
	if r+1 == 0 || r+1 == -rwmutexMaxReaders {
		race.Enable()
		throw("sync: RUnlock of unlocked RWMutex")
	}
	// A writer is pending.
	if atomic.AddInt32(&rw.readerWait, -1) == 0 {
        // 最後一個reader，writer終於有機會獲得鎖了
		// The last reader unblocks the writer.
		runtime_Semrelease(&rw.writerSem, false, 1)
	}
}
```

### Write Lock 實現
```go
// Lock locks rw for writing.
// If the lock is already locked for reading or writing,
// Lock blocks until the lock is available.
func (rw *RWMutex) Lock() {
	if race.Enabled {
		_ = rw.w.state
		race.Disable()
	}
	// First, resolve competition with other writers.
	// 首先解决其他writer竞争问题
	rw.w.Lock()
	// Announce to readers there is a pending writer.
	// 反转readerCount，告诉reader有writer竞争锁

	// 重点看一下 readerCount 是怎么变化的！！
	// 直接减去常量 rwmutexMaxReaders。

	r := atomic.AddInt32(&rw.readerCount, -rwmutexMaxReaders) + rwmutexMaxReaders

	// 那什么时候再恢复 readerCount 呢？
	// 后面写进程解锁的时候，readerCount 会再加上 rwmutexMaxReaders。

	// Wait for active readers.
	// 如果当前有reader持有锁，那么需要等待

	// 将当前的读进程数 readerCount 赋值给 readerWait。然后 readerWait 只有读进程解锁的时候，才会进行减1操作。
	if r != 0 && atomic.AddInt32(&rw.readerWait, r) != 0 {
		runtime_SemacquireMutex(&rw.writerSem, false, 0)
	}
	if race.Enabled {
		race.Enable()
		race.Acquire(unsafe.Pointer(&rw.readerSem))
		race.Acquire(unsafe.Pointer(&rw.writerSem))
	}
}
```

### Read/Write Unlock 實現
```go

// Unlock unlocks rw for writing. It is a run-time error if rw is
// not locked for writing on entry to Unlock.
//
// As with Mutexes, a locked RWMutex is not associated with a particular
// goroutine. One goroutine may RLock (Lock) a RWMutex and then
// arrange for another goroutine to RUnlock (Unlock) it.
func (rw *RWMutex) Unlock() {
	if race.Enabled {
		_ = rw.w.state
		race.Release(unsafe.Pointer(&rw.readerSem))
		race.Disable()
	}

	// Announce to readers there is no active writer.
	// 告诉reader没有活跃的writer了
	r := atomic.AddInt32(&rw.readerCount, rwmutexMaxReaders)
	if r >= rwmutexMaxReaders {
		race.Enable()
		throw("sync: Unlock of unlocked RWMutex")
	}
	// Unblock blocked readers, if any.
	// 唤醒阻塞的reader们
	for i := 0; i < int(r); i++ {
		runtime_Semrelease(&rw.readerSem, false, 0)
	}
	// Allow other writers to proceed.
	// 释放内部的互斥锁
	rw.w.Unlock()
	if race.Enabled {
		race.Enable()
	}
}
// 写进程的解锁操作，解锁时首先将 readerCount 恢复成正整数，然后挨个唤醒沉睡的读进程，之后再执行 Unlock 操作。
```

### RWMutex 的3个坑
* 不可复制
	- 显然，RWMutex 的定义里面，有各种计数器，信号量，以及 Mutex，如果直接复制的话，这些状态都会被复制。如果有需要，只能再声明一个新的 RWMutex 变量了。
* 不可重入
	- 和 Mutex 一样，RWMutex 定义中仍然没有记录协程相关的信息，所以单纯依赖 RWMutex，无法区分出当前是那个进程持有锁，当然也就不能重入了。
	1. 場景 1:
		写进程调用 Lock 函数之后，又调用了一次 Lock 操作，结果第二个 Lock 只能等第一个 Lock 释放锁才能进行，而第一个 Lock 也在等第二个 Lock 完成才能进行下一步，这就形成了死锁。这个其实就是互斥锁 Mutex 的重入问题。
	2. 場景 2:
		进程中同时包含读写操作，导致形成死锁。比如进程A先读数据，加 RLock，读的过程中，执行了 Lock 操作。这个时候，Lock 会等待 RLock，而 RLock 会等待 Lock，又形成了死锁。
	3. 場景 3:
		递归读导致死锁。比如进程A递归读，进程B写，假设A进程衍生出了A1，然后在A执行的过程中（加读锁），B执行（加写锁），A1则进入阻塞状态。这个时候形成了B等待A，A等待A1，A1等待B的死循环
* 释放未加锁的 RWMutex
	无论是读锁，还是写锁，加锁和解锁操作都要成对出现。Unlock 和 RUnlock 多余的调用会导致 panic。所以，在使用读写锁的时候，一定要注意，不遗漏不多余。


### Map type

### Once type

### Pool type


### Cond type
* 條件變量 (Condition Variable)
    - 是一種同步原語（Synchronization Primitive）用於多線程之間的通信，它可以阻塞一個或同時阻塞多個線程直到：
        1. 收到來自其他線程的通知
        2. 超時
        3. 發生虛假喚醒(Spurious Wakeup)

* Cond implements a condition variable, a rendezvous point for goroutines waiting for or announcing the occurrence of an event.

* Each Cond has an associated Locker L (often a *Mutex or *RWMutex), which must be held when changing the condition and when calling the Wait method.
### Implementations
* func NewCond(l Locker) *Cond
    - Broadcast wakes all goroutines waiting on c.

* func (c *Cond) Broadcast()
    - Signal wakes one goroutine waiting on c, if there is any.
* func (c *Cond) Signal()
* func (c *Cond) Wait()

### WaitGroup type