## [go] - time


### Difference time.After vs time.Sleep

> The two will both pause the current goroutine execution for a certain duration. The difference is the function call time.Sleep(d) will let the current goroutine enter **sleeping** sub-state, but still stay in running state, whereas, the channel receive operation <-time.After(d) will let the current goroutine enter **blocking** state.

[source](https://go101.org/article/unofficial-faq.html#time-sleep-after)

### add rand to time.Sleep for each go-routine waking different time

```go
	go func() {
		for {
            rand.Seed(time.Now().UnixNano())
            n := rand.Int63n(1000)
            time.Sleep((time.Duration(periodSecond)*time.Second + time.Duration(n)))
            // ... do some works
        }
    }()

```