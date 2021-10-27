## Printf

#### Print Value of Slice
```go
s := []string{"foo", "bar", "baz"}
fmt.Println(strings.Join(s, ", "))
// output: foo, bar, baz
```

```go
 fmt.Printf("%+q", arr) // which will print

// ["some" "values" "list"]
```

[pretty print package](https://pkg.go.dev/github.com/kr/pretty)
```go
import "github.com/kr/pretty"
pretty.Print(...)
