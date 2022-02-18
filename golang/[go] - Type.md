## Type Assertions & Type Switch

### Type Assertion
* Provide access to an interface's concrete value.
* Type Assertion x.(T) asserts the dynamic type of x 
  * if T is not interface, asserts dynamic type of x is identical to T.
  * if T is interface, asserts dynamic type of x implements T.
```go
var x interface {} = "foo"

var s string = x.(string)
fmt.Println(s)    // "foo"

s, ok := x.(string)
fmt.Println(s, ok)  // "foo true"

n, ok := x.(int)
fmt.Println(n, ok)  // " 0 false"

n = x.(int)         // ILLEGAL
```
```bash
panic: interface conversion: interface {} is string, not int
```

### Type Switches

* Performs several type assertions in 'series' and run first case with matching type

```go
var x interface{} = "foo"

switch v := x.(type) {
  case nil:
    fmt.Println("x is nil")
    
  case int:
    fmt.Println("x is", v)
    
  case bool, string:
    fmt.Println("x is bool or string")
    
  default:
    fmt.Println("type not processed")
    
}
```


