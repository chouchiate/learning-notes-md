### How to search for an element in a golang slice

* sort.Slice() plus sort.Search()
```go
type Person struct {
    Name string
}

func main() {
    crowd := []Person{{"Zoey"}, {"Anna"}, {"Benni"}, {"Chris"}}

    sort.Slice(crowd, func(i, j int) bool {
        return crowd[i].Name <= crowd[j].Name
    })

    needle := "Benni"
    idx := sort.Search(len(crowd), func(i int) bool {
        return string(crowd[i].Name) >= needle
    })

    if idx < len(crowd) && crowd[idx].Name == needle {
        fmt.Println("Found:", idx, crowd[idx])
    } else {
        fmt.Println("Found noting: ", idx)
    }
}
```