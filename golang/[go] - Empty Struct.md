## [go] - Empty Struct Notes

> struct type with no fields.
```go
type Q struct{}
type q struct{}
```

### Width
> Width descript the numbers of byres of storage an instance of a type occupies.
* Discover Width of any value using unsafe.Sizeof()
```go
var s string
var c complex128
fmt.Println(unsafe.Sizeof(s))   // 8
fmt.Println(unsafe.Sizeof(c))   // 16
```

* Width of array type is a multiple of element type
```go
var a [3]uint32
fmt.Println(unsafe.Sizeof(a))   //12
```

* structs provide defining composite types
* width of struct is the sum of the width of consituent types, plus padding
```go
type S struct {
    a uint16
    b uint32
}
var s S
fmt.Println(unsafe.Sizeof(s))   // 8, not 16
```