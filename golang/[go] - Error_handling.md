## [Go] - Error Handling

#### Create String base error
```go
// simple string-based error
err1 := errors.New("math: square root of negative number")

// with formatting
err2 := fmt.Errorf("math: square root of negative number %g", x)
```

#### Custom Error with Data
```go
type error interface {
    Error() string
}

// two examples
type SyntaxError struct {
    Line int
    Col  int
}

func (e *SyntaxError) Error() string {
    return fmt.Sprintf("%d:%d: syntax error", e.Line, e.Col)
}

type InternalError struct {
    Path string
}

func (e *InternalError) Error() string {
    return fmt.Sprintf("parse %v: internal error", e.Path)
}

/* If Foo is a function that can return a SyntaxError or an InternalError, you may handle the two cases like this. */

if err := Foo(); err != nil {
    switch e := err.(type) {
    case *SyntaxError:
        // Do something interesting with e.Line and e.Col.
    case *InternalError:
        // Abort and file an issue.
    default:
        log.Println(e)
    }
}
```

