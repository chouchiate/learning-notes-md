## [go-context] 學習筆記

#### 上下文 context.Context 簡介
用於設置 API 介面之間和 Process 之間的
* 截止日期 deadlines,
* 同步信號 cancellation signals,
* 傳遞請求 request-scoped values

```go
type Context interface {
    Deadlin() (deadline time.Time, ok bool)
    Done() <-chan struct{}
    Err() error
    Value(key interface{}) interface{}
}

```
1. Deadline - 返回 context.Context 的截止日期
2. Done - 返回一個 Channel，這個Channel會在當前工作完成或上下文被取消後關閉
3. Err - 返回 context.Context 結束原因
   1. 如果 context.Context 被取消，返回 Canceled 錯誤
   2. 如果 context.Context 超時，返回 DeadlineExceeded 錯誤
4. Value -  從 context.Context 中獲取 key-value pair



* context.Background
    ```go
    func Background() Context
    ```
    + Background returns a non-nil, empty Context. It is never canceled, has no values, and has no deadline. It is typically used by the main function, initialization, and tests, and as the top-level Context for incoming requests.

* context.TODO
    ```go
    func TODO() Context
    ```
    + TODO returns a non-nil, empty Context. Code should use context.TODO when it's unclear which Context to use or it is not yet available (because the surrounding function has not yet been extended to accept a Context parameter).
* context.WithDeadline
    ```go
        func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)
    ```
    +
* context.WithValue


* defer cancel()
    + It's best practice to use a defer cancel() immediately after calling WithCancel() or WithTimeout().
    + the goroutine that WithCancel or WithTimeout created will be retained in memory indefinitely (until the program shuts down), causing a memory leak.
    ```go
        ctx, cancel := context.WithTimeout(context.Background(), _defaultConnectTimeout)
        defer cancel()

    ```

## withTimeout


