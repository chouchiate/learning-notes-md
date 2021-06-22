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
* context.TODO
* context.WithDeadline
* context.WithValue

