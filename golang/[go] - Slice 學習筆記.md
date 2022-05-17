## [go] - Slice  & Map 筆記

### Intro
[godev](https://go.dev/blog/slices-intro)

> A slice is a descriptor of an array segment. It consists of a pointer to the array, the length of the segment, and its capacity (the maximum length of the segment).



> 標準程式庫 sort 的 sort.Slice 函式用法。 可以接收任何一種slice。用來排序slice的函式。
```go
type Person struct {
    FirstName   string
    LastName    string
    Age         int
}

people := []Person {
    {"Pat", "Patterson", 37},
    {"Tracy", "Bobbert", 23},
    {"Fred", "Fredson", 18},
}

fmt.Println(people)

// 用 last name & closure 排序
sort.Slice(people, func(i int, j int)) bool {
    return people[i].LastName < people[j].LastName
})
fmt.Println(people)

// 用 age 來排序
sort.Slice(people, func(i int, j int) bool {
    return people[i].Age < people[j].Age
})

fmt.Println(people)

/*
Result:
[{"Pat", "Patterson", 37} {"Tracy", "Bobbert", 23} {"Fred", "Fredson", 18}]
[{"Tracy", "Bobbert", 23} {"Fred", "Fredson", 18} {"Pat", "Patterson", 37}]
[ {"Fred", "Fredson", 18} {"Tracy", "Bobbert", 23} {"Pat", "Patterson", 37}]
*/
```

### Syntax For **Map**
```go
    var map_name map[KeyType]ValueType
```

```go
    package main
    import "fmt"
    func main() {
        map_1 := map[string]string{
            "Jenna": "Sthapit"
        }
        for k, v := range map_1 {
            fmt.Printf("Key: %v\nValue: %s\n", k, v)
        }
    }
    /*
        output:
            Key:Jenna
            Value:Sthapit

    */
```

### Check for key in Go-Map
* Syntax to check if a **map** contains **key** in go
```go
    first_value, second_value := map_name[key_name]
```
> * first_value gives the value of **key**,
> * if map_name doesn't contain key_name, first_value will be default **zero**
> * second_value is a boolean, true if key_name is present in the map

### Interpret **first_value** and **second_value** in different ways to check whether **map_name** contains **key_name**
```go
    package main
    import "fmt"
    func main() {
        map_name := map[int]string{
            0: "Alok",
            1: "Reman",
            2: "Riken",
            3: "Rudra",
        }
        _, second_value_1 := map_name[1]
        fmt.Printf("second_value for 1: %t\n", second_value_1)

        _, second_value_9 := map_name[9]
        fmt.Printf("second_value for 9: %t\n", second_value_9)
    }
    /*
    second_value for 1: true
    second_value for 9: false
    */
```

###

```go
package main

import "fmt"

func main() {
    map_name := map[string]string{
        "Giri":     "Alok",
        "Nembang":  "Reman",
        "Maharjan": "Riken",
        "Jha":      "Rudra",
    }
    if first_value, second_value := map_name["Giri"]; second_value {
        fmt.Printf("Giri is present in map. Value is: %s\n", first_value)
    } else {
        fmt.Printf("Giri is not present in map.\n")
    }

    if first_value, second_value := map_name["Sthapit"]; second_value {
        fmt.Printf("Sthapit is present in map. Value is: %s\n", first_value)
    } else {
        fmt.Printf("Sthapit is not present in map. \n")
    }
}
/*
    Giri is present in map. Value is : Alok
    Sthapit is not present in map
*/
```

### Use **Range** and **append()** to Get a Slice of **Keys** from a **Map** in Go
```go
package main

import "fmt"

func main() {
    m: map[string]string {
        "animal": "Cat",
        "Car": "GMC",
        "Metal": "Gold",
    }

    keys := []string{}
    for key, _ := range m{
        keys = append(keys, key)
    }
    fmt.Println("Keys Slice: ", keys)
}

/*
    Keys Slice: [animal Car Metal]
*/
```

### Use **MapKeys** Function to Get a Slice of Keys From a Map in Go
```go
package main

import (
    "fmt"
    "reflect"
)

func main() {
    a:= map[string]string{
        "animal": "Cat",
        "Car": "GMC",
        "Metal": "Gold",
    }

    keys := reflect.ValueOf(a).MapKeys()
    fmt.Println("Keys Slice: ", keys)
    /*
    Output: Key Slice: [animal Car Metal]
    */
}
```

### go v1.18 experimental solution for slice object key value look up
[doc](https://pkg.go.dev/golang.org/x/exp/slices#IndexFunc)
[appleboy](https://blog.wu-boy.com/2022/02/golang-1-18-generics-constraints-slices-maps/)
```go
package main

import (
	"fmt"

	"golang.org/x/exp/slices"
)

type Config struct {
	Key   string
	Value string
}

func main() {
	var myconfig = []Config{
		{Key: "foo", Value: "bar"},
		{Key: "key1", Value: "test"},
		{Key: "web/key1", Value: "test2"},
	}

	idx := slices.IndexFunc(myconfig, func(c Config) bool { return c.Key == "key1" })

	fmt.Println(idx)
}

```