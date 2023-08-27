## [go] - Language Specification 學習筆記

#### Lexical elements




#### Statements

* Defer Statement
	* Defers execution of a function until the surrounding function returns


* Expression Statement
```go
// non-simple statements
import "time"
var a = 123
const B = "Go"
type Choice bool

func f() int {
	for a < 10 {
		break
	}

	return 567
}
```
```go
// simple statements
c := make(chan bool)
a = 678
a += 5
a = f()	// f() is an expression
a++
a--
c <- true	// channel send operation
z := <- c	// channel receive operation used as a source value assginment

```
```go
// some expressions
123
true
B
B + " language"
a - 789
a > 0 // an untyped boolean value
f			// a function value of type "func ()"

f()
<-c
```


* Labeled statements

	```go
		Error: log.Panic("error encountered")
	```