## [go] Variadic Function 筆記

### **什麼是 Variadic Function?**

![](https://miro.medium.com/max/2000/1*VmY8owzjVTYfyfMgbIJ1eQ.png)

* Simple Variadic Function 
  - 這個 func 輸入 slice of strings, 回傳用 space 分開的 string 
```go
func toFullname(names ...string) string {
  return strings.Join(names, " ")
}
```
> 可接受 ***變動數量*** 輸入值 (0 or more)
```go
toFullname("carl", "sagan")
// output: "carl sagan"
toFullname("carl")
// output: "carl"
toFullname()
// output: ""

```

### 何時使用 Variadic Func?
* 簡化需要建立 temp slice 來傳給 func 
* 當輸入 param 數量不確定時
* 易讀性 表現 func 功能

### variadic Println
```go
  // declaration
  func Println(a ...interface{})
  // to use
  fmt.Println("hello", "world")
  fmt.Println("hello")
  fmt.Println()
```
### non-variadic Prinln
```go
  // declaration
  func Println(params []interface{})
  // to use
  fmt.Println([]interface{}{"hello", "world"})
```

### Common Usage Patterns
  > Variadic param is a syntactic sugar for an input parameter of a slice type... ^_^

* 若沒有傳傳值到 variadic function 內部 param 為 nil slice

```go
import (
	"fmt"
	"strings"
)

func toFullname(names ...string) string {
	/*

	   names variadic param is a slice inside here:

	*/
	fmt.Printf(`
        slice    : %#v
        values   : %s
        length   : %d
        capacity : %d`+
		"\n\n",
		names,
		strings.Join(names, ", "),
		len(names),
		cap(names))

	return strings.Join(names, " ")
}

func main() {
	// output: carl sagan
	fmt.Println(toFullname("carl", "sagan"))
}
```

> 當 append 一個值給 nil slice 它將不再是 nil. (Append 本身也是一個 variadic func)
```go
func toFullname(names ...string) []string {
  return append(names, "hey", "what's up?")
}
toFullname()
// output: [hey what's up?]
```

> 傳 existing slice 到 variadic func
```go
names := []string{"carl", "sagan")}
toFullname(names...)
// output: "carl sagan"

// 不全然等於
toFullname("carl", "sagan")

```
> 因為 variadic func 會沿用傳入的 slice 而不是建一個新 slice
```go
// 也可以傳 array 到 variadic func
names := [2]string{"carl", "sagan"}
toFullname(names[:]...)

```
> variadic func 和量子力學一樣有 spooky action
```go
// 傳一個已建
dennis := []string{"dennis", "ritchie"}
toFullname(dennis...)

```
