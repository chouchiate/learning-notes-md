## [Golang] - Pkg 學習筆記



### Package - strconv

- API - https://golang.org/pkg/strconv/

```go
// string to int
i, err := strconv.atoi("-42")
// int to string
s := strconv.Itoa(-42)
// convert string to value
b, err := strconv.ParseBool("true")
f, err := strconv.ParseFloat("3.1415", 64)
c, err := strconv.ParseInt("-42", 10, 64)
u, err := strconv.ParseUint("42", 10, 64)
// convert value to string
z := strconv.FormatBool(true)
y := strconv.FormatFloat(3.1415, 'E', -1, 64)
x := strconv.FormatInt(-42, 16)
v := strconv.FormatUint(42, 16)

fmt.Println(i,s,b,f,c,u,z,y,x,v)
```



### Package - test



### Package - regexp



### Package - time

- API - https://golang.org/pkg/time/

```go
// Format
const (
    ANSIC       = "Mon Jan _2 15:04:05 2006"
    UnixDate    = "Mon Jan _2 15:04:05 MST 2006"
    RubyDate    = "Mon Jan 02 15:04:05 -0700 2006"
    RFC822      = "02 Jan 06 15:04 MST"
    RFC822Z     = "02 Jan 06 15:04 -0700" // RFC822 with numeric zone
    RFC850      = "Monday, 02-Jan-06 15:04:05 MST"
    RFC1123     = "Mon, 02 Jan 2006 15:04:05 MST"
    RFC1123Z    = "Mon, 02 Jan 2006 15:04:05 -0700" // RFC1123 with numeric zone
    RFC3339     = "2006-01-02T15:04:05Z07:00"
    RFC3339Nano = "2006-01-02T15:04:05.999999999Z07:00"
    Kitchen     = "3:04PM"
    // Handy time stamps.
    Stamp      = "Jan _2 15:04:05"
    StampMilli = "Jan _2 15:04:05.000"
    StampMicro = "Jan _2 15:04:05.000000"
    StampNano  = "Jan _2 15:04:05.000000000"
)

```



### Package - encoding/json

- API - https://golang.org/pkg/encoding/json/







