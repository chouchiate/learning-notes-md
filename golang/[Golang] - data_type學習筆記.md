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



### Type - Slice



### Slice Operation





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









