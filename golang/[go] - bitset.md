## [go] - biset and bitmask

#### **Bitmask**
```go
type Bits uint8

const (
    F0 Bits = 1 << iota
    F1
    F2
)

func Set(b, flag Bits) Bits    { return b | flag }
func Clear(b, flag Bits) Bits  { return b &^ flag }
func Toggle(b, flag Bits) Bits { return b ^ flag }
func Has(b, flag Bits) bool    { return b&flag != 0 }

func main() {
    var b Bits
    b = Set(b, F0)
    b = Toggle(b, F2)
    for i, flag := range []Bits{F0, F1, F2} {
        fmt.Println(i, Has(b, flag))
    }
}
/*
0 true
1 false
2 true
*/
```

#### **large bitset**
[github](github.com/yourbasic/bit)
```go
// Sieve of Eratosthenes
import (
    "github.com/yourbasic/bit"
)
const n = 50
sieve := bit.New().AddRange(2, n)
sqrtN := int(math.Sqrt(n))
for p := 2; p <= sqrtN; p = sieve.Next(p) {
    for k := p * p; k < n; k += p {
        sieve.Delete(k)
    }
}
fmt.Println(sieve)
/*
    Output
    {2 3 5 7 11 13 17 19 23 29 31 37 41 43 47}
*/
```
