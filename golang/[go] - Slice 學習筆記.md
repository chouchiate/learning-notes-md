## [go] - Slice 筆記

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



