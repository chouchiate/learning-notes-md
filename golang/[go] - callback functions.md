## [go] - callback functions
* Passing a function as an argument

## example 1
* checking whether a given sequence is in AP (arithmetic progression) or in GP (geometric progression) by using callback
```go
package main

import (
   "fmt"
   "io"
   "os"
)
// function lookup/jump table
var ConditionMap = map[string]func(int, int) int{
   "AP": func(i1 int, i2 int) int {
      return i2 - i1
   },
   "GP": func(i1 int, i2 int) int {
      return i2 / i1
   },
}

func main() {
   var seqLen int
   fmt.Scan(&seqLen)

   s := make(Sequence, seqLen)
   s.ReadInput(os.Stdin)

   switch {
   case s.ExamineProgression(ConditionMap["AP"]):
      fmt.Println("AP")
   case s.ExamineProgression(ConditionMap["GP"]):
      fmt.Println("GP")
   default:
      fmt.Println("RANDOM")
   }
}

type Sequence []int

func (s Sequence) ReadInput(r io.Reader) {
   for j := 0; j < len(s); j++ {
      fmt.Fscan(r, &s[j])
   }
}

func (s Sequence) ExamineProgression(condition func(a, b int) int) bool {
   if len(s) < 3 {
      return false
   }
   d := condition(s[1], s[0])
   for i := 2; i < len(s)-1; i++ {
      if condition(s[i+1], s[i]) != d {
         return false
      }
   }
   return true
}
```