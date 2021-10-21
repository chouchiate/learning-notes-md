

[read](https://ieevee.com/tech/2017/11/23/go-panic.html)


#### cron
* "github.com/robfig/cron/v3"

Inititiation

```go
	c := cron.New(
		cron.WithLogger(
			cron.VerbosePrintfLogger(log.New()),
		),
		cron.WithChain(
			cron.Recover(cron.DefaultLogger),
		),
	)
```