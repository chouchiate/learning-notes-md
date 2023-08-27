## [go] - os package env examples

## os.Getenv
> Getenv retrieves the value of the environment variable named by the key. It returns the value, which will be empty if the variable is not present.

```go
package main

import (
    "fmt"
    "os"
)

func main() {

    fmt.Println("Shell:", os.Getenv("SHELL"))
}
```

## os.LookupEnv
> LookupEnv function retrieves the value of the environment variable named by the key.

* If the variable is set the value (which may be empty) is returned and the boolean is true.
* Otherwise the returned value will be empty and the boolean will be false.

```go
package main

import (
    "fmt"
    "os"
)

func main() {

    getEnv := func(key string) {
        val, ok := os.LookupEnv(key)
        if !ok {
            fmt.Printf("%s not set\n", key)
        } else {
            fmt.Printf("%s=%s\n", key, val)
        }
    }

    getEnv("EDITOR")
    getEnv("SHELL")
}
```
## os.Setenv
> os.Setenv sets the value of the environment variable named by the key.
```go
package main

import (
    "fmt"
    "os"
)

func main() {

    fmt.Println("editor:", os.Getenv("EDITOR"))

    os.Setenv("EDITOR", "emacs")

    fmt.Println("editor:", os.Getenv("EDITOR"))
}
```

## go list environment variables
> os.Environ returns a copy of strings representing the environment, in the form "key=value".
```go
package main

import (
    "fmt"
    "os"
    "strings"
)

func main() {

    for _, e := range os.Environ() {

        pair := strings.SplitN(e, "=", 2)
        fmt.Printf("%s: %s\n", pair[0], pair[1])
    }
}
```

### os.Expandenv
> a helper function which replaces the $var inside a string into the value of the given variable
```go
package main

import (
    "fmt"
    "os"
)

func main() {

    os.Setenv("EDITOR", "emacs")

    fmt.Println(os.ExpandEnv("My editor is $EDITOR."))
    fmt.Println(os.ExpandEnv("My shell is $SHELL."))

}

```

### external
* [pkg](https://pkg.go.dev/os)

