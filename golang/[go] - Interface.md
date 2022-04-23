## [go] - Type, Value, and Equality of Interfaces

### Interface Type
* consist of a set of method signatures.
* Variable of interface type can hold any value implementing these 'methods'

```go

type MyStringer interface {
    String() string
}

// both Temp and *Point implement the MyStringer intercace
type Temp int

func (t Temp) String() string {
  return strconv.Itoa(int(t)) + " °C"
}

type Point struct {
  x, y int
}

func (p *Point) String() string {
  return fmt.Sprintf("(%d, %d)", p.x, p.y)
}

// *Temp also implements MyStringer since the method set of a pointer type *T is the set of all methods with receiver *T or T

var x MyStringer

// when call a method on an interface value, the method of its underlying type is executed

x = Temp(24)
fmt.Println(x.String())   // 24 °C

x = &Point{1, 2}
fmt.Println(x.String())   // (1, 2)
```

### Structural Typing

* A type implements an interface by implementing its methods.
* No explicit declaration is required

```go
// Temp, *Temp, *Point types also implement standard library fmt.Stringer interface'
var x MyStringer

x = Temp(24)
fmt.Println(x)

x = &Point{1, 2}
fmt.Println(x)
```

### The Empty Interface
* Empty interface specify no method.

### Interface values
* Interface value consists of a concrete value and a dynamic type: [value, type]

```go
// in call to fmt.Printf, use %v to print the "concrete value" and %T to print "dynamic Type"

var x MyStringer
fmt.Printf("%v %T\n", x, x) // <nil> <nil>
// zero value of interface type is nil, represent [nil, nil]

x = Temp(24)
fmt.Printf("%v %T\n", x, x) // 24 °C main.Temp

x = &Point{1, 2}
fmt.Printf("%v %T\n", x, x) // (1,2) *main.Point

x = (*Point)(nil)
fmt.Printf("%v %T\n", x, x) // <nil> *main.Point
```

* Calling mewthod on a nil interface is a run-time error.
* It's quite common to write methods that can handle a receiver value [nil, Type], where type is not nil.

### Use fmt for a string type description
```go
// use %T flag in fmt package to get a Go-syntax representation of the type
var x interface{} = []int{1, 2, 3}
xType := fmt.Sprintf("%T", x)
fmt.Println(xType) // "[]int"

```
### Choose between with type switch
```go
var x interface{} = 2.3
switch v := x.(type) {
case int:
    fmt.Println("int:", v)
case float64:
    fmt.Println("float64:", v)
default:
    fmt.Println("unknown")
}
// Output: float64: 2.3
```

### Reflection gives full type information
```go
var x interface{} = []int{1, 2, 3}
xType := reflect.TypeOf(x)
xValue := reflect.ValueOf(x)
fmt.Println(xType, xValue)  // "[]int [1 2 3]
```


### Interface Embed (Inheritance)
```go
package main

import (
    "fmt"
)

type People interface {
    GetName() string
    GetAge() int
}

type Student interface {
    People  //embed
    GetScore() int
    GetSchool() string
}

type StudentImpl struct {
    name string
    age int
    score int
    school string
}

func NewStudent() Student {
    var s = new(StudentImpl)
    s.name = "Jack"
    s.age = 18
    s.score = 100
    s.school = "HighSchool"
    return s
}

func (a *StudentImpl) GetName() string {
    return a.name
}

func (a *StudentImpl) GetAge() int {
    return a.age
}

func (a *StudentImpl) GetScore() int {
    return a.score
}

func (a *StudentImpl) GetSchool() string {
    return a.school
}


func main() {
    var a = NewStudent()
    fmt.Println(a.GetName())
    fmt.Println(a.GetAge())
    fmt.Println(a.GetScore())
    fmt.Println(a.GetSchool())
}
```

### Interface 多形









