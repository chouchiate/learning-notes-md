## [go] - Testing


### Mocking

* mocking db

* mocking backend


### Test single function
```bash
go test -run TestMyFunction ./.../path/to/package
```

### Testify
[testify-require](https://pkg.go.dev/github.com/stretchr/testify@v1.7.0/require)

```go
import (
  "testing"
  "github.com/stretchr/testify/require"
)

func TestSomething(t *testing.T) {

  var a string = "Hello"
  var b string = "Hello"

  require.Equal(t, a, b, "The two words should be the same.")

}
```


### Test Parallel with Zap Logger


```go
func Test_some_function_with_cases(t *testing.T) {
	tests := []struct {
		name string
    wantVal int
	}{
		{
			"name of the test.....",
      1,
		},
	}
	for _, tc := range tests {
		tt := tc
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			zapCore, logs := observer.New(zap.DebugLevel)
			logger := zap.New(zapCore)

			repo := setupTestRepo(t, __someCollection)

			m := newMockBackend()
			p := someHandler(logger, repo, m)

			now := time.Now().Truncate(time.Second)
			device := t.Name() + "_" + uuid.NewString()
			p.Process(device, now, now)

			require.Eventually(t, func() bool {
				return m.offlineCnt == 1
			}, _totalWaitFor, _tickInterval)

			require.Eventually(t, func() bool {
				return logs.FilterMessage("save offline result").Len() == 1
			}, _totalWaitFor, _tickInterval, `should hit the last log ("save offline result")`)

			require.Equal(t, 0, logs.FilterLevelExact(zap.ErrorLevel).Len(), "should not found any error level logs after we have checked the 'save result' has been logged")
		})
	}
}

```
