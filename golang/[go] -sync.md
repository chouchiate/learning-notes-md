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