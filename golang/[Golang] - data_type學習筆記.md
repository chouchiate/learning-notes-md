## Golang - Data Type 學習筆記



| Value Types | Reference Types |
| ----------- | --------------- |
| int         | slices          |
| Float       | Maps            |
| string      | Channels        |
| Bool        | Pointers        |
| Structs     | Functions       |
|             |                 |



## Concrete vs Interface

- concrete type
- interface type

## Type Casting - 型別轉換

T(v) - 可將 variable v 轉成 Type T

```go
func main () {
  i := 42					// int
  f := float64(i)	// int -> float64
  u := uint(f)		// float64 -> uint
}
```



### Type - Struct

```go
// declaration

type Auth struct {
  JWT
  Password
}

type JWT struct {
  Issuer			string		`default:"issuer"`
  ExpireHours	int				`default:"1296"`
  Secret			string		`default:"i-love-you"`
}

type Password struct {
  Strength		int				`default:"10"`
  Salt				string		`default:"tf"`
}

```
### Struct Tags
**Golang Wiki - [連結](https://github.com/golang/go/wiki/Well-known-struct-tags)**

* 處理 XML, JSON and other encoding package 資料使用
* Well known struct tags List:

| Tag | Documentation |
| --- | ------------- |
| xml | https://godoc.org/encoding/xml |
| json | https://godoc.org/encoding/json | 
| bson | https://godoc.org/labix.org/v2/mgo/bson, https://godoc.org/go.mongodb.org/mongo-driver/bson/bsoncodec |
| bigquery | https://godoc.org/cloud.google.com/go/bigquery |


### Type - Interfaces

* Interfaces are named collections of "method signatures"
* Defined as a set of method signatures
* Value of interface type can hold any value that implements those methods

```go
package main

import (
	"fmt"
  "math"
)
// geometry interface
type geometry interface {
  area() float64
  perim() float64
}

type rect struct {
  width, height float64
}

type circle struct {
  radius float64
}

// implement all methods in the interface.
// implement geometry on rects
func (r rect) area() float64 {
  return r.width
}
func (r rect) perim() float64 {
  return 2*r.width + 2*r.height
}
// implement geometry on circle
func (c circle) area() float64 {
  return math.Pi * c.radius * c.radius
}
func (c circle) perim() float64 {
  return 2 * math.Pi * c.radius
}

func measure(g geometry) {
  fmt.Println(g)
  fmt.Println(g.area())
  fmt.Println(g.perim())
}

func main() {
  r := rect{width: 3, height: 4}
  c := circle{radius: 5}
  
  measure(r)
  measure(c)
}

```



### Type - Slice
> The slice type is an abstraction built on top of Go's array type

* The type specification for a slice is []T, where T is the type of the elements of the slice
* slice type has no specified length



### Slice Operation
> slice literal:
```go
letters := []string{"a", "b", "c", "d"}
```
> create slice with built-in function **Make**
```go
func make([]T, len, cap) []T

```
* T stands for the element type of the slice to be created. 
* The make function takes a ***type***, a ***length***, and an ***optional capacity***. 
* When called, make allocates an array and returns a slice that refers to that array.
* A slice is a descriptor of an array segment. It consists of a pointer to the array, the length of the segment, and its capacity (the maximum length of the segment).
* Slicing does not copy the slice's data. It creates a new slice value that points to the original array.

[Slice Intro](https://blog.golang.org/slices-intro)
#### Remove Elements from a slice

```go
```


## Byte Slice to String (and vice versa)

```go
func main() {
  hello := "Hello World"											// string
  helloSlice := string2ByteSlice(hello)				// slice of byte
  fmt.Println(helloSlice)
  helloString := byteSlice2String(helloSlice)	// string
  fmt.Println(helloString)
}

func byteSlice2String( b [] byte ) string {
  return string(b)
}

func string2ByteSlice ( s string ) [] byte {
  return [] byte(s)
}
```

### Type - Array
An array type definition specifies a length 
and an element type. An array's size is fixed; 
```go
var a [4]int
a[0] = 1
i := a[0]
// i == 1
```
* Go's arrays are values. 
* An array variable denotes the entire array; 
* ***it is not a pointer*** to the first array element (as would be the case in C).

> An array literal can be specified as
```go
b := [2]string{"Penn", "Teller"}
```
> Or, can have the compiler count the array elements
```go
b := [...]string{"Penn", "Teller"}

```

### Type - String

> String Builder Go v1.10 or later



### Type - Map 

* A map maps keys to values.
* Map 中的所有 Key & Value 型別必須一樣
* The make function returns a map of the given type, initialized as nil.

### Map Operation

#### Create new map

```go
type Vertex struct {
  lat, long float64
}

var m map[string]Vertex

func main() {
  //使用 make 建立 map
  m = make(map[string]Vertex)
  m["Bell Labs"] = Vertex { 40.68433, -74.39967 }
  // initial nil map
  n := map[string]Vertex{}
  // := map assignment
  o := map[string]Vertex{ "Bell Labs": { 40.68433, -74.39967 } }
  fmt.Println(m,n,o)
}
```



## Range 

- Loop iteration over slice or map
- Range over slice returns index, copy of element at index

```go
var pow = [] int { 1,2, 4, 8, 16, 32, 64, 128}
func main() {
  for i, v := range pow {
    fmt.Println("2**%d = %d\n",i,v)
  }
}
```



## Pointer Receiver

* Function with pointer receiver can modify value to which receiver points
* Function must have pointer receiver to change value pointed to where the function is called
* Use value.function syntax to call 

```go
type Vertex struct {
  X, Y float64
}
func (v Vertex) Abs() float64 {
  return math.Sqrt(v.X*v.X + v.Y*v.Y)
}
func (v *Vertex) Scale (f float64) {			// <-- change 
  v.X = v.X * f
  v.Y = v.Y * f
}
func main() {
  v := Vertex{3,4}
  v.Scale(10)
  fmt.Println(v.Abs())	// print 50
  
  //print 5 if change to func(v Vertex) Scale (f flaot64) {
}
```









