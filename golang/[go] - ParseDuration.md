## [go] - ParseDuration Formatting

> ParseDuration解析持續時間字符串。持續時間字符串是可能帶符號的十進製數字序列，每個序列都有可選的分數和一個單位後綴，例如"300ms"，"-1.5h"或"2h45m"。有效時間單位為"ns"，"us"(或"µs")，"ms"，"s"，"m"，"h"。

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    hours, _ := time.ParseDuration("10h")
    complex, _ := time.ParseDuration("1h10m10s")
    micro, _ := time.ParseDuration("1µs")
    // The package also accepts the incorrect but common prefix u for micro.
    micro2, _ := time.ParseDuration("1us")

    fmt.Println(hours)
    fmt.Println(complex)
    fmt.Printf("There are %.0f seconds in %v.\n", complex.Seconds(), complex)
    fmt.Printf("There are %d nanoseconds in %v.\n", micro.Nanoseconds(), micro)
    fmt.Printf("There are %6.2e seconds in %v.\n", micro2.Seconds(), micro)
```

```output
Time Duration 1: 5h0m0s
Time Duration 2: 2h30m40s
There are 9040 seconds in 2h30m40s.
There are 3000 nanoseconds in 3µs.
There are 3.00e-06 seconds in 3µs.
```

```go
// Golang program to illustrate
// how to find time duration
package main

import (
    "fmt"
    "time"
)

func main() {

    // Using ParseDuration() function
    hr, _:= time.ParseDuration("3h")
    comp, _:= time.ParseDuration("5h30m40s")

    fmt.Println("Time Duration 1:", hr)
    fmt.Println("Time Duration 2:", comp)

}
```

```output
Time Duration 1: 3h0m0s
Time Duration 2: 5h30m40s

```