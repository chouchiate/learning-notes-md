## [go] - Testing


### Mocking



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