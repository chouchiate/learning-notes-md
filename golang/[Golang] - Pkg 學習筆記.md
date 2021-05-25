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





## Package - test







## Package - regexp









