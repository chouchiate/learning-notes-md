## [go] - fmt

### explicit argument indexes
* the notation [n] before the verb indicate
    - the nth one-indexed argument is to be formatted instead
* the notation before a '*' for a width or precision selects the argument index holding the value

### example
```go
fmt.Sprintf("%[2]d %[1]d\n", 11, 22)
// "22 11"
```
```go
fmt.Sprintf("%[3]*.[2]*[1]f", 12.0, 2, 6)
// equivalent to fmt.Sprintf("%6.2f", 12.0)
```