# 火焰圖怎麼看-以GCP sample hotapp 為例
###### tags: profiler, Golang
## Profiler 類型
- Golang support 最多種 Profiler Types
- ![https://i.imgur.com/8gZ2rR3.png](https://i.imgur.com/8gZ2rR3.png)
- 對各種眼花撩亂的 Profile Types 可以去看 [Google 寫的Profiling concept](https://cloud.google.com/profiler/docs/concepts-profiling)或是我整理過的[英文筆記](https://hackmd.io/@LYp8PGGnSEWug4DUlyQkDg/B1FQKSSHq)
## hotapp 範例
- [Source code](https://github.com/GoogleCloudPlatform/golang-samples/blob/main/profiler/hotapp/main.go)
	- 有興趣的可以按照 GCP 的教學去跑一次，還可以得到徽章
## CPU-Intensive code
- ### main.go

  ``` go
      func load() {
              for i := 0; i < (1 << 20); i++ {
              }
      }
  ```
- ![https://i.imgur.com/OSSTywm.png](https://i.imgur.com/OSSTywm.png)
- ### 火焰圖怎麼看
    - load function 是被 `busyloop()` 去呼叫的，執行次序為依
    - 序由 `busyloop` --> {`foo1`, `foo2`} --> {`bar`, `baz`} --> `load`
    - 每個格子寬度代表著**佔整體執行過程的損耗比例**，佔越大比例的格子代表所需用的效能越高
- ### Show stacks
    - 可以新增 Filter ，篩選要看的 function name
    - ![https://i.imgur.com/HAoLnv2.png](https://i.imgur.com/HAoLnv2.png)
- ## Memory-intensive code
	- 切換成 **Profile Heap type** 後，記得先移除前面建立的 Filter
	- ![https://i.imgur.com/RQM6yge.png](https://i.imgur.com/RQM6yge.png)
	- 呼叫路徑為  `allocOnce` --> `allocImpl`
	- ### main.go

      ``` go
          func allocImpl() {
                  // Allocate 64 MiB in 64 KiB chunks
                  for i := 0; i < 64*16; i++ {
                          mem = append(mem, make([]byte, 64*1024))
                  }
          }
      ```
	- `allocImpl`
		- 會以 64 KiB 的大小去分配 64 MiB 的總量
		- 將資料儲存在全域變數 `mem`，避免被 garbage collected
	- GCP Profiler Heap 是統計工具跟實際數值約會有大約 10% 的差異
		- 📌 the Go heap profiler is a statistical tool, so the measurements are low-overhead but not byte-accurate. Don't be surprised when seeing a ~10% difference like this.
- ## IO-intensive Code
	- 將 Profiler type 切換成 Thread，是用來看 Thread leaks
	- Thread type 很適合讓工程師去了解，程式是否有多花一些非預期時間在等待上（如 I/O）
	- > Blocked threads are not currently running, but might  run or never run.
	- ![https://i.imgur.com/VLvb5Rt.png](https://i.imgur.com/VLvb5Rt.png)
	-
	- 最上面的 frame level (灰框)上的數字，是 Thread 的平均總數
	- `wait` 的數值為 100 個 goroutine 調用堆疊出來的，`wait` 在 `main.go` 如下：
	- ### main.go

      ``` go
          func main() {
                  ...
                  // Simulate some waiting goroutines.
                  for i := 0; i < 100; i++ {
                          go wait()
                  }
      ```
	- 建議可以使用 `Hide Stacks` Filter 去隱藏 `gopark`(`runtime.gopark`)，讓真正要看的
		- `runtime.gopark` 為 閒置的 goroutine
			- 📌 For "runtime.gopark" in particular, this means that the ==goroutines are temporarily "on hold"== , paused by the runtime scheduler.
- ## Contention-intensive code
	- Contention type 紀錄的是徵用共用資源時的等待時間
	- ### Contention
		- The time spent waiting to access a shared resource
			- 📌 In a **multi-threaded program**, ==the time spent waiting== to serialize ==access to a shared resource== can be significant.
	- Contention profile 是記錄某個鎖被 goroutine A 解鎖，且被 goroutine B 等待去解鎖的次數
	- 在 profiler 啟動時，就需要先設定 `MutexProfiling: true`，目前我們 [ms-go-kit profiler.go](https://gitlab.smart-aging.tech/devops/ms-go-kit/-/blob/master/observability/profiler.go) 還沒有加入此預設值

      ``` go
          err := profiler.Start(profiler.Config{
                ProjectID:      *projectID,
                Service:        *service,
                ServiceVersion: *version,
                DebugLogging:   true,
                MutexProfiling: true,
            })
      ```
	- ![https://i.imgur.com/VOZ0lfx.png](https://i.imgur.com/VOZ0lfx.png)
	- 上圖的狀況就是單一的 Contention stack 等待所的時間為 10.5 秒
	- ### main.go

      ``` go
          func contention(d time.Duration) {
                  contentionImpl(d)
          }

          func contentionImpl(d time.Duration) {
                  for {
                          mu.Lock()
                          time.Sleep(d)
                          mu.Unlock()
                  }
          }
          ...
          func main() {
                  ...
                  for i := 0; i < 4; i++ {
                          go contention(time.Duration(i) * 50 * time.Millisecond)
                  }
          }
      ```

## Summary
- 佔整體執行過程的損耗比例 每個格子寬度代表著**佔整體執行過程的損耗比例**，佔越大比例的格子代表所需用的效能越高
- Profile Heap type 切換成 **Profile Heap type** 後，記得先移除前面建立的 Filter

## Reference
- [Analyze production performance with Cloud Profiler](https://codelabs.developers.google.com/codelabs/cloud-profiler#4)